# frozen_string_literal: true

require "json"
require "time"
require "fileutils"

# Preload Disk Cache
def preload_disk_cache(search_paths)
  search_paths.each do |path|
    system("find '#{path}' -type f > /dev/null 2>&1")
  end
  puts "Disk cache preloaded for search paths."
end

history_file = File.expand_path "#{ENV['alfred_workflow_data']}/fzf-search-history.txt"
max_search_history = ENV["max_search_history"].to_i

fd_path       = ENV["fd_path"]     || "fd"
fzf_path      = ENV["fzf_path"]    || "fzf"
memorize      = ENV["memorize"].to_i == 1 ? true : false

search_paths  = ENV["search_home"] || ENV["search_path"]
search_paths  = search_paths.split(/\s*;\s*/)
search_paths = search_paths.map do |search_path|
  path = File.expand_path(search_path)
  File.exist?(path) ? path : nil
end.compact.uniq

search_paths = [] unless search_paths.is_a?(Array)

fd_options     = ENV["fd_options"]     || "--type f --color=never"
num_candidates = ENV["num_candidates"] || "100"
num_candidates = num_candidates.to_i

keys = ARGV.join(" ").gsub("　", " ").split(/\s+/)
query = +""
keys.each do |key|
  if /\A(?:\^|\-)(?:d|dir|directory)\z/ =~ key
    fd_options = "--type d --color=never"
  elsif /\A(?:\^|\-)(?:f|file)\z/ =~ key
    fd_options = "--type f --color=never"
  else
    query << key + " "
  end
end

query.strip!

results = []

search_paths.each do |search_path|
  if /\A\/Users\/[^\/]+\z/ =~ search_path
    fd_options += " --exclude Library" 
  end
  results_all = `#{fd_path} . "#{search_path}" #{fd_options} 2> /dev/null | #{fzf_path} -e --filter="#{query}" --print0`
  results += results_all.split("")[0...num_candidates]
end

items = []
type = "file:skipcheck"

if results.size > 0
  results.each do |result|
    path_split = result.split(File::SEPARATOR)
    title = File::SEPARATOR + path_split[-2 .. -1].join(File::SEPARATOR)
    subtitle = path_split[0 ... -2].join(File::SEPARATOR)
    item = {
      "valid": true,
      "type": type,
      "title": title,
      "subtitle": subtitle,
      "arg": result,
      "icon": {
        "type": "fileicon",
        "path": result
      }
    }
    if memorize
      # uid = Digest::MD5.hexdigest(result)
      item["uid"] = result
    end
    items << item
  end
  unless ENV["history_search"]
    prepend_line_to_file(history_file, "#{Time.new} | #{query}", max_search_history)
  end
else
  items << {
    "title": "No results found",
    "valid": false
  }
end

jsonout = {"items": items}.to_json 

print jsonout

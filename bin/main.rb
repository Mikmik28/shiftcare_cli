#!/usr/bin/env ruby

require_relative '../lib/client_loader'
require_relative '../lib/client_searcher'

command = ARGV[0]
source = ARGV[1]
query  = ARGV[2]

if command.nil? || source.nil?
  puts "Usage:"
  puts "  ruby bin/main.rb search <url_or_path> <query>"
  puts "  ruby bin/main.rb duplicates <url_or_path>"
  exit
end

clients = ClientLoader.load(source)

case command
when 'search'
  if query.nil?
    puts "Please provide a search query."
    exit
  end

  results = ClientSearcher.search_by_name(clients, query)
  puts "\nFound #{results.size} matching client(s):"
  results.each { |c| puts c.to_h }

when 'duplicates'
  results = ClientSearcher.find_duplicates(clients)
  if results.empty?
    puts "No duplicate emails found."
  else
    puts "Duplicate email clients:"
    results.each { |c| puts c.to_h }
  end

else
  puts "Unknown command: #{command}"
end

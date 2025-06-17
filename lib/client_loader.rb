require 'json'
require 'open-uri'
require_relative 'client'

class ClientLoader
  def self.load(source)
    raw_data = if source =~ URI::regexp
                 URI.open(source).read
               else
                 File.read(source)
               end

    data = JSON.parse(raw_data)
    data.map { |attrs| Client.new(attrs) }

  rescue OpenURI::HTTPError => e
    puts "Error fetching URL: #{e.message}"
    []
  rescue Errno::ENOENT
    puts "File not found: #{source}"
    []
  rescue JSON::ParserError
    puts "Invalid JSON format in: #{source}"
    []
  end
end

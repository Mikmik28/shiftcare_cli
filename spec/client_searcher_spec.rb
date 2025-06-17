require_relative "../lib/client"
require_relative "../lib/client_searcher"

RSpec.describe ClientSearcher do
  let(:clients) do
    [
      Client.new("full_name" => "Alice Smith", "email" => "alice@example.com"),
      Client.new("full_name" => "Bob Jones", "email" => "bob@example.com"),
      Client.new("full_name" => "Alison Smither", "email" => "alice@example.com") # duplicate email
    ]
  end

  describe ".search_by_name" do
    it "finds clients matching the query" do
      results = ClientSearcher.search_by_name(clients, 'ali')
      expect(results.map(&:full_name)).to include("Alice Smith", "Alison Smither")
    end

    it "returns empty array when no matches found" do
      results = ClientSearcher.search_by_name(clients, "Zach")
      expect(results).to be_empty
    end
  end

  describe ".find_duplicates" do
    it "returns clients with duplicate emails" do
      duplicates = ClientSearcher.find_duplicates(clients)
      expect(duplicates.map(&:email)).to include("alice@example.com")
      expect(duplicates.size).to eq(2)
    end

    it "returns empty array if no duplicates found" do
      unique_clients = clients.uniq { |c| c.email }
      duplicates = ClientSearcher.find_duplicates(unique_clients)
      expect(duplicates).to be_empty
    end
  end
end

require_relative "../lib/client"

RSpec.describe Client do
  context "splits full name into first and last name" do
    let(:client) { Client.new("full_name" => "John Doe", "email" => "jane@example.com") }

    it { expect(client.first_name).to eq("John") }
    it { expect(client.last_name).to eq("Doe") }
  end

  context "handles names with more than two parts" do
    let(:client) { Client.new("full_name" => "Anna Maria Smith", "email" => "anna@example.com") }

    it { expect(client.first_name).to eq("Anna") }
    it { expect(client.last_name).to eq("Maria Smith") }
  end

  context "handles empty full_name gracefully" do
    let(:client) { Client.new("full_name" => "", "email" => "no@example.com") }

    it { expect(client.first_name).to eq(nil) }
    it { expect(client.last_name).to eq("") }
  end
end

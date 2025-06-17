require_relative "../lib/client_loader"

RSpec.describe ClientLoader do
  let(:valid_url) { "https://appassets02.shiftcare.com/manual/clients.json" }
  let(:invalid_url) { "http://invalid-url.com/nope.json" }

  it "loads clients from valid URL", :real_network do
    clients = ClientLoader.load(valid_url)
    expect(clients).to be_an(Array)
    expect(clients.first).to respond_to(:full_name)
  end

  it "returns empty array for invalid URL" do
    allow(URI).to receive(:open).and_raise(OpenURI::HTTPError.new("404 Not Found", nil))
    clients = ClientLoader.load(invalid_url)
    expect(clients).to eq([])
  end

  it "returns empty array for invalid JSON" do
    allow(URI).to receive(:open).and_return(StringIO.new("invalid json"))
    clients = ClientLoader.load("http://fake-url.com")
    expect(clients).to eq([])
  end
end

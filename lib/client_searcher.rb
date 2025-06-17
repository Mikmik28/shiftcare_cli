class ClientSearcher
  def self.search_by_name(clients, query)
    query = query.downcase
    clients.select do |client|
      client.full_name.downcase.include?(query)
    end
  end

  def self.find_duplicates(clients)
    grouped = clients.group_by(&:email)
    grouped.select { |_, list| list.size > 1 }.values.flatten
  end
end

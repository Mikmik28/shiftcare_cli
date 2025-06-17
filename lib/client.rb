class Client
  attr_reader :full_name, :email

  def initialize(attrs = {})
    @full_name = attrs['full_name']
    @first_name, @last_name = split_name
    @email = attrs['email']
  end

  def split_name
    return [nil, ''] if @full_name.nil? || @full_name.strip.empty?

    parts = @full_name.to_s.strip.split
    [parts.first, parts[1..].join(' ')]
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def to_h
    {
      first_name: first_name,
      last_name: last_name,
      email: email
    }
  end
end

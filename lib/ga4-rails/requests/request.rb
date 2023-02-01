class Ga4Rails::Request
  def self.call(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError
  end
end

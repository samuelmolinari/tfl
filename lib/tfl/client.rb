class ::Tfl::Client

  attr_accessor :app_id, :app_key

  def initialize(options = {})
    options.each do |key,value|
      instance_variable_set("@#{key}", value)
    end

    yield(self) if block_given?
  end

  def credentials
    {
      app_id: @app_id,
      app_key: @app_key
    }
  end

end

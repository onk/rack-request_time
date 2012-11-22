require "active_support/core_ext"

module Rack
  class RequestTime
    def initialize(app)
      @app = app
    end

    def call(env)
      self.class.current = Time.current
      @app.call(env)
    end

    def self.current
      Thread.current[:_rack_request_time]
    end

    def self.current=(now)
      Thread.current[:_rack_request_time] = now
    end
  end
end


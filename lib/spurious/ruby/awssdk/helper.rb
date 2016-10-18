require "spurious/ruby/awssdk/helper/version"
require 'spurious/ruby/awssdk/strategy'
require "aws-sdk"
require "json"
require "uri"

module Spurious
  module Ruby
    module Awssdk
      module Helper

        def self.port_config
          config = `spurious ports --json`
          JSON.parse(config)
        rescue Exception
          raise("The spurious CLI tool didn't return the port configuration")
        end

        def self.docker_config
          {
            "spurious-dynamo" => [
              {
                "Host"     => "dynamo.spurious.localhost",
                "HostPort" => 3000
              }
            ],
            "spurious-sqs" => [
              {
                "Host"     => "sqs.spurious.localhost",
                "HostPort" => 4568
              }
            ],
            "spurious-s3" => [
              {
                "Host"     => "s3.amazonaws.com",
                "HostPort" => 4569
              }
            ]
          }
        end

        def self.config(type)
          case type
          when :cli
            port_config
          when :docker
            docker_config
          end
        end

        def self.configure(type = :cli, strategy = nil)
          strategy ||= Spurious::Ruby::Awssdk::Strategy.new(true)
          strategy.apply(config(type))
        end
      end
    end
  end
end

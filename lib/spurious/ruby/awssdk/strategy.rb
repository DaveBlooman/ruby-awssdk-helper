require "spurious/ruby/awssdk/helper/version"
require "aws-sdk"

module Spurious
  module Ruby
    module Awssdk
      class Strategy
        attr_accessor :mapping

        def initialize(set_all = false)
          @mapping = {}
          if set_all then
            dynamo
            sqs
            s3
          end
        end

        def dynamo(port = true, ip = true)
          mapping['spurious-dynamo'] = {
            'port'       => port,
            'ip'         => ip,
            'identifier' => 'dynamo_db'
          }
        end

        def sqs(port = true, ip = true)
          mapping['spurious-sqs'] = {
            'port'       => port,
            'ip'         => ip,
            'identifier' => 'sqs'
          }
        end

        def s3(port = true, ip = true)
          mapping['spurious-s3'] = {
            'port'       => port,
            'ip'         => ip,
            'identifier' => 's3'
          }
        end

        def apply(config)
          mapping.each do |type, mappings|
            ports = config[type]
            AWS.config("#{mappings['identifier']}_port".to_sym => ports.first['HostPort']) if mappings['port']
            AWS.config("#{mappings['identifier']}_endpoint".to_sym => ports.first['Host']) if mappings['ip']
          end

          AWS.config(:use_ssl => false, :s3_force_path_style => true)

        end

      end
    end
  end
end

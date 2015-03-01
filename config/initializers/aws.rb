require 'aws-sdk-core'
Aws.config[:ssl_ca_bundle] = Rails.root.join('lib/ca-bundle.crt').to_s
Aws.config[:ssl_verify_peer] = false
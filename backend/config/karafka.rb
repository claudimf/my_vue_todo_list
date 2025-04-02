# frozen_string_literal: true

require 'karafka'

class KarafkaApp < Karafka::App
  setup do |config|
    config.client_id = 'todo_app'
    config.kafka.seed_brokers = ['kafka://kafka:9092']
    config.backend = :inline
  end
end
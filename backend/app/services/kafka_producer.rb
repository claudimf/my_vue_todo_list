# require 'waterdrop'

class KafkaProducer
  def self.publish(topic, message)
    KarafkaApp.producer.produce_sync(topic: topic, payload: message.to_json)
  end
end
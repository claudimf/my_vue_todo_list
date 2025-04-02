require 'waterdrop'

class KafkaProducer
  def self.publish(topic, message)
    producer = WaterDrop::SyncProducer.new
    producer.produce_sync(topic: topic, payload: message.to_json)
  end
end
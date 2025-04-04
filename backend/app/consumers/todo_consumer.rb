class TodoConsumer < ApplicationConsumer
  def consume

    messages.each do |message|
      puts "\nMessage object: #{message}"
      puts "Raw message: #{message.payload}"
      puts "Topic: #{message.topic}"

      begin
        
        event = message.payload
        process_event(event)
      
      rescue => e
        puts "Generic Error: #{e.message}"
        puts e.backtrace.join("\n")
      end
    end
  end

  private

  def process_event(event)
    case event["action"]
    when 'created'
      puts "New ToDo Created: #{event["to_do"]["title"]}"
    when 'updated'
      puts "ToDo Updated: #{event["to_do"]["title"]}, Completed: #{event["to_do"]["completed"]}"
    when 'deleted'
      puts "ToDo Deleted: #{event["to_do"]["id"]}"
    else
      puts "Unknown Event: #{event}"
    end
  end
end
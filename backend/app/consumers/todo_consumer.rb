class TodoConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      event = message.payload.deep_symbolize_keys
      process_event(event)
    end
  end

  private

  def process_event(event)
    case event[:action]
    when 'created'
      puts "New ToDo Created: #{event[:todo][:title]}"
    when 'updated'
      puts "ToDo Updated: #{event[:todo][:title]}, Completed: #{event[:todo][:completed]}"
    when 'deleted'
      puts "ToDo Deleted: #{event[:todo][:id]}"
    else
      puts "Unknown Event: #{event}"
    end
  end
end
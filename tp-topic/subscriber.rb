require 'amqp'

AMQP.start do |connection|
  channel  = AMQP::Channel.new(connection)
  exchange = channel.fanout("polycloud.email")

  channel.queue("send_to_staff", auto_delete: true).bind(exchange).subscribe do |payload|
    puts "#{payload} => send_to_staff"
  end
end

require 'sinatra/base'
require 'amqp'

class Publisher < Sinatra::Base

  get '/' do
    erb :home
  end

  post '/publish' do
    publish params[:email]
    "Published #{params[:email]}"
  end

  def publish(email)
    AMQP.start do |connection|
      channel  = AMQP::Channel.new(connection)
      exchange = channel.fanout("polycloud.email")
      exchange.publish(email) do
        connection.close { EventMachine.stop }
      end
    end
  end
end

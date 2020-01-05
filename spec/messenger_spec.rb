require 'messenger'
require 'time'
require 'twilio-ruby'
require 'dotenv'

describe Messenger do
 
  subject(:messenger) { described_class.new(config, client) } # Twilio client
  let(:client) { double(:client, messages: messages) } # a chain of mocks - the client double receives the method messages and returns a double called messages
  let(:messages) { double(:messages) }
  let(:config) do # configuration hash 
    {
      
      #account_sid: ENV['TWILIO_ACCOUNT_SID'],
      #auth_token: ENV['TWILIO_AUTH_TOKEN'],
      #from: ENV['TWILIO_NUMBER'],
      #to: ENV['CUSTOMER_NUMBER'],
      account_sid: "abcd",
      auth_token: "efghi",
      from: "+123456",
      to: "+7869493",
      body: "Thank you for ordering with Sin City Slice. Your order will be delivered before %s"
      # body: "Thank you for your order! Your order was placed at #{current_time} and will be delivered before #{delivery_time}"
    }
  end

    it 'sends a text with the estimated time time of delivery' do
      args = {
        from: config[:from],
        to: config[:to],
        # body: "Thank you for your order! Your order was placed at #{current_time} and will be delivered before #{delivery_time}"
        body: "Thank you for ordering with Sin City Slice. Your order will be delivered before 18:52"
      }
      allow(Time).to receive(:now).and_return(Time.parse("17:52")) # Time is an object  allows us to specify a specific time
      #messenger.send_text # basically setting the current time to always be 5.52 so our message will say delivery will arrived before 6.52
      expect(messages).to receive(:create).with(args)
      messenger.send_text
  
    end 



end 
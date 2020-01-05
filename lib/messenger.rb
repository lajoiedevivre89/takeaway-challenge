require 'twilio-ruby' # library 
require 'time'


class Messenger
  attr_reader :client, :config 
 
  
  TIME = "%d of %B, %Y"

  def initialize(config, client) # Inject Twilio client into the Messenger class
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end 

  def send_text
    client.messages.create(message_args) # Violates the Law of Demeter
  end 

  
  def message_args # this method returns the values of the keys [:from] and [:to]
    { 
      from: config[:from], # returns the Twilio number "+178*****"
      to: config[:to], # returns the Customer number  (my number) "+4478******"
      body: config[:body] % expected_delivery_time    # string formatting  returns the actual body of the text - the actual wording
    }                            
  end 

  def expected_delivery_time  # the output of this message is found at the end of the body 
    #current_time = Time.new
    # delivery_time = current_time + 10 * 360
     #puts "Thank you for your order! Your order was placed at #{current_time} and will be delivered before #{delivery_time} 
    (Time.now + 10 * 360).strftime(TIME)
  end 
end

   # def time
    # current_time = Time.new
    # delivery_time = current_time + 10 * 360
    # puts "Your order was placed at #{current_time} and will be delivered before #{delivery_time}"
   # end 





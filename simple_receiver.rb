require 'rubygems'
require 'eventmachine' 
require 'pp'               
require 'snmp'

module SnmpServer
   def receive_data data 
       begin
       puts "Message Received:\n------------------------"
       message = SNMP::Message.decode(data)  
       pp message                                     
     rescue => e
        puts "Error receiving message: #{e}"
     end
   end
end         

if ARGV.size < 2
  puts "USAGE: ip_address [port]"
  puts "Example: 127.0.0.1 166"
  exit
end

@ip_address = ARGV[0]
@port = ARGV[1]|| 162

puts "Simple SMTP Trap Receiver listening on #{@ip_address}:#{@port}..."
EventMachine::run {
   EventMachine::open_datagram_socket @ip_address, @port, SnmpServer
}

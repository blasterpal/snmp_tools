require 'rubygems'
require 'snmp'

if ARGV.size < 3
  puts "USAGE: host port oid" 
  puts "Example: localhost 1666 1.3.6.1.4.1.10300.1.1.1.12"
  exit
end

SNMP::Manager.open(:Host => ARGV[0],:TrapPort => ARGV[1], :Version => :SNMPv2c) do |snmp|
x=snmp.trap_v2( Time.now.to_i,
ARGV[2]
)

end
  
# tcp_server.rb
require 'socket'
server = TCPServer.new 5678

while session = server.accept
  puts "Accepted a connection at #{Time.now}"
  session.puts "Hello world! The time is #{Time.now}"
  session.close
end
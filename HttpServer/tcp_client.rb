# tcp_client.rb
require 'socket'

host = 'blog.appsignal.com' 
port = 80
path = '/2016/11/23/ruby-magic-building-a-30-line-http-server-in-ruby.html'

request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open host, port
socket.print request

response = socket.read
headers, body = response.split "\r\n\r\n", 2

puts body

socket.close
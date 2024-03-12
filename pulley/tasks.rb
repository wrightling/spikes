require 'faraday'
require 'pry'

URL = 'https://ciphersprint.pulley.com/task_'
tasks = [52,48,99,102,55,56,54,100,48,50,55,54,99,102,49,53,49,48,53,52,57,51,99,52,48,56,97,48,49,50,51,49]
decrypted = tasks.map { |x| x.chr }
puts decrypted

response = Faraday.get(URL + decrypted.join)
binding.pry
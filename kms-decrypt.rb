#!/usr/bin/ruby
require 'rubygems'
require 'aws-sdk'
require 'pp'
require 'base64'
require 'gibberish'
require 'json'

if ARGV[0].nil?
  puts 'Usage: kms-decrypt.rb INPUTFILE'
  exit 1
end

contents = JSON.parse(IO.read(ARGV[0]))
kms = Aws::KMS::Client.new(region: 'us-east-1')
datakey = Base64.strict_decode64(contents['datakey'])

cleartextkey = kms.decrypt(ciphertext_blob: datakey,
                           encryption_context: { 'KeyType' => 'Some descriptive text here' })

cipher = Gibberish::AES.new(cleartextkey.plaintext)
cleartext = cipher.decrypt(contents['ciphertext'])
puts cleartext

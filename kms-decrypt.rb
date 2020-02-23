#!/usr/bin/ruby
# frozen_string_literal: true

require 'rubygems'
require 'aws-sdk-kms'
require 'pp'
require 'base64'
require 'openssl'
require 'json'

if ARGV[0].nil?
  puts 'Usage: kms-decrypt.rb INPUTFILE'
  exit 1
end

contents = JSON.parse(IO.read(ARGV[0]))
kms = Aws::KMS::Client.new(region: 'us-east-1')
datakey = Base64.strict_decode64(contents['datakey'])

cleartextkey = kms.decrypt(ciphertext_blob: datakey,
                           encryption_context: {
                             'KeyType' => 'Some descriptive text here'
                           })

alg = 'AES-256-CBC'
decode_cipher = OpenSSL::Cipher.new(alg)
decode_cipher.decrypt
decode_cipher.key = cleartextkey.plaintext
decode_cipher.iv = Base64.strict_decode64(contents['iv'])

plaintext = decode_cipher.update(
  Base64.strict_decode64(contents['ciphertext'])
) + decode_cipher.final
puts plaintext

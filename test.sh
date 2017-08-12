#!/bin/sh
set -ex
echo FOO > test.input
bundle exec ruby ./kms-encrypt.rb test.input | tee test.encrypted
bundle exec ruby ./kms-decrypt.rb test.encrypted | tee test.decrypted
diff -y test.decrypted test.input

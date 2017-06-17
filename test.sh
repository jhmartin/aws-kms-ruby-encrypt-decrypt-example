#!/bin/sh
set -x
echo FOO > test.input
bundle exec ruby ./kms-encrypt.rb test.input | tee test.encrypted
bundle exec ruby ./kms-decrypt.rb test.encrypted | tee test.decrypted
diff -y test.decrypted test.input || exit 1

# Signal to gemnasium that test runs properly.
curl -LsO https://github.com/gemnasium/toolbelt/releases/download/0.2.9/gemnasium_0.2.9_linux_amd64.tar.gz
tar  --strip-components=1 -xvzf gemnasium_0.2.9_linux_amd64.tar.gz gemnasium_0.2.9_linux_amd64/gemnasium
./gemnasium autoupdate github.com/jhmartin/aws-kms-ruby-encrypt-decrypt-example true

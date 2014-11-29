aws-kms-ruby-enrypt-decrypt-example
===================================

Sample using AWS Key Management Service (assuming IAM roles) to generate a data key, encrypt an object with that key, 
then decrypt it.

Sample ciphertext file looks like:
```JSON
{
  "ciphertext": "U2FsdGVkX1/J92QzTjh7E+u8mHLoruXfNgFxRVzHXDh/QwV7gtuO+KODk8aZ\ng2jktXbHnY1V1YcH1g6whGZgAPUksG2VGvKLBNKXbFbigPRd6JUSNhLUkbho\nCKWS7vmH1om15ZGjqMEqhNKvCJN1bUTfb6cbyxDdYhe0nUIKNlbl1v5KRHOp\nyoeBLIHlrdGe/KhjAWrbtehTLYdlbfWLxWcprxekB0jhGHBb0QGOgqRmuWq1\npDJJjkeQZlWcT9Q4lBU1CXMxFdibE3DzuWtMsFXTZIN3CPNphZ0TIs+xxh5A\nwGaoZd3STjyAISenK8L4YK22HnM7nb9TfdPK77gYgWM51HI65cNB/XIPm4fs\nDQUU8ZV0dhSGwD65+Mw9ZsbXjemwFDyoI4r16Luu0KEBRBVZS99BZwlXrI72\n1LwI1s3/8lddfGGyrfyQf7biXsulVtx6llCwZOId4HxvjwOIo+9FG7t0dndA\n8vZ//ZdCNvLMDiAxnVL/2uL15wXU+L9uxl+NJgJP9OshmujN0u/zMFa0pk8+\nl8Yu9nB62rf+tk8m8JcpgPrwkOMUkQxz9OPzUYLaSNglwtOGkjHZ1iAipdCg\nAyw5pIUCRH1EBT9T5enOFz8N5Lus4BPjcL2nE9kmTL3OnN/TjSNY1hnYjC+p\nhb8k9Qe18MmyysuQfF1oYZLq6RIVtXgD73y4wWBVWvcUXVidZDMOQjp6bRKa\noqoQzRglTuNP+vhgTYN1R7s9D46fVLRTqvlDeKmwuG5GZ59ZsFoaz6rAhzCy\nYJnmFpOC6Q==\n",
  "datakey": "CiAZM5lfpml79/xq2DrOPUKm4aSyNamrxnGq6oBiEkJ3yBKnAQEBAwB4GTOZX6Zpe/f8atg6zj1CpuGksjWpq8ZxquqAYhJCd8gAAAB+MHwGCSqGSIb3DQEHBqBvMG0CAQAwaAYJKoZIhvcNAQcBMB4GCWCGSAFlAwQBLjARBAxDH8IEyvf8fr3qtQYCARCAO7elZFDPuqPXJzjP5iciFabj5820Q6ZTdnZvdWyCZMhRyx0qQtoQL7tDVVMGH3yrlNY909grcx1nERWe"
}
```

Usage
===================================
1. Create a AWS KMS master key (currently costs $1/mo) and record its keyid. 
2. Add the keyid to kms-encrypt.rb
3. Add an IAM user or role as 'key usage' authorized user.
4. Configure the AWS credentials as you normally would (I used an IAM instance role rather than explicit access keys)
5. Call kms-encrypt.rb with an input file and redirect the output to a ciphertext file.
6. Call kms-decrypt.rb with a reference to the ciphertext file.
``` 
$ kms-encrypt.rb /input/file/here >ciphertext.out
$ kms-decrypt.rb ciphertext.out
```

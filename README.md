## Demo for use AWS KMS to encrypt simple test


1. First you need to create the key at IAM -> Encryption keys or using Terraform (see the code in the project)

2. Then you can create the cipherText using the command bellow:

```
aws kms encrypt --key-id alias/demokey --plaintext "hibicode" --query CiphertextBlob --output text --profile app | base64 --decode > encryptedSecretAsBlob
```

3. Then you can use the code of this application to decrypt using Java. Or you could use the following command:

```
aws kms decrypt --ciphertext-blob fileb://encryptedSecretAsBlob --query Plaintext --output text --profile app | base64 --decode
```

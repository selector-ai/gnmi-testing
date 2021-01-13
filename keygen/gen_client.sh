# 1. Generate client private key and CSR
openssl req -newkey rsa:4096 -nodes -keyout client-key.pem -out client-req.pem -subj "/C=IN/ST=Karnataka/L=Bengaluru/O=S2/OU=Engineering/CN=localhost-client/emailAddress=babus@selector.ai"

# 3. Use CA's private key to sign web client's CSR and get back the signed certificate
#openssl x509 -req -in client-req.pem -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out client-cert.pem
openssl x509 -req -in client-req.pem -days 60 -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out client-cert.pem
echo "Server's self-signed certificate"
# To verify the contents
openssl x509 -in client-cert.pem -noout -text

# To verify the certificate
openssl verify -CAfile ca-cert.pem client-cert.pem

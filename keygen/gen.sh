rm -f *.pem
# 1. Generate CA's private key and self-signed certificate
#openssl req -x509 -newkey rsa:4096 -days 365 -keyout ca-key.pem -out ca-cert.pem
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout ca-key.pem -out ca-cert.pem -subj "/C=IN/ST=Karnataka/L=Bengaluru/O=S2/OU=Engineering/CN=localhost-darwin/emailAddress=babus@selector.ai"

echo "CA's self-signed certificate"
# To verify the contents
openssl x509 -in ca-cert.pem -noout -text

# 2. Generate web server's private key and CSR
openssl req -newkey rsa:4096 -nodes -keyout server-key.pem -out server-req.pem -subj "/C=IN/ST=Karnataka/L=Bengaluru/O=S2/OU=Engineering/CN=localhost-server/emailAddress=babus@selector.ai"

# 3. Use CA's private key to sign web server's CSR and get back the signed certificate
#openssl x509 -req -in server-req.pem -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem
openssl x509 -req -in server-req.pem -days 60 -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem
echo "Server's self-signed certificate"
# To verify the contents
openssl x509 -in server-cert.pem -noout -text

# To verify the certificate
openssl verify -CAfile ca-cert.pem server-cert.pem

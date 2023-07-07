require 'openssl'

# Path to the PKCS12 file
pkcs12_file = 'certificate.p12'

# Password for the PKCS12 file
password = 'your_password'

begin
  # Load the PKCS12 file
  pkcs12 = OpenSSL::PKCS12.new(File.read(pkcs12_file), password)

  # Get the private key and certificate
  private_key = pkcs12.key
  certificate = pkcs12.certificate

  # Print the private key and certificate details
  puts "Private Key:"
  puts private_key.to_pem

  puts "\nCertificate:"
  puts certificate.to_pem
rescue OpenSSL::PKCS12::PKCS12Error => e
  puts "Error loading PKCS12 file: #{e.message}"
rescue Errno::ENOENT => e
  puts "PKCS12 file not found: #{e.message}"
end

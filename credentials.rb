class Credentials
  attr_reader :token

  def initialize
    @nonce = nonce
    @token = generate_token
  end

  def payload
    {
      report_type: 'plain',
      nonce: @nonce
    }
  end

private

  def generate_token
    data = payload.to_json
    Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), key, data)).strip
  end

  def nonce
    SecureRandom.hex
  end

  def key
    '5b464f0dae14138f73c95416658bb8c31f508667e7bcc85a'
  end
end

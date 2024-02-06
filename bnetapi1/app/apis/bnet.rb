class Bnet
  include Singleton

  def site
    'https://us.battle.net'
  end
  
  def client
    @client ||= OAuth2::Client.new(bnet_client_id, bnet_client_secret, site: site)
  end
  
  def token
    @token = client.client_credentials.get_token if !@token || @token.expired?
    @token
  end

  def connection
    Faraday.new(
      url: 'https://us.api.blizzard.com/data/wow/playable-class/index',
      params: { "locale": "en_US" },
      headers: { "Authorization": "Bearer #{token.token}", "Battlenet-Namespace": "static-us" }
    )
  end

  def test
    connection.get
  end

  private

  def bnet_client_id
    File.read(ENV['BNET_CLIENT_ID_FILE'])
  end

  def bnet_client_secret
    File.read(ENV['BNET_CLIENT_SECRET_FILE'])
  end
end
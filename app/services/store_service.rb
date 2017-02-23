class StoreService
  def self.search_by_zip
    JSON.parse(faraday_response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(:url => 'https://api.bestbuy.com')
  end

  def self.faraday_response
    conn.get do |req|                    
      req.url '/v1/stores(area(80204,25))'
      req.params['format'] = 'json'
      req.params['apiKey'] = ENV['BEST_BUY_API_KEY']
    end
  end
end
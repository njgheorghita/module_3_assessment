class StoreService
  def self.search_by_zip
    conn = Faraday.new(:url => 'https://api.bestbuy.com') 
    response = conn.get("/v1/stores(area(80204,25))?format=json&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
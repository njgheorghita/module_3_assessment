class SearchController < ApplicationController
  def index
    response = StoreService.search_by_zip
    @total_count = response[:total]
    @stores = response[:stores].map do |store|
      Store.create(store)
    end
  end
end
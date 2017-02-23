class SearchController < ApplicationController
  def index
    @stores = StoreService.search_by_zip.map do |store|
      Store.create(store)
    end
  end
end
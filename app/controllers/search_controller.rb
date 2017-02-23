class SearchController < ApplicationController
  def index
    @stores = StoreService.search_by_zip
  end
end
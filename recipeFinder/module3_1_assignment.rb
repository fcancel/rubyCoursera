require 'httparty'

ENV["FOOD2FORK_KEY"] = '2141f10a094cf4ccbe970aa5ec087290'

class Recipe
include HTTParty

  # FOOD2FORK API SEARCH PARAMETERS http://food2fork.com/about/api
  # key: API Key
  # q: (optional) Search Query (Ingredients should be separated by commas). If this is omitted top rated recipes will be returned.
  # sort: (optional) How the results should be sorted. See Below for details.
  # page: (optional) Used to get additional results

  base_uri 'http://food2fork.com/api'           # Base uri for all our get requests
  default_params key:ENV["FOOD2FORK_KEY"]        # The food2fork api requires us to send an api key
  format :json                                   # Should return it into a json format

  def self.for term
    get("/search",query: { q: term})["recipes"]
  end
end
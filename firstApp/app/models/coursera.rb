class Coursera
  include HTTParty

  base_uri 'https://api.coursera.org/api/catalog.v1/courses'
  default_params fields: "smallIcon,shortDescription", q: "search"
  format :json
  default_options.update(verify: false)

  def self.for term
    get("",query: { query: term})["elements"]
  end
end
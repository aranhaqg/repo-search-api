class SearchRepositoryService < ApplicationService
  include HTTParty
  attr_reader :query

  def initialize(query)
    @query = query
  end
  
  def call
    response = self.class.get("https://api.github.com/search/repositories?q=#{@query}")
    
    process_response(response.parsed_response)

  end

  def process_response(response)
    items = response["items"]
    repo_list = []
    items.each do |item|
      repository = mount_repository(item)
      repo_list << repository
    end

    repo_list
  end

  def mount_repository(item)
    repository = Repository.new
    repository.id = item["id"]
    repository.name = item["name"]
    repository.full_name = item["full_name"]
    repository.description = item["description"]
    repository.url = item["url"]

    repository
  end
end
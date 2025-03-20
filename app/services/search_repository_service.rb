# frozen_string_literal: true

class SearchRepositoryService < ApplicationService
  include HTTParty
  attr_reader :query

  def initialize(query) # rubocop:todo Lint/MissingSuper
    @query = query
  end

  def call
    response = self.class.get("https://api.github.com/search/repositories?q=#{@query}")

    process_response(response.parsed_response)
  end

  private

  def process_response(response)
    items = response['items']
    repo_list = []

    items.each do |item|
      repository = MountRepositoryService.call(item)
      repo_list << repository
    end

    repo_list
  end
end

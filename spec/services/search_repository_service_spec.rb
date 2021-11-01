# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchRepositoryService, type: :service do
  describe '#call' do
    let(:query) { 'repo:aranhaqg/aranhaqg' }
    let(:item_response) do
      {
        id: 1,
        name: 'aranhaqg',
        full_name: 'aranhaqg/aranhaqg',
        description: 'Here you can find all about me!',
        url: 'https://api.github.com/repos/aranhaqg/aranhaqg'
      }
    end
    let(:github_response) do
      {
        total_count: 2,
        incomplete_results: false,
        items: [item_response, item_response]
      }
    end

    let(:github_url) { "https://api.github.com/search/repositories?q=#{query}" }
    let!(:stub) do
      stub_request(:get, github_url)
        .to_return(
          status: 200,
          body: github_response.to_json,
          headers: { content_type: 'application/json' }
        )
    end

    it 'with success request' do
      described_class.call(query)
      expect(stub).to have_been_requested
    end
  end
end

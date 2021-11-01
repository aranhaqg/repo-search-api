# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MountRepositoryService, type: :service do
  describe '#call' do
    let(:item_response) do
      {
        id: 1,
        name: 'aranhaqg',
        full_name: 'aranhaqg/aranhaqg',
        description: 'Here you can find all about me!',
        url: 'https://api.github.com/repos/aranhaqg/aranhaqg'
      }
    end
    let(:mounted_repository) { described_class.call(item_response) }

    it { expect(item_response['name']).to eq(mounted_repository.name) }
    it { expect(item_response['full_name']).to eq(mounted_repository.full_name) }
    it { expect(item_response['description']).to eq(mounted_repository.description) }
    it { expect(item_response['url']).to eq(mounted_repository.name) }
  end
end

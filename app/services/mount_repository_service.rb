# frozen_string_literal: true

class MountRepositoryService < ApplicationService
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def call
    mount_repository
  end

  private

  def mount_repository
    repository = Repository.new
    repository.id = @item['id']
    repository.name = @item['name']
    repository.full_name = @item['full_name']
    repository.description = @item['description']
    repository.url = @item['url']

    repository
  end
end

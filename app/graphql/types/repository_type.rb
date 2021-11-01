# frozen_string_literal: true

module Types
  class RepositoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :full_name, String, null: true
    field :description, String, null: true
    field :url, String, null: true
  end
end

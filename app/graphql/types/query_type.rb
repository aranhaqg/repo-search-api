module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :search_repositories, [RepositoryType], null: false do
      argument :query, String, required: false
    end

    def search_repositories(query: nil)
      SearchRepositoryService.call(query)
    end
  end
end

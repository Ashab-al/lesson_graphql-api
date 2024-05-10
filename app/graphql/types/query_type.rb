# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::PostType], null: false do 
      description "Query that selects all posts"
    end

    field :postsCount, Integer, null: false do 
      description "Query that returns the total of posts"
    end

    field :helloPosts, [Types::PostType], null: false do 
      description "Query that selects only posts where name contains Hello"
    end

    def posts
      return Post.all
    end

    def postsCount
      return Post.count
    end

    def helloPosts
      return Post.where "title like ?", "%Hello%"
    end
  end
end

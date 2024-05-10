# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false do 
      description "This post id"
    end
    field :title, String, null: false do 
      description "This post title"
    end
    field :body, String, null: false do 
      description "This post body, main content of the post"
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do 
      description "The date/time that this post created at"
    end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do 
      description "The date/time that this post updated at"
    end
    field :author_id, Integer, null: false do 
      description "The id of this posts author"
    end
    field :author, AuthorType do 
      description "This posts author in object form"
    end
  end
end

# frozen_string_literal: true

module Mutations
  class CreatePostMutation < BaseMutation
    field :post, Types::PostType, null: false

    argument :title, String, required: true do 
      description "The title field is a string type and is required for a new Post to be created"
    end

    argument :body, String, required: true do 
      description "This is the post main content, it is called the body and expects a string also requireds field"
    end

    argument :author, Integer, required: true do 
      description "The id of this post author required"
    end

    def resolve(title:, body:, author:)
      @post = Post.new(title: title, body: body, author: Author.find_by_id(author))
      
      if(@post.save)
        {
          post: @post,
          errors: []
        }else {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end

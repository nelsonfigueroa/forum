# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    let(:user) { User.new }

    it 'returns invalid if attributes are missing' do
      expect(user.valid?).to be false
    end

    it 'validates that all attributes are present' do
      user.email = "test@test.com"
      user.username = "test_username"
      user.password = "password123!"
      user.save!
      expect(user.valid?).to be true
    end
  end

  it 'determines whether the user has voted on a post with #has_not_voted' do
    user_two = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    sub = Sub.create(
      user: user_two,
      name: 'sub name',
      description: 'sub description'
    )

    post = Post.create(
      title: 'post title',
      content: 'post content',
      user: user_two,
      sub: sub
    )

    vote = Vote.create(
      user_id: user_two.id,
      post_id: post.id
    )

    expect(user_two.has_not_voted?(post)).to be true
  end

  it 'determines whether a user has upvoted a post with #upvoted_post?' do
    pending('as above')
  end

  it 'determines whether a user has downvoted a post with #downvoted_post?' do
    pending('as above')
  end

  it 'returns posts that were upvoted by user with #upvoted_posts' do
    pending('as above')
  end

  it 'returns posts that were downvoted by a user with #downvoted_posts' do
    pending('as above')
  end
end

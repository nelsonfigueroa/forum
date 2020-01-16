# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
  	it { should validate_presence_of(:comment) }
  end

  # it 'validates that a comment is present' do
  #   expect(Comment.new.valid?).to be false
  # end
end

# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :micropost, foreign_key: 'micropost_id'
  belongs_to :user, foreign_key: 'user_id'
end

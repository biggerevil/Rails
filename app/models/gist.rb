# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :link, presence: true
  validates :gist_hash, presence: true
end

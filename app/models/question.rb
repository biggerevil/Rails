# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  validates :title, presence: true

  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
end

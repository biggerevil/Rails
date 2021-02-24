# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
end

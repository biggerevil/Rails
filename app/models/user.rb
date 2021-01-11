# frozen_string_literal: true

class User < ApplicationRecord
  def completed_tests_of_level(level)
    Test.where(user_id: id, level: level)
  end
end

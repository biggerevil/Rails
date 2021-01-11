# frozen_string_literal: true

class User < ApplicationRecord
  def completedTestsOfLevel(level)
    titlesArray = Test.where(user_id: id, level: level).pluck(:title)
  end
end

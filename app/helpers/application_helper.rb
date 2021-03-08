# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    link_to 'TestGuru', link, target: :_blank
  end

  def flash_helper(message_type)
    if (flash[:alert])
      content_tag :p, flash[message_type], class: "flash #{message_type}"
    end
  end
end

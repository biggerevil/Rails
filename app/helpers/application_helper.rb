module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    puts "link = #{link}"
    link_to 'TestGuru', link
  end
end

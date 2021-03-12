module GistsHelper
  def gist_link(gist_url, gist_hash = nil)
    link_to(gist_hash, gist_url, rel: 'nofollow', target: '_blank')
  end
end

class Page

  def drafts_count
    Post.drafts.count
  end

end
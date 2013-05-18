class MailPreview < MailView
  def article
    feed = Feed.create!(
      :name => 'Test Feed',
      :url => 'http://blah.com'
    )
    article = Article.create!(
      :content => 'Here is some content',
      :title => 'This is the title',
      :feed_id => feed.id,
      :url => 'http://blah.com/1'
    )

    mail = ArticleMailer.send_article(article)
    article.destroy
    feed.destroy
    mail
  end
end

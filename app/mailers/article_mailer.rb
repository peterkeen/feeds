class ArticleMailer < ActionMailer::Base
  def strip_entities(text)
    text.gsub(/&nbsp;/, ' ')
    text.gsub(/&.{0,}?;/, '')
    text.gsub(/:/, ' ')
    text.gsub(/[<>]/, '-')
  end

  def send_article(article)
    @article = article
    @title = strip_entities(article.title).html_safe

    headers['List-Id'] = @article.feed.list_id

    mail to:      ENV['TO_EMAIL'],
         from:    "#{strip_entities(article.feed.name)} <#{ENV['FROM_EMAIL']}>",
         subject: strip_entities(article.title)
  end
end

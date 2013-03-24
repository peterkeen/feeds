class ArticleMailer < ActionMailer::Base
  def strip_entities(text)
    text.gsub(/&nbsp;/, ' ')
    text.gsub(/&.{0,}?;/, '')
  end

  def send_article(article)
    @article = article
    @title = strip_entities(article.title).html_safe

    mail to:      ENV['TO_EMAIL'],
         from:    "#{strip_entities(article.feed.name)} <#{ENV['FROM_EMAIL']}>",
         subject: strip_entities(article.title)
  end
end

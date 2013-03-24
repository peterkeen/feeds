class ArticleMailer < ActionMailer::Base
  default :from => 'feeds@bugsplat.info'

  def strip_entities(text)
    text.gsub(/&nbsp;/, ' ')
    text.gsub(/&.{0,}?;/, '')
  end

  def send_article(article)
    @article = article
    @title = strip_entities(article.title).html_safe

    mail to:      'pete@bugsplat.info',
         from:    "#{strip_entities(article.feed)} <feeds@bugsplat.info>",
         subject: strip_entities(article.title)
  end
end

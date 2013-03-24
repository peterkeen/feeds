class ArticleMailer < ActionMailer::Base
  default :from => 'feeds@bugsplat.info'

  helper ApplicationHelper

  def send_article(article)
    @article = article
    mail to:      'pete@bugsplat.info',
         from:    "#{strip_entities(article.feed)} <feeds@bugsplat.info>",
         subject: strip_entities(article.title)
  end
end

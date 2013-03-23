class ArticleMailer < ActionMailer::Base
  default :from => 'feeds@bugsplat.info'

  def send_article(article)
    @article = article
    mail to:      'pete@bugsplat.info',
         from:    "#{article.feed.stripped_name} <feeds@bugsplat.info>",
         subject: "#{article.title}"
  end
end

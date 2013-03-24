module ApplicationHelper
  def strip_entities(text)
    text.gsub(/&nbsp;/, ' ')
    text.gsub(/&.{0,}?;/, '')
  end
end

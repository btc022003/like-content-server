json.status 'y'
json.info @articles.each do |article|
  json.id article.id
  json.title article.title
  json.descriptions article.descriptions
  json.cover_image article.cover_img
  json.count_of_article_comments article.count_of_article_comments
  json.count_of_article_likes article.count_of_article_likes
  json.user_id article.user_id
  json.user_name article.user.user_name
end

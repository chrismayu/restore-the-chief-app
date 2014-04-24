class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :published, :title, :display_date
  
 
  
   default_scope order: 'posts.display_date DESC'
   
   def content
      MarkdownService.new.render(body)
    end
   
   
end

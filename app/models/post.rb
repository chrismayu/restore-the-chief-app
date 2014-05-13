class Post < ActiveRecord::Base 
  attr_accessible :author_id, :body, :published, :title, :display_date, :shorten_url
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
    after_validation :move_friendly_id_error_to_name
    
    after_create :create_bit_ly
  
   default_scope order: 'posts.display_date DESC'
   
   unless current_user.has_role? :admin
   default_scope where(:published => true)
   end
   
   
   def content
      MarkdownService.new.render(body).html_safe 
    end
   
 
      def move_friendly_id_error_to_name
        errors.add :title, *errors.delete(:friendly_id) if errors[:friendly_id].present?
      end
   
   
      def create_bit_ly
           url = "#{ENV['POST_URL']}#{self.id}"
           bitly = Bitly.new(ENV["BITLY_USERNAME"] ,ENV["BITLY_API_CODE"] )
           page_url = bitly.shorten( url, :history => 1)
          self.update_attribute(:shorten_url, page_url.shorten)
 
      end
   
 
end

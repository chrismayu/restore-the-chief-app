class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :body, :staff, :staff_name, :staff_email, :event_name

 
 validates  :name,  :presence => {:message => 'Must enter your name'}
 
 validates  :subject,  :presence => {:message => 'Must enter your name'}
 
 validates :body, presence: true 
 
 validates_format_of :email, :with => /.+@.+\..+/i
 
 
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
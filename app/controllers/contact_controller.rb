class ContactController < ApplicationController
 
      def new 
      
          @user = current_user
          @message = Message.new
    
        end

        def create
          @message = Message.new(params[:message])

          if @message.valid?
             #ContactMailer.site_message(@message).deliver
            redirect_to(root_path, :notice => "Your message was successfully sent.")
          else
            flash.now.alert = "Please fill all fields." 
            redirect_to(root_path + "#contact")
          end
        end
    end
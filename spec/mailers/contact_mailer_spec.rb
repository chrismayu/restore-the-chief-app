require "spec_helper"

describe ContactMailer do
 
  it "has a valid factory" do
        FactoryGirl.build(:message).should be_valid
     end
     
     it "should return body" do
        @note = FactoryGirl.build(:message)
        @note.body.should == 'body of a note'
      end
 
 
  describe "Message Email" do
    let(:message) { FactoryGirl.build(:message) }
    let(:mail) { ContactMailer.site_message(message) }

    it "send user password reset url" do
      mail.subject.should eq("R_t_C - changeme")
      mail.to.should eq([message.email])
      mail.from.should eq(["hope.inter.web@gmail.com"])
    end
  end
end
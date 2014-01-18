describe "MESSAGES" :focus => true do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:email)
    visit root_path
     
    fill_in "Email", :with => user.email
    fill_in "Subject", :with => user.subject
    click_button "Send Message"
    current_path.should eq(root_path)
    page.should have_content("Email sent")
    last_email.to.should include(user.email)
  end
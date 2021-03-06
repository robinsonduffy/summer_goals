require 'spec_helper'

describe PagesController do
  render_views
  describe "GET 'home'" do
    it "should be success" do
      get :home
      response.should be_success
    end
    
    it "should have the right title" do
      get :home
      response.should have_selector("title", :content => @base_title)
    end
    
    describe "for non-logged in users" do
      it "should have a login button" do
        get :home
        response.should have_selector("a", :content => "Login", :href => login_path)
        response.should_not have_selector("a", :content => "Logout", :href => logout_path)
      end
    end
    
    describe "for logged in users" do
      before(:each) do
        login_user(Factory(:user))
      end
      
      it "should have a logout button" do
        get :home
        response.should_not have_selector("a", :content => "Login", :href => login_path)
        response.should have_selector("a", :content => "Logout", :href => logout_path)
      end
    end
        
  end

end

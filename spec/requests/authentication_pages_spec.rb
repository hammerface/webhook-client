require 'rails_helper'
include Capybara::DSL

describe "Authentication" do
  describe "signin page" do
    before { visit signin_path }
    
    it { should have_content('Sign in') }

    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it { should have_content('Sign in') }
    end

    describe "with valid information" do
      before do
        fill_in "Server",   with: "10.0.102.53:1209"
        fill_in "User",     with: "jbrower"
        fill_in "Password", with: "j1ml1nk1"
        click_button "Sign in"
        visit webhooks_path
      end
      
      
      it { should have_content('webhooks') }
    end
  end
end

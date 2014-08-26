require 'rails_helper'
include Capybara::DSL

describe "StaticPages" do
  describe "Home" do
    before { visit root_path }
    it { should have_content('home') }
  end

  describe "Webhooks" do
    before { visit webhooks_path }
    it { should have_content('webhooks') }
  end
end

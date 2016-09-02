require 'rails_helper'

RSpec.feature "user can login", :type => :feature do
  xscenario "click on the login link on homepage" do
    stub_omniauth

    visit root_path

    expect(page.status_code).to eq(200)

    click_link "Login"

    expect(page.current_path).to eq ("/")

    expect(page).to have_content("Yoyo2Code")
    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        "provider"=>"github",
   "uid"=>"16968035",
   "info"=>
    {"nickname"=>"Yoyo2Code",
     "email"=>nil,
     "name"=>nil,
     "image"=>"https://avatars.githubusercontent.com/u/16968035?v=3",
     "urls"=>{"GitHub"=>"https://github.com/Yoyo2Code", "Blog"=>nil}},
   "credentials"=>{"token"=>"#{ENV['TOKEN']}", "expires"=>false},
   "extra"=>
    {"raw_info"=>
      {"login"=>"Yoyo2Code",
       "id"=>16968035,
       "avatar_url"=>"https://avatars.githubusercontent.com/u/16968035?v=3",
       "gravatar_id"=>"",
       "url"=>"https://api.github.com/users/Yoyo2Code",
       "html_url"=>"https://github.com/Yoyo2Code",
       "received_events_url"=>"https://api.github.com/users/Yoyo2Code/received_events",
       "type"=>"User",
       "site_admin"=>false,
       "name"=>nil,
       "company"=>nil,
       "blog"=>nil,
       "location"=>nil,
       "email"=>nil,
       "hireable"=>nil,
       "bio"=>nil,
       "public_repos"=>33,
       "public_gists"=>4,
       "followers"=>4,
       "following"=>0}}})
  end
end

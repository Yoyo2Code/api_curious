require 'rails_helper'

describe GithubService do

  context "#recent_user_history" do
    it "can find user history" do
      VCR.use_cassette("github_service_user_history") do
        current_user = create(:user, auth_token: ENV['AUTH_TOKEN'])
        @github_service = GithubService.new(current_user)
        commits = @github_service.recent_user_history
        commits.each do |commit|
          commit.include?("https://api.github.com/repos/Yoyo2Code")
        end
      end
    end
  end

  context "#followed_events" do
    it "can list top three recent events" do
      VCR.use_cassette("github_service_followed_events") do
        current_user = create(:user, auth_token: ENV['AUTH_TOKEN'])
        @github_service = GithubService.new(current_user)
        events = @github_service.followed_events
          events.each do |event|
            expect(event.include?("Event")).to be_truthy
          end
      end
    end
  end

  context "#organizations" do
    xit "can list all associated organizations" do
      VCR.use_cassette("github_service_organizations") do
        current_user = create(:user, auth_token: ENV['AUTH_TOKEN'])
        @github_service = GithubService.new(current_user)
        organizations = @github_service.organizations
          organizations.each do |org|

          end
      end
    end
  end

  context "#repositories" do
    it "can list all repositories" do
      VCR.use_cassette("github_service_repositories") do
        current_user = create(:user, auth_token: ENV['AUTH_TOKEN'])
        @github_service = GithubService.new(current_user)
        repositories = @github_service.repositories
          repositories.each do |repo|
            expect(repo.split("/").count).to eq (2)
          end
      end
    end
  end
end

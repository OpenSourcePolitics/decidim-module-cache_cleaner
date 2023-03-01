# frozen_string_literal: true

require "spec_helper"

describe "Admin clear cache", type: :system do
  let(:organization) { create(:organization) }

  let!(:user) { create(:user, :admin, :confirmed, organization: organization) }

  before do
    switch_to_host(organization.host)
    login_as user, scope: :user
    visit decidim_admin.root_path
    click_link "Cache cleaner"
  end

  it "Displays cache manager page" do
    expect(page).to have_content("Decidim cache manager")
    expect(page).to have_link("I understood, clear the cache")
  end

  it "Clears the cache" do
    click_link "I understood, clear the cache"
    expect(page).to have_content("I understood that this action will slow down my application while it regenerates the cache. Are you sure you want to clear the cache?")
    click_link "OK"
    expect(page).to have_content("Cache cleared successfully")
  end
end

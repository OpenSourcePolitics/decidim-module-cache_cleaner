require "spec_helper"

describe Decidim::CacheCleaner::Admin::CacheManagerController, type: :controller do
  routes { Decidim::CacheCleaner::AdminEngine.routes }

  let(:organization) { create(:organization) }
  let(:current_user) { create(:user, :admin, :confirmed, organization: organization) }

  before do
    request.env["decidim.current_organization"] = organization
    sign_in current_user, scope: :user
  end

  describe "GET index" do
    it "renders index template" do
      get :index

      expect(subject).to render_template(:index)
    end
  end

  describe "POST clear" do
    it "renders index template" do
      post :clear

      expect(flash[:notice]).to be_present
      expect(subject).to redirect_to(root_path)
    end

    context "when cache_manger doesn't clear" do
      before do
        allow_any_instance_of(Decidim::CacheCleaner::CacheManager).to receive(:clear!).and_return(false)
      end

      it "renders index template" do
        post :clear

        expect(flash[:alert]).to be_present
        expect(subject).to redirect_to(root_path)
      end
    end
  end
end
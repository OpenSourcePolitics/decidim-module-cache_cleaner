# frozen_string_literal: true

require "spec_helper"

module Decidim
  module CacheCleaner
    describe "Version" do
      let(:described_class) { Decidim::CacheCleaner }

      describe ".version" do
        it "returns a string version" do
          expect(described_class.version).to be_kind_of(String)
        end

        it "returns a valid version" do
          expect(described_class.decidim_compatible_version).to match(/\d+\.\d+/)
        end
      end

      describe ".decidim_compatible_version" do
        it "returns a string version" do
          expect(described_class.decidim_compatible_version).to be_kind_of(String)
        end

        it "returns a valid version" do
          expect(described_class.decidim_compatible_version).to match(/\d+\.\d+/)
        end
      end
    end
  end
end

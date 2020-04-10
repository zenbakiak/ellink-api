# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id          :bigint           not null, primary key
#  url         :text             not null
#  title       :string
#  description :text
#  author      :string
#  image       :string
#  hits_count  :integer          default(0)
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Link, type: :model do
  subject { FactoryBot.create(:link) }
  describe "associations" do
    it { should respond_to(:url) }
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:author) }
    it { should respond_to(:image) }
    it { should respond_to(:hits_count) }
    it { should respond_to(:slug) }
  end

  describe "validations" do
    it { should validate_presence_of(:url) }
  end

  describe "#save" do
    it "creates a link with provided link" do
      link = FactoryBot.create(:link)
      expect(Link.count).to eq(1)
      Link.first.slug == link.slug
    end
  end
end

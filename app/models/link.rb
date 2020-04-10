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
require "link_id"

class Link < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true
  validate :url_exists

  scope :top_hits, -> { order(hits_count: :desc).limit(100) }

  before_create :assign_slug

  def assign_slug
    loop do
      self.slug = LinkId.generate
      break unless self.class.exists?(slug: slug)
    end
  end

  def to_param
    slug
  end

  def fetch_data
    page = MetaInspector.new(url)
    tap do |link|
      link.title = page.title
      link.description = page.best_description
      link.author = page.best_author
      link.url = page.url
      link.image = page.images.owner_suggested
    end
  end

  def url_exists
    fetch_data
  rescue StandardError
    errors.add(:url, "is not working")
  end
end

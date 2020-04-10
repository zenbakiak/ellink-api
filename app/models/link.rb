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

  scope :top_hits, -> { order(hits_count: :desc) }

  before_create :assign_slug

  def assign_slug
    # ensure there's no id collisions
    # because we're trying to keep length up to 7 chars like bitly and tinyurl
    loop do
      self.slug = LinkId.generate
      break unless self.class.exists?(slug: slug)
    end
  end

  def hit!
    increment!(:hits_count)
  end
end

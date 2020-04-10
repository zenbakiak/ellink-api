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
FactoryBot.define do
  factory :link do
    url { FFaker::Internet.http_url }
  end
end

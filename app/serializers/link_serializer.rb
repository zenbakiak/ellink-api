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
class LinkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :author,
             :created_at,
             :description,
             :hits_count,
             :image,
             :slug,
             :title,
             :url
end

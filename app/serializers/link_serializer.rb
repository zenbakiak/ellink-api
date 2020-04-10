# frozen_string_literal: true

# == Schema Information
#
# Table name: movements
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class LinkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :url,
             :author,
             :description,
             :title,
             :image,
             :hits_count
  :created_at
end

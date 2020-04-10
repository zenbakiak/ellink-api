# frozen_string_literal: true

require_relative '../../lib/link_id.rb'
require 'rails_helper'

RSpec.describe LinkId do
  describe '.generate' do
    generated_code = LinkId.generate

    it { expect(generated_code).to be_a_kind_of(String) }

    it 'is expected that length should be 7 like bitly or tinyurl' do
      expect(generated_code.size).to eq(7)
    end
  end
end

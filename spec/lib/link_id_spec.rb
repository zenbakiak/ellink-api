require_relative "../../lib/link_id.rb"
require "rails_helper"

RSpec.describe LinkId do
  describe ".generate" do
    generated_code = LinkId.generate
    it { expect(generated_code).to be_a_kind_of(String) }
    it { expect(generated_code.size).to be > 6 }
  end
end

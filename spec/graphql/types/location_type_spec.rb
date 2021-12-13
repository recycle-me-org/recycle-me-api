require 'rails_helper'

RSpec.describe Types::LocationType do
  subject { described_class }

  it { is_expected.to have_field(:place_id).of_type("String!") }
end

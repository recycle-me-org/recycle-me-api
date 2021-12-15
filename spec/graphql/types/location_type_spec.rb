require 'rails_helper'

RSpec.describe Types::LocationType do
  subject { described_class }

  it { is_expected.to have_field(:name).of_type("String") }
  it { is_expected.to have_field(:lat).of_type("Float!") }
  it { is_expected.to have_field(:long).of_type("Float!") }
  it { is_expected.to have_field(:hours).of_type("String!") }
  it { is_expected.to have_field(:phone).of_type("String!") }
  it { is_expected.to have_field(:url).of_type("String!") }
  it { is_expected.to have_field(:distance).of_type("Float!") }
  it { is_expected.to have_field(:address).of_type("String!") }
end

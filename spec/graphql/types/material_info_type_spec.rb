require 'rails_helper'

RSpec.describe Types::MaterialInfoType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type("String!") }
  it { is_expected.to have_field(:name).of_type("String") }
  it { is_expected.to have_field(:description).of_type("String") }
  it { is_expected.to have_field(:image_url).of_type("String") }
end

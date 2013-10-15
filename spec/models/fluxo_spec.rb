require 'spec_helper'

describe Fluxo do
	before { @fluxo = FactoryGirl.create(:fluxo) }

	it { should belong_to :caso_de_uso }
	it { should have_many :passos }
	it { should validate_presence_of :nome }
  it { should validate_uniqueness_of(:nome).scoped_to(:caso_de_uso_id) }

end

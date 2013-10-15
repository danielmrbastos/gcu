require 'spec_helper'

describe CasoDeUso do
  before { @ator = FactoryGirl.create(:ator) }

	#it { should have_many :atores }
	it { should have_many :fluxos }
	it { should belong_to :projeto }

	it { should validate_presence_of :nome }
  it { should validate_uniqueness_of(:nome).scoped_to(:projeto_id) }

end

require 'spec_helper'

describe Ator do
 	before { @ator = FactoryGirl.create(:ator) }

	it { should belong_to :projeto }
	it { should belong_to :tipo_ator }
	it { should validate_presence_of :projeto }
	it { should validate_presence_of :tipo_ator }
	it { should validate_presence_of :nome }
  it { should validate_uniqueness_of(:nome).scoped_to(:projeto_id) }
end

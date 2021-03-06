require 'spec_helper'

describe Passo do
  before { @passo = FactoryGirl.create(:passo) }

	it { should belong_to :fluxo }
	it { should validate_presence_of :nome }
  it { should validate_uniqueness_of(:nome).scoped_to(:fluxo_id) }

end

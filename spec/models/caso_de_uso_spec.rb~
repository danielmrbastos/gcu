require 'spec_helper'

describe CasoDeUso do
  before { @caso_de_uso = FactoryGirl.create(:caso_de_uso) }

	#it { should have_many :atores }
	it { should have_many :fluxos }
	it { should belong_to :projeto }

	it { should validate_presence_of :nome }
  it { should validate_uniqueness_of(:nome).scoped_to(:projeto_id) }

	it "estado inicial do objeto deve ser em analise" do
		@caso_de_uso.situacao.should_not be_empty
		@caso_de_uso.situacao.should == "analise"
	end

	it "aprovar caso de uso" do
		@caso_de_uso.aprovar
		@caso_de_uso.situacao.should == "aprovado"
	end

end

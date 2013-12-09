require 'spec_helper'

describe TipoAtor do
 	before { @tipo_ator = FactoryGirl.create(:tipo_ator) }

	it { should validate_presence_of :sigla }
  it { should validate_presence_of :descricao }


end

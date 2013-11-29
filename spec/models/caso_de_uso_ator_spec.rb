require 'spec_helper'

describe CasoDeUsoAtor do
	it { should belong_to :ator }
	it { should belong_to :caso_de_uso }

end

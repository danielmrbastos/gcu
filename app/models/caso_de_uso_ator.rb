class CasoDeUsoAtor < ActiveRecord::Base
  attr_accessible :ator_id, :caso_de_uso_id, :caso_de_uso

	belongs_to :ator
	belongs_to :caso_de_uso
end

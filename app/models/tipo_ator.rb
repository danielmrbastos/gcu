class TipoAtor < ActiveRecord::Base
  attr_accessible :descricao, :sigla

	validates_presence_of :descricao
	validates_presence_of :sigla

	def to_s
		descricao
	end
end

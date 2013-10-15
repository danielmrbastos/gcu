class Projeto < ActiveRecord::Base
  attr_accessible :ind_ativo, :nome

	validates_presence_of :nome
	validates_uniqueness_of :nome

	def to_s
		nome
	end

end
class Ator < ActiveRecord::Base
  attr_accessible :nome, :projeto_id, :tipo_ator_id
	belongs_to :projeto
	belongs_to :tipo_ator

	validates_presence_of :nome
	validates_presence_of :projeto
	validates_presence_of :tipo_ator
	validates_uniqueness_of :nome, :scope => :projeto_id


	def to_s
		nome
	end
end

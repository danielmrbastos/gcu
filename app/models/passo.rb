class Passo < ActiveRecord::Base
  attr_accessible :fluxo_id, :nome

	belongs_to :fluxo

	validates_presence_of :nome
	validates_uniqueness_of :nome, :scope => :fluxo_id

	def to_s
		nome
	end
end

class Ator < ActiveRecord::Base
  attr_accessible :nome, :projeto_id
	belongs_to :projeto

	validates_presence_of :nome
	validates_uniqueness_of :nome, :scope => :projeto_id


	def to_s
		nome
	end
end

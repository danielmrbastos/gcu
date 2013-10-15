class CasoDeUso < ActiveRecord::Base
  attr_accessible :nome, :projeto_id, :fluxos_attributes, :passos_attributes

	belongs_to :projeto
	has_many :fluxos

	accepts_nested_attributes_for :fluxos, :allow_destroy => true

	validates_presence_of :nome
	validates_uniqueness_of :nome, :scope => :projeto_id

	def to_s
		nome
	end
end

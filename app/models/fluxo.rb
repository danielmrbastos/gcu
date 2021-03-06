class Fluxo < ActiveRecord::Base
  attr_accessible :caso_de_uso_id, :nome, :passos_attributes
	belongs_to :caso_de_uso
	has_many :passos, :class_name => 'Passo'

	accepts_nested_attributes_for :passos, :allow_destroy => true



	validates_presence_of :nome
	validates_uniqueness_of :nome, :scope => :caso_de_uso_id

	def to_s
		nome
	end
end

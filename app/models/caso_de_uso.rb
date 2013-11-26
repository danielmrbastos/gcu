class CasoDeUso < ActiveRecord::Base
  attr_accessible :nome, :projeto_id, :fluxos_attributes, :passos_attributes, :situacao

	belongs_to :projeto
	has_many :fluxos

	accepts_nested_attributes_for :fluxos, :allow_destroy => true

	validates_presence_of :nome
	validates_uniqueness_of :nome, :scope => :projeto_id

	def to_s
		nome
	end

	state_machine :situacao, :initial => :analise do

     state :analise do
       transition :to => :aprovado, :on => :aprovar
     end

     state :analise, :human_name => 'Em analise'
     state :aprovado, :human_name => 'Aprovado'

    # after_transition :do => :exec_after_transition
  end

	def exec_after_transition(transition)
		#	puts "Iniciando after - #{transition}"
		#	puts "============================="
		#	puts transition.class
		#	puts "transition -#{transition}"
		#	puts "============================="

		#	self.situacao = transition
		#	self.save!
  end

end

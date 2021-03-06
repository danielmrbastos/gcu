class CasoDeUso < ActiveRecord::Base
  attr_accessible :nome, :projeto_id, :fluxos_attributes, :passos_attributes, :situacao, :precondicao, :poscondicao, :fator_tecnico, :fator_ambiental

	belongs_to :projeto
	has_many :fluxos

	accepts_nested_attributes_for :fluxos, :allow_destroy => true

	validates_presence_of :nome, :precondicao, :poscondicao

	validates_uniqueness_of :nome, :scope => :projeto_id

	def to_s
		nome
	end

	def associa_atores(array_ator)
		array_ator.each do |atorid|
			if atorid != ""
				CasoDeUsoAtor.create(:caso_de_uso => self, :ator_id => atorid)
			end
		end
	end

	def atores_do_caso
		CasoDeUsoAtor.where(:caso_de_uso_id => self)
	end

	state_machine :situacao, :initial => :analise do

     state :analise do
       transition :to => :aprovado, :on => :aprovar
     end

     state :analise, :human_name => 'Em analise'
     state :aprovado, :human_name => 'Aprovado'
  end

end

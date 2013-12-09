# encoding: utf-8
class Projeto < ActiveRecord::Base
  attr_accessible :ind_ativo, :nome, :fator_tecnico, :fator_ambiental

	validates_presence_of :nome
	validates_uniqueness_of :nome

	def to_s
		nome
	end

	# UCP = UUCP * TCF (fator_tecnico) * EF (fator_ambiental).
	# UUCP = (AS * 1) + (AM * 2) + (AC * 3) +(CUS * 5) + (CUM * 10) + (CUC * 15).

  # AS = Quantidade de atores simples identificados;
  # AM = Quantidade de atores médios identificados;
	#  AC = Quantidade de atores complexos identificados;
 	#  CUS = Quantidade de casos de uso identificados;
	# CUM = Quantidade de casos de uso médios identificados;
 	#  CUC = Quantidade de casos de uso complexos identificados;
	# UUCP = (1 * 1) + (1 * 2) + (0 * 3) + (0 * 5) + (1 * 10) + (0 * 15)
	# UUCP = 1 + 2 + 10 = 13
	# UCP = (13 * 0.86 * 0.755) * 20 = 8.4409 * 20 = 168.818 homens/hora

	def estima_esforco
		if !fator_ambiental.nil? && !fator_tecnico.nil?
			casos_do_projeto = CasoDeUso.where(:projeto_id => self)

			casos_simples   = 0
			casos_medio     = 0
			casos_complexos = 0
			atores_simples  = 0
			atores_medio    = 0
			atores_complexo = 0

			casos_do_projeto.each do |uc|
				fluxos_do_caso = uc.fluxos.size

				if fluxos_do_caso <= 3
					casos_simples += 1
				elsif fluxos_do_caso > 3 and fluxos_do_caso <= 7
					casos_medio += 1
				elsif fluxos_do_caso > 7
					casos_complexos += 1
				end

				atores_associados = CasoDeUsoAtor.where(:caso_de_uso_id => uc)
				if atores_associados.size > 0
					atores_associados.each do |ator_associado|
						ator = Ator.find_by_id(ator_associado.ator_id)
						if ator.tipo_ator.sigla == "simples"
							atores_simples += 1
						elsif ator.tipo_ator.sigla == "medio"
							atores_medio += 1
						elsif ator.tipo_ator.sigla == "complexo"
							atores_complexo += 1
						end
					end
				end
			end

			uucp = (atores_simples * 1) + (atores_medio * 2) + (atores_complexo * 3) +
						 (casos_simples * 5) + (casos_medio * 10) + (casos_complexos * 15)


			ucp = uucp * fator_tecnico * fator_ambiental

	#		puts "casos simples identificados: #{casos_simples}"
	#		puts "casos medios identificados: #{casos_medio}"
	#		puts "casos complexos identificados: #{casos_complexos}"
	#		puts "atores simples identificados: #{atores_simples}"
	#		puts "atores medios identificados: #{atores_medio}"
	#		puts "atores complexos identificados: #{atores_complexo}"

			ucp * 20
		else
			return false;
		end
	end


end

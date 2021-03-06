# encoding: utf-8
require 'spec_helper'

describe Projeto do
	before do
		@projeto = FactoryGirl.create(:projeto)
	  @tipo_ator_simples  = FactoryGirl.create(:tipo_ator, :sigla => "simples")
		@tipo_ator_medio    = FactoryGirl.create(:tipo_ator, :sigla => "medio")
		@tipo_ator_complexo = FactoryGirl.create(:tipo_ator, :sigla => "complexo")

		@ator_simples = FactoryGirl.create(:ator, :tipo_ator => @tipo_ator_simples, :projeto => @projeto)
		@ator_medio   = FactoryGirl.create(:ator, :tipo_ator => @tipo_ator_medio, :projeto => @projeto)
		@ator_complexo = FactoryGirl.create(:ator, :tipo_ator => @tipo_ator_complexo, :projeto => @projeto)

	end

	it { should validate_presence_of :nome }
	it { should validate_uniqueness_of :nome }

	it "calcula estimativa de esforço um caso de uso" do
		@projeto.fator_tecnico   = 0.86
		@projeto.fator_ambiental = 0.755

		@caso_de_uso  = FactoryGirl.create(:caso_de_uso, :projeto => @projeto)

		@ator_simples = FactoryGirl.create(:ator, :tipo_ator => @tipo_ator_simples, :projeto => @projeto)
		@ator_medio   = FactoryGirl.create(:ator, :tipo_ator => @tipo_ator_medio, :projeto => @projeto)

		@caso_de_uso_ator1 = FactoryGirl.create(:caso_de_uso_ator, :caso_de_uso => @caso_de_uso, :ator => @ator_simples)
		@caso_de_uso_ator2 = FactoryGirl.create(:caso_de_uso_ator, :caso_de_uso => @caso_de_uso, :ator => @ator_medio)

		5.times do
			FactoryGirl.create(:fluxo, :caso_de_uso => @caso_de_uso)
		end

		@caso_de_uso.fluxos.size.should == 5

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

		@projeto.estima_esforco.should == 168.818
	end

	it "calcula estimativa de esforço mais de um caso de uso" do
		@projeto.fator_tecnico   = 0.86
		@projeto.fator_ambiental = 0.755

		@caso_de_uso_1  = FactoryGirl.create(:caso_de_uso, :projeto => @projeto)
		@caso_de_uso_2  = FactoryGirl.create(:caso_de_uso, :projeto => @projeto)

		@caso_de_uso_ator1 = FactoryGirl.create(:caso_de_uso_ator, :caso_de_uso => @caso_de_uso_1, :ator => @ator_simples)
		@caso_de_uso_ator2 = FactoryGirl.create(:caso_de_uso_ator, :caso_de_uso => @caso_de_uso_1, :ator => @ator_simples)
		@caso_de_uso_ator3 = FactoryGirl.create(:caso_de_uso_ator, :caso_de_uso => @caso_de_uso_2, :ator => @ator_complexo)

		3.times do
			FactoryGirl.create(:fluxo, :caso_de_uso => @caso_de_uso_1)
		end

		8.times do
			FactoryGirl.create(:fluxo, :caso_de_uso => @caso_de_uso_2)
		end

		@caso_de_uso_1.fluxos.size.should == 3
		@caso_de_uso_2.fluxos.size.should == 8

		# UCP = UUCP * TCF (fator_tecnico) * EF (fator_ambiental).
		# UUCP = (AS * 1) + (AM * 2) + (AC * 3) +(CUS * 5) + (CUM * 10) + (CUC * 15).
		# UUCP = (2 * 1) + (0 * 2) + (1 * 3) + (1 * 5) + (0 * 10) + (1 * 15)
		# UUCP = 2 + 3 + 5 + 15 = 13
		# UCP = (13 * 0.86 * 0.755) * 20 = 8.4409 * 20 = 168.818 homens/hora

		@projeto.estima_esforco.should == 324.65

	end



end

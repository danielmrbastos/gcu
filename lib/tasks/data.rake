# encoding: utf-8

require 'factory_girl'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../../')

namespace :db do
  desc "Drop, create, migrate then seed the database"
  task :recreate do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

  desc "Generate sample data"
  task :sample_data => :environment do
		puts "\n ============== Iniciando Sample 	Data"
		generate_projetos
		generate_casos
		puts "\n ============== Dados de teste incluídos com sucesso"
	end

	def generate_projetos
		puts "\n Criando projetos"
		FactoryGirl.create(:projeto, :nome => "Sistema ERP", :ind_ativo => true)
		puts "."
		FactoryGirl.create(:projeto, :nome => "Controle de projetos", :ind_ativo => true)
		puts "."
	end

	def generate_casos
		puts "\n Criando casos de uso"
		@projeto_erp = Projeto.find_by_nome('Sistema ERP')

		aux = 1;
		rand(3..5).times do
			@caso = FactoryGirl.create(:caso_de_uso, :projeto => @projeto_erp, :nome => "UC00#{aux} - Caso exemplo", :precondicao => "Estar autenticado", :poscondicao => "Poscondicao 1")
			rand(1..3).times do

				@fluxo = FactoryGirl.create(:fluxo, :caso_de_uso => @caso)
				rand(1..5).times do
					FactoryGirl.create(:passo, :fluxo => @fluxo)
				end
			end
			puts "."
			aux += 1
		end
	end

end

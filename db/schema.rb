# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131202225018) do

  create_table "atores", :force => true do |t|
    t.string   "nome"
    t.integer  "projeto_id"
    t.integer  "tipo_ator_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "casos_de_uso", :force => true do |t|
    t.string   "nome"
    t.string   "precondicao"
    t.string   "poscondicao"
    t.integer  "projeto_id"
    t.string   "situacao",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "casos_de_uso_ator", :force => true do |t|
    t.integer  "caso_de_uso_id"
    t.integer  "ator_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "fluxos", :force => true do |t|
    t.string   "nome"
    t.integer  "caso_de_uso_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "passos", :force => true do |t|
    t.string   "nome"
    t.integer  "fluxo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projetos", :force => true do |t|
    t.string   "nome"
    t.boolean  "ind_ativo"
    t.decimal  "fator_tecnico"
    t.decimal  "fator_ambiental"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "tipos_ator", :force => true do |t|
    t.string   "sigla"
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

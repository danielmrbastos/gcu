# encoding: utf-8
class <%= controller_class_name %>Controller < ApplicationController
  before_filter :require_admin

  add_breadcrumb '<%= human_name.pluralize %>', '<%= plural_table_name %>_path'
  add_breadcrumb 'Listando', '', :only => [:index]
  add_breadcrumb 'Criando novo <%= human_name %>', '', :only => [:new, :create]

  def index
    @<%= plural_table_name %> = <%= class_name %>.page(params[:page])
  end

  def show
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
		add_breadcrumb @<%= singular_table_name %>.to_s, ''
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    add_breadcrumb @<%= singular_table_name %>.to_s, <%= singular_table_name %>_path(@<%= singular_table_name %>)
    add_breadcrumb 'Editando'
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>

    if @<%= orm_instance.save %>
      redirect_to(<%= singular_table_name %>_path(@<%= singular_table_name %>), :notice => '<%= human_name %> foi criado com sucesso.')
    else
      render :action => "new"
    end
  end

  def update
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
      redirect_to(<%= singular_table_name %>_path(@<%= singular_table_name %>), :notice => '<%= human_name %> foi atualizado com sucesso.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>
    redirect_to(<%= index_helper %>_url)
  end
end


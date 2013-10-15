# encoding: utf-8
class AtoresController < ApplicationController

  def index
    @atores = Ator.page(params[:page])
  end

  def show
    @ator = Ator.find(params[:id])
  end

  def new
    @ator = Ator.new
  end

  def edit
    @ator = Ator.find(params[:id])
  end

  def create
    @ator = Ator.new(params[:ator])

    if @ator.save
      redirect_to(ator_path(@ator), :notice => 'Ator foi criado com sucesso.')
    else
      render :action => "new"
    end
  end

  def update
    @ator = Ator.find(params[:id])

    if @ator.update_attributes(params[:ator])
      redirect_to(ator_path(@ator), :notice => 'Ator foi atualizado com sucesso.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @ator = Ator.find(params[:id])
    @ator.destroy
    redirect_to(atores_url)
  end
end

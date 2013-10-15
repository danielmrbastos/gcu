# encoding: utf-8
require 'spec_helper'

describe ProjetosController, "as admin" do
  render_views

  before do
  	@projeto = FactoryGirl.create(:projeto)
  end

  describe "GET to index" do
    before { get :index }

    it { assigns[:projetos].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('index') }

  end

  describe "GET to show" do
    before { get :show, :id => @projeto.id }

    it { assigns[:projeto].should == @projeto }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('show') }

  end

  describe "GET to new" do
    before { get :new }

    it { assigns[:projeto].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('new') }

  end

  describe "GET to edit" do
    before { get :edit, :id => @projeto.id }

    it { assigns[:projeto].should == @projeto }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('edit') }

  end

  describe "POST to create" do
    context "with sucessful save" do
      before { post :create, :projeto => FactoryGirl.attributes_for(:projeto) }

      it { assigns[:projeto].should_not be_nil }
      it { flash[:notice].should match('criado') }
      it { response.should redirect_to(projeto_url(assigns(:projeto))) }
    end

    context "with failed save" do
      before do
        Projeto.any_instance.stub(:save).and_return(false)
        post :create, :projeto => {}
      end

      it { assigns[:projeto].should_not be_nil }
      it { flash[:notice].should be_blank }
      it { response.should render_template('new') }
    end
  end

  describe "PUT to update" do
    context "with sucessful save" do
      before { put :update, :id => @projeto.id,  :projeto => { :nome => 'alt' } }

      it { assigns[:projeto].should == @projeto }
      it { flash[:notice].should match('atualizado') }
      it { response.should redirect_to(projeto_url(assigns(:projeto))) }
    end

    context "with failed save" do
      before do
        Projeto.any_instance.stub(:save).and_return(false)
        put :update, :id => @projeto.id,  :projeto => { :nome => '' }
      end

      it { assigns[:projeto].should == @projeto }
      it { flash[:notice].should be_blank }
      it { response.should render_template('edit') }
    end
  end

  context "DELETE to destroy" do
    before { delete :destroy, :id => @projeto.id }

    it { assigns[:projeto].should == @projeto }
    it { flash[:notice].should be_blank }
    it { response.should redirect_to(projetos_url) }
  end

end

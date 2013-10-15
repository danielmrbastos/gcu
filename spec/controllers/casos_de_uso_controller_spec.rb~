# encoding: utf-8
require 'spec_helper'

describe CasosDeUsoController, "as admin" do

  before do
    @caso_de_uso = FactoryGirl.create(:caso_de_uso)
  end

  describe "GET to index" do
    before { get :index }

    it { assigns[:casos_de_uso].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('index') }

  end

  describe "GET to show" do
    before { get :show, :id => @caso_de_uso.id }

    it { assigns[:caso_de_uso].should == @caso_de_uso }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('show') }
  end

  describe "GET to new" do
    before { get :new }

    it { assigns[:caso_de_uso].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('new') }

  end

  describe "GET to edit" do
    before { get :edit, :id => @caso_de_uso.id }

    it { assigns[:caso_de_uso].should == @caso_de_uso }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('edit') }
  end

  describe "POST to create" do
    context "with sucessful save" do
      before { post :create, :caso_de_uso => FactoryGirl.attributes_for(:caso_de_uso) }

      it { assigns[:caso_de_uso].should_not be_nil }
      it { flash[:notice].should match('criado') }
      it { response.should redirect_to(caso_de_uso_url(assigns(:caso_de_uso))) }
    end

    context "with failed save" do
      before do
        CasoDeUso.any_instance.stub(:save).and_return(false)
        post :create, :caso_de_uso => {}
      end

      it { assigns[:caso_de_uso].should_not be_nil }
      it { flash[:notice].should be_blank }
      it { response.should render_template('new') }
    end
  end

  describe "PUT to update" do
    context "with sucessful save" do
      before { put :update, :id => @caso_de_uso.id,  :caso_de_uso => { :nome => 'alt' } }

      it { assigns[:caso_de_uso].should == @caso_de_uso }
      it { flash[:notice].should match('atualizado') }
      it { response.should redirect_to(caso_de_uso_url(assigns(:caso_de_uso))) }
    end

    context "with failed save" do
      before do
        CasoDeUso.any_instance.stub(:save).and_return(false)
        put :update, :id => @caso_de_uso.id,  :caso_de_uso => { :nome => '' }
      end

      it { assigns[:caso_de_uso].should == @caso_de_uso }
      it { flash[:notice].should be_blank }
      it { response.should render_template('edit') }
    end
  end

  context "DELETE to destroy" do
    before { delete :destroy, :id => @caso_de_uso.id }

    it { assigns[:caso_de_uso].should == @caso_de_uso }
    it { flash[:notice].should be_blank }
    it { response.should redirect_to(casos_de_uso_url) }
  end

end

# encoding: utf-8
require 'spec_helper'

describe AtoresController, "as admin" do
  render_views

  before do
    @ator = FactoryGirl.create(:ator)
		@tipo_ator = FactoryGirl.create(:tipo_ator)
  end

  describe "GET to index" do
    before { get :index }

    it { assigns[:atores].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('index') }
  end

  describe "GET to show" do
    before { get :show, :id => @ator.id }

    it { assigns[:ator].should == @ator }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('show') }
  end

  describe "GET to new" do
    before { get :new }

    it { assigns[:ator].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('new') }
  end

  describe "GET to edit" do
    before { get :edit, :id => @ator.id }

    it { assigns[:ator].should == @ator }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('edit') }
  end

  describe "POST to create" do
    context "with sucessful save" do
      before { post :create, :ator => FactoryGirl.attributes_for(:ator, :tipo_ator_id => @tipo_ator.id, :projeto_id => @ator.projeto.id) }

      it { assigns[:ator].should_not be_nil }
      it { flash[:notice].should match('criado') }
      it { response.should redirect_to(ator_url(assigns(:ator))) }
    end

    context "with failed save" do
      before do
        Ator.any_instance.stub(:save).and_return(false)
        post :create, :ator => {}
      end

      it { assigns[:ator].should_not be_nil }
      it { flash[:notice].should be_blank }
      it { response.should render_template('new') }
    end
  end

  describe "PUT to update" do
    context "with sucessful save" do
      before { put :update, :id => @ator.id,  :ator => { :nome => 'alt' } }

      it { assigns[:ator].should == @ator }
      it { flash[:notice].should match('atualizado') }
      it { response.should redirect_to(ator_url(assigns(:ator))) }
    end

    context "with failed save" do
      before do
        Ator.any_instance.stub(:save).and_return(false)
        put :update, :id => @ator.id,  :ator => { :nome => '' }
      end

      it { assigns[:ator].should == @ator }
      it { flash[:notice].should be_blank }
      it { response.should render_template('edit') }
    end
  end

  context "DELETE to destroy" do
    before { delete :destroy, :id => @ator.id }

    it { assigns[:ator].should == @ator }
    it { flash[:notice].should be_blank }
    it { response.should redirect_to(atores_url) }
  end

end

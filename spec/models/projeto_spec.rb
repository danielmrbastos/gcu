# encoding: utf-8
require 'spec_helper'

describe Projeto do
	before { @projeto = FactoryGirl.create(:projeto) }

	it { should validate_presence_of :nome }
	it { should validate_uniqueness_of :nome }

end
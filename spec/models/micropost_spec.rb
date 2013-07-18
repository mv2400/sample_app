require 'spec_helper'

describe Micropost do

	let(:user) { FactoryGirl.create(:user) }
	before { @micropost = user.microposts.build(content: "lorem ipsum")  }

	subject { @micropost }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }
	end

	describe "when content is blank" do
		before { @micropost.content = " " }
		it { should_not be_valid }
	end

	describe "when content is greater than maximum length" do
		before { @micropost.content = "A" * 141 }
		it { should_not be_valid }
	end

end

require 'spec_helper'

describe V1::ScratchersController do
  shared_examples_for "a good API" do
    it "should return a 200 OK code" do
      response.should be_success
    end

    it "should show a json response" do
      response.header['Content-Type'].should include 'application/json'
    end
  end

  context "Index" do
    before(:each) do
      @scratchers = Scratcher.all.to_a
      get default_scratchers_path
    end

    it_behaves_like "a good API"

    it "should show a list of scratchers" do
      response.body.should have_json_size(@scratchers.size)
      @scratchers.to_json.should be_json_eql(response.body)
    end
  end

  context "Show" do
    let(:scratcher){ FactoryGirl.create(:scratcher) }

    before(:each){ get default_scratcher_path(scratcher) }

    it_behaves_like "a good API"

    it "should show the scratcher data" do
      scratcher.to_json.should be_json_eql(response.body)
    end
  end

  context 'Create' do
    before(:each)do 
      @initial_scratchers = Scratcher.count
      post default_scratchers_path, scratcher: FactoryGirl.attributes_for(:scratcher), format: :json
    end

    it_behaves_like "a good API"

    it "should store the scratcher" do
      Scratcher.count.should == @initial_scratchers + 1
    end

    it "should show a succesfully created status code (201)" do
      response.status.should == 201
    end

    it "should show the recently created scratcher" do
      response.body.should have_json_path("name")
      response.body.should have_json_path("cost")
      response.body.should have_json_path("size")
      response.body.should have_json_path("color")
    end
  end

  context 'Update' do
    let(:initial_scratchers){ Scratcher.count }
    let(:scratcher){ FactoryGirl.create(:scratcher) }
    let(:new_attributes){ FactoryGirl.attributes_for(:scratcher) }

    before(:each){ patch default_scratcher_path(scratcher), scratcher: new_attributes, format: :json }

    it "should return a succesfully http status code (204)" do
      response.should be_success
    end

    it "should update the scratcher" do
      assigns(:scratcher).to_json.should_not be_json_eql(scratcher.to_json)

      assigns(:scratcher).name.should == new_attributes[:name]
      assigns(:scratcher).size.should == new_attributes[:size]
      assigns(:scratcher).color.should == new_attributes[:color]
      assigns(:scratcher).cost.should == new_attributes[:cost]

      Scratcher.count.should == initial_scratchers
    end

    it "should show nothing" do
      response.body.should be_empty
    end
  end

  context "Delete" do
    before(:each) do 
      scratcher = FactoryGirl.create(:scratcher)
      @initial_scratchers = Scratcher.count
      delete default_scratcher_path(scratcher)
    end

    it "should return a succesfully http status code" do
      response.should be_success
    end

    it "should show nothing" do
      response.body.should be_empty
    end

    it "should delete a scratcher" do
      Scratcher.count.should == @initial_scratchers - 1
    end
  end
end

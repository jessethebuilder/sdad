require 'rails_helper'

RSpec.describe 'Save Draft Archive Delete Requests', :type => :feature do
  let!(:sdad){ create :sdad_obj }

  describe 'Index' do

  end

  describe 'Show' do
  end

  describe 'New' do
    let(:test_title){ Faker::Company.bs }

    before(:each) do
      visit '/sdad_objs/new'
    end

    specify 'it should publish a news story' do
      fill_in 'Title', :with => test_title
      click_button 'Publish'

      #knowing NewsStory uses FarmSlugs
      current_path.should == "/sdad_objs/#{test_title.parameterize}"
      page.should have_content test_title
    end

    it 'should not save the story, or show it as published if there is a validation error' do
      click_button 'Publish'
      page.should have_content "Title can't be blank"
      page.should_not have_content('Status: Published')
      page.should have_content('Status: Draft')
    end
  end

  describe 'Edit' do
    specify 'Publish button should set :published to true and :archived to false' do
       visit "/sdad_objs/#{sdad.id}/edit"
       click_button 'Publish'

       story = NewsStory.find(sdad.id)
       story.published.should == true
       story.archived.should == false
     end

     specify 'Draft button should set :published to false and :archived to false' do
       visit "/sdad_objs/#{sdad.id}/edit"
       click_button 'Save Draft'
       sdad.published.should == false
       sdad.archived.should == false
     end

     ###### Relies on JS alert(). May need webdriver

     # specify 'Archive button should set :published to false and :archived to true' do
     #   visit "/sdad_objs/#{ns.id}/edit"
     #   page.accept_alert "Archived News Stories will not appear on site. Are you sure?" do
     #    click_button 'Archive'
     #   end
     #   ns.published.should == false
     #   ns.archived.should == true
     # end


     # specify  'Delete button should delete the record' do
     #   visit "/sdad_objs/#{ns.id}/edit"
     #   page.accept_alert "This will delete #{ns.title} permanently. Are you sure?" do
     #    click_link 'Delete'
     #   end
     #
     #   ns.deleted?.should == true
     # end
  end #end Edit
end
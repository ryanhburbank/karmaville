require 'spec_helper'

describe 'pagination' do
include GenerateUsers

  before :each do
    generate_users
    visit (root_url)
  end


  it "will display the correct number of pages" do
    paginate_links = all('div.pagination li')
    expect(paginate_links.length).to eql(7)
  end

  it "will mark the correct page as active" do
    expect(page.find('.pagination li.active').text).to eq "1"
  end

  it "user clicks next will take them to page 2" do
    find('.pagination').click_link('Next')
    expect(page.find('.pagination li.active').text).to eq "2"
  end

   it "user clicks previous will take them to page 1" do
    find('.pagination').click_link('Next')
    find('.pagination').click_link('Prev')
    expect(page.find('.pagination li.active').text).to eq "1"
  end

  it "user clicks link 4 will go to link 4" do
    find('.pagination').click_link('4')
    expect(page.find('.pagination li.active').text).to eq "4"
  end
end

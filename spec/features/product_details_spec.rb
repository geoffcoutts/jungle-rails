require 'rails_helper'

RSpec.feature "Visitor navigates to a product's details page by clicking on it from the homepage", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
    end
  end

  scenario "They click on the product image and go to product page" do
    visit root_path

    expect(page).to have_css 'article.product'

    page.all('article.product').sample.find('header a img').click

    expect(page).to have_css 'section.products-show'

    save_screenshot
  end

end

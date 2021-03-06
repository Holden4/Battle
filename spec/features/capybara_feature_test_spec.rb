require 'spec_helper'

RSpec.feature "Capybara feature tests" do
  scenario "Players can enter their names" do
    sign_in_and_play
      expect(page).to have_content "Rob vs. Ben"
  end

  scenario "So players can see their hit points" do
    sign_in_and_play
      expect(page).to have_content "Rob: 100"
  end

  scenario "Attacks cause damage" do
    sign_in_and_play
      click_button "Attack"
        expect(page).to have_content "Hit points Ben: 90"
  end

  scenario "Tell's you who's turn it is" do
    sign_in_and_play
        expect(page).to have_content "Rob's turn"
  end

  scenario "Turn switches after attack" do
    sign_in_and_play
      click_button "Attack"
        expect(page).to have_content "Ben's turn"
  end


    scenario "A player looses" do
      sign_in_and_play
        19.times { click_button "Attack" }
          expect(page).to have_content "Rob WINS!"
    end

end

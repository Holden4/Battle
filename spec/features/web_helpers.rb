
def sign_in_and_play

  visit('/')
    fill_in :player_1_name, with: 'Rob'
    fill_in :player_2_name, with: 'Ben'
  click_button 'Submit'
end

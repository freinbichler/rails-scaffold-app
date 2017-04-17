require 'test_helper'

class UserFlowTest < Capybara::Rails::TestCase
  def setup
    @one = users :one
    @two = users :two
  end

  test 'user index' do
    visit users_path

    assert page.has_content?(@one.username)
    assert page.has_content?(@two.username)
  end

  test 'create new user' do
    visit users_path

    click_on 'New User'

    fill_in 'Username', with: 'John'
    fill_in 'Password', with: 'omgsosecure'

    click_on 'Create User'

    assert_current_path user_path(User.last)
    assert page.has_content?('John')
    assert page.has_content?('omgsosecure')
  end
end

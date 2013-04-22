class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init

  def init
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end
  helper_method :current_user

  def leftside_bar(add_links = [])
    add_links ||= []
    common_links = [
      {
        text: 'Common links',
        header: true,
      },
      {
        text: 'Link2',
        link: '#',
        name: :link2
      },
      {
        text: 'Link3',
        link: '#',
        name: :link3
      },
      {
        text: 'Link4',
        link: '#',
        name: :link4
      },
    ]
    account_management = current_user == nil ? [] :
    [
      {
        text: 'Account management',
        header: true,
      },
      {
        text: 'My account',
        link: {controller: :users, id: current_user.id, action: :edit},
        name: :my_acc
      },
    ]
    add_links + common_links + account_management
  end
  helper_method :leftside_bar
end

class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASS']
  before_filter :authorize

  def show
  end
end

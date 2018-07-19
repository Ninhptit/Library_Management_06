class Admin::BaseController < ApplicationController
  authorize_resource :class => "Admin::BaseController"
  before_action :authenticate_user!
  # before_action :authenticate_user!
  layout "admin/application"
end

# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!  
  
end
class PagesController < ApplicationController
  before_filter :authenticate_user!

  def landing

  end

end

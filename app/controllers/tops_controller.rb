class TopsController < ApplicationController
  def index
    @tops = Top.new
end

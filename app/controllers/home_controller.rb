# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    data = GenerateDataForC3.call

    if data.success?
      @columns = data.result
      render
    else
      redirect_to '/500.html'
    end
  end
end

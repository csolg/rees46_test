# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    data = GenerateDataForC3.call

    if data.success?
      @columns = data.result
      render
    else
      render 500, text: 'Fail to generate data for C3'
    end
  end
end

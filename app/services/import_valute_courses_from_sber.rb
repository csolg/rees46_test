# frozen_string_literal: true

class ImportValuteCoursesFromSber < ApplicationService
  attr_reader :date

  def initialize(date = nil)
    @date = date || Date.today
  end

  def call
    date_req = date.strftime('%d/%m/%Y')
    http_result = Faraday.get("https://www.cbr.ru/scripts/XML_daily.asp?date_req=#{date_req}")
    courses = Nokogiri::XML(http_result.body)
    courses.xpath('//Valute/CharCode[text() = "USD" or text() = "EUR"]').each do |course|
      char_code = course.xpath('CharCode').children.first.to_s
      name = course.xpath('Name').children.first.to_s
      value = course.xpath('VunitRate').children.first.to_s.gsub(',', '.').to_f
      valute = Valute.find_or_create_by!(char_code: char_code, name: name)
      unless valute.valute_courses.exists?(date: date)
        valute.valute_courses.create!(date: date, value: value)
      end
    end
  end
end

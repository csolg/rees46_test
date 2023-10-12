# frozen_string_literal: true

class ImportValuteCoursesFromSber < ApplicationService
  attr_reader :date

  def initialize(date = nil)
    @date = date || Time.zone.today
  end

  def call
    load_courses.each { |course| process_course(course) }
  end

  def load_courses
    date_req = date.strftime('%d.%m.%Y')
    url = "https://www.cbr.ru/scripts/XML_daily.asp?date_req=#{date_req}"
    http_result = Faraday.get(URI.parse(url))
    courses = Nokogiri::XML(http_result.body)
    courses.xpath('//Valute/CharCode[text()="USD" or text()="EUR"]').map(&:parent)
  end

  def process_course(course)
    char_code, name, value = extract_data(course)
    valute = Valute.find_or_create_by!(char_code:, name:)
    valute.valute_courses.create!(date:, value:) unless valute.valute_courses.exists?(date:)
  end

  def extract_data(course)
    [
      course.xpath('CharCode').children.first.to_s,
      course.xpath('Name').children.first.to_s,
      course.xpath('VunitRate').children.first.to_s.gsub(',', '.').to_f
    ]
  end
end

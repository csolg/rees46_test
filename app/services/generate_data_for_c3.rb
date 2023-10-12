class GenerateDataForC3 < ApplicationService
  attr_reader :from, :to

  def initialize(from=nil, to=nil)
    @from = from || 1.month.ago
    @from = @from.in_time_zone.to_date
    @to = to || Date.today
    @to = @to.in_time_zone.to_date
  end

  def call
    [['dates'] + generate_dates] + generate_valutes
  end

  def generate_dates
    from.step(to).to_a
  end

  def generate_dates_hash
    Hash[generate_dates.map { |d| [d, nil] }]
  end
  
  def generate_valutes
    Valute.all.to_a.map do |valute|
      dates_hash = generate_dates_hash
      valute.valute_courses.where('date between ? and ?', from, to).each do |course|
        dates_hash[course.date] = course.value.to_f
      end
      [valute.char_code] + dates_hash.values
    end
  end
end

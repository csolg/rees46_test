# frozen_string_literal: true

require 'rails_helper'

describe ImportValuteCoursesFromSber do
  before { Timecop.freeze(Time.local(2023, 10, 10)) }

  it { expect{ ImportValuteCoursesFromSber.call }.to change { ValuteCourse.count }.by(1) }
  it { expect{ ImportValuteCoursesFromSber.call }.to change { Valute.count }.by(1) }

  after { Timecop.return }
end

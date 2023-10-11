# frozen_string_literal: true

require 'rails_helper'

describe ImportValuteCoursesFromSber, vcr: true do
  it { expect{ ImportValuteCoursesFromSber.call }.to change { ValuteCourse.count }.by(1) }
  it { expect{ ImportValuteCoursesFromSber.call }.to change { Valute.count }.by(1) }
end
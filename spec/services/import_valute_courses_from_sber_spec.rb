# frozen_string_literal: true

require 'rails_helper'

describe ImportValuteCoursesFromSber, :vcr do
  it { expect { described_class.call }.to change(ValuteCourse, :count).by(2) }
  it { expect { described_class.call }.to change(Valute, :count).by(2) }
end

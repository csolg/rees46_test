# frozen_string_literal: true

require 'rails_helper'

describe GenerateDataForC3 do
  let(:from) { 3.days.ago.in_time_zone.to_date }
  let!(:valute) { create(:valute, char_code: 'USD') }
  let!(:valute_courses) do
    from.step(Time.zone.today.to_date).map do |date|
      create(:valute_course, valute:, date:, value: rand(100))
    end
  end
  let(:response) { described_class.call(from) }

  before { create(:valute, char_code: 'EUR') }

  context 'when valute_courses exist for all days' do
    it { expect(response.success?).to be true }
    it { expect(response.result.map(&:first)).to eq %w[dates USD EUR] }
    it { expect(response.result[1]).to eq ['USD'] + valute_courses.map(&:value) }
    it { expect(response.result[2].compact.size).to eq 1 }
  end

  context 'with gaps in valute courses' do
    let(:n) { 3 }

    before { n.times { valute_courses.sample.destroy } }

    it { expect(described_class.call(from).result[1].select(&:nil?).size).to eq n }
  end
end

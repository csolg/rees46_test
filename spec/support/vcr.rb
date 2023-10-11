# frozen_string_literal: true

RSpec.configure do |config|
  # Add VCR to all tests
  config.around do |example|
    vcr_tag = example.metadata[:vcr]

    if vcr_tag
      options = vcr_tag.is_a?(Hash) ? vcr_tag : {}
      path_data = [example.metadata[:description]]
      parent = example.example_group

      while parent.parent_groups.size > 1
        path_data << parent.metadata[:description]
        parent = parent.parent_groups.second
      end

      name = path_data.map do |str|
        str.underscore.gsub('.', '').gsub(%r{[^\w/]+}, '_').gsub(%r{/$}, '')
      end.reject(&:empty?).reverse.join('/')

      options[:record] = :new_episodes

      VCR.use_cassette(name, options) do
        time = VCR.current_cassette.originally_recorded_at || Time.zone.now

        Timecop.travel(time) do
          example.call
        end
      end
    else
      VCR.turned_off(&example)
    end
  end
end

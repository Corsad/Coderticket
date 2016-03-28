FactoryGirl.define do
  factory :event do
    name "Test"
    starts_at DateTime.now + 2.hours
    ends_at DateTime.now + 4.hours
    venue_id 1
    hero_image_url "asdf"
    extended_html_description "fdsa"
    category_id 1
  end

end

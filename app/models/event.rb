class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :creater, class_name: 'User'
  has_many :ticket_types
  accepts_nested_attributes_for :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def venue_name
  	venue.try(:name)
  end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  def upcomming_events?
  	starts_at ? !starts_at.past? : nil
  end
end

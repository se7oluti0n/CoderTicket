class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :category
  has_many   :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming_events
    Event.where('ends_at > ?', Time.now )
  end

  def self.published
    Event.where('published_at IS NOT NULL AND ends_at > ?', Time.now)
  end

  def have_enough_ticket_types?
    ticket_types.count > 0
  end

  def published?
    !!published_at
  end
end

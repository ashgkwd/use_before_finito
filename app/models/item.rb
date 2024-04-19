class Item < ApplicationRecord
  has_one_attached :image

  validates :expired_at, presence: true
  validates :name, presence: true

  default_scope { where(archived: false) }
  scope :archived, -> { unscoped.where(archived: true) }
  scope :freshness, -> { order(expired_at: :asc) }
  scope :staleness, -> { order(expired_at: :desc) }

  def expired?
    expired_at.to_date - Date.today < 1
  end

  def archivable?
    !archived? && expired?
  end

  def archive
    if expired?
      self.archived = true
      self.save
    else
      errors.add(:expired_at, "can not archive item that is not yet expired")
      false
    end
  end
end

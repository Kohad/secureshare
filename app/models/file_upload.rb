class FileUpload < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  before_create :generate_slug

  validates :title, :description, presence: true

  private

  def generate_slug
    self.slug = SecureRandom.hex(5)
  end
end

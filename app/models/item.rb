class Item < ActiveRecord::Base

  #Запретить все кроме
  #attr_accessible :login, :price, :name, :description, :productiontime, :type

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true
  #validates :image, file_size: { less_than: 1.megabytes }

  #validates :description, presence: true
  #validates :productiontime,
  #validates :type,

  after_initialize{ puts 'initialize' }
  mount_uploaders :images, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.
=begin
  after_save{}
  after_create{}
  after_update{}
  after_destroy{}
=end

  belongs_to  :category
  has_many    :positions
  has_many    :carts, through: :positions


end
class Figure < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods
  # add relationships here
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end

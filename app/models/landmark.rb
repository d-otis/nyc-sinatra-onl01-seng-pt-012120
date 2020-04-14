class Landmark < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods
  # add relationships here
  belongs_to :figure
end

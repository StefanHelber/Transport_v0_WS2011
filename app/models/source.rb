class Source < ActiveRecord::Base
  has_many :transport_links, :dependent => :destroy
end

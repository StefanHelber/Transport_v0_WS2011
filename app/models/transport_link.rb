class TransportLink < ActiveRecord::Base
  belongs_to :source, :class_name =>  "Source"
  belongs_to :sink, :class_name =>  "Sink"
end

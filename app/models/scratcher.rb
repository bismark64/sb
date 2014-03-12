class Scratcher
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :size, type: String
  field :color, type: String
  field :cost, type: String
end

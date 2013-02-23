require 'csv'
class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_ref, :ref

set_primary_key :ref
validates :ref, :presence=>true, :uniqueness=>true
belongs_to :host, :class_name=>"Host", :foreign_key=>"host_ref"
has_many :bookings, :class_name=>"Booking",:foreign_key=>'room_ref'


def self.import(file)

 # CSV.foreach(file.path) do |row|
additional_rows_to_skip = 1
 CSV.foreach(file.path) do |row|
 if additional_rows_to_skip > 0
additional_rows_to_skip-=1
else
 p = Room.create!({
          :ref => row[0],
          :host_ref => row[1],
          :capacity => row[2],
        }
      )
  end
end
#Host.delete_all("ref='ref'")
end


end

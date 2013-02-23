require 'csv'
class Booking < ActiveRecord::Base
  attr_accessible :end_date, :number_of_guests, :ref, :room_ref, :start_date

set_primary_key :ref
validates :ref, :presence=>true, :uniqueness=>true
belongs_to :room, :class_name=>"Room", :foreign_key=>"room_ref"


def self.import(file)

 # CSV.foreach(file.path) do |row|
additional_rows_to_skip = 1
 CSV.foreach(file.path) do |row|
 if additional_rows_to_skip > 0
additional_rows_to_skip-=1
else
 p = Booking.create!({
          :ref => row[0],
          :room_ref => row[1],
          :start_date => row[2],
	:end_date => row[2],
	:number_of_guests =>row[3],
        }
      )
  end
end

end

end

class AddTimestampsToCurrency < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:currencies)
  end
end

class HomesController < ApplicationController
  def show
    @ticks = BtcPrice.all
    @min_graph_y = BtcPrice.minimum(:price) - 100
    @max_graph_y = BtcPrice.maximum(:price) + 100
  end
end

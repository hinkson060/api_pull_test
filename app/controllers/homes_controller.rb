class HomesController < ApplicationController
  def show
    @ticks = BtcPrice.all
    @min_graph_y = BtcPrice.minimum(:price) - 50
    @max_graph_y = BtcPrice.maximum(:price) + 50
  end
end

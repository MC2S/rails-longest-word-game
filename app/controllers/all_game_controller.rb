class AllGameController < ApplicationController
  def generate_grid(grid_size)
  grid = []
  grid_size.times { grid << 65.+(rand(25)).chr }
  return grid
  end

  def game
    @grid = generate_grid(9)
    @display_grid = @grid
    @data_grid = @grid.join("")
    @start_time = Time.now
  end

  def score
    @time = Time.now - params[:start_time].to_time
    @grid = params[:grid].split("")
    @answer = params[:query]
    @answer_data = @answer.split("")
    if check_error(@grid, @answer_data) == 0
      @score = @time * @answer.length
      @message = "well done !"
    else
      @message = "Incorrect answer"
    end
  end

  def check_error(grid, answer)
    @error = 0
    answer.each { |x| grid.include? x ? grid -= [x] : @error += 1 }
    return @error
  end
end

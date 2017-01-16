#!/usr/bin/env ruby
require "json"
require "base64"

class Tile
  START_TILE = ?s
  PICKAXE = ?p
  POINT = /[1-9]/
  MOVES = { 
    l: { x: -1, y: 0 },
    r: { x: 1, y: 0 },
    u: { x: 0, y: -1 },
    d: { x: 0, y: 1 }
  }
  attr_reader :x, :y, :move
  
  def initialize(x, y, face: START_TILE, move: nil)
    @x, @y = x, y
    @face, @move = face, move
  end

  def score
    @face =~ POINT ? @face.to_i : 0
  end

  def reachable_neighbors(grid, w, h, visited = [])
    MOVES.map do |(move, offsets)|
      x2, y2 = x + offsets[:x], y + offsets[:y]
      next if collision? x2, y2, w, h, visited
      Tile.new x2, y2, face: grid[y2][x2], move: move
    end.compact
  end

  def in?(x, y)
    @x == x && @y == y
  end

  def has_pickaxe?
    @face == PICKAXE
  end

  private

  def collision?(x, y, w, h, visited)
    within_bounds = (0..w).include?(x) && (0..h).include?(y)
    !within_bounds || visited.any? { |tile| tile.in? x, y }
  end
end

class Cave 
  attr_reader :width, :height

  def initialize(grid, max_moves)
    @grid, @max_moves = grid, max_moves
    @moves, @pickaxes, @score = [], 0, 0
    @width, @height = @grid.first.size, @grid.size
    @current_tile = Tile.new start_tile_index, start_row_index
    @visited = [@current_tile]
  end

  def solve
    @tiles = @current_tile.reachable_neighbors @grid, @width, @height, @visited
    return solution if @tiles.none?

    @visited << @current_tile = best_tile
    @moves << @current_tile.move
    @pickaxes += 1 if @current_tile.has_pickaxe?
    @score += @current_tile.score * 2 ** @pickaxes.size

    @moves.size == @max_moves ? solution : solve
  end

  private

  def solution
    { moves: @moves.join, score: @score }
  end

  def best_tile
    @tiles.find &:has_pickaxe? or @tiles.max_by &:score
  end

  def start_tile_index
    @grid[start_row_index].index Tile::START_TILE
  end

  def start_row_index
    @grid.index { |row| row.include? Tile::START_TILE }
  end
end

class Spelunker
  def solve(challenges)
    @solutions = challenges.map do |challenge|
      grid = parse_layout challenge.fetch "layout"
      cave = Cave.new grid, challenge.fetch("moves")
      cave.solve
    end
    { score: sum_scores, solutions: list_solutions }
  end

  private

  def sum_scores
    @solutions.inject(0) { |a, s| a + s[:score] }
  end

  def list_solutions
    @solutions.map{|s|s[:moves]}.join(",")
  end

  def parse_layout(layout)
    layout.split(?,).map &:chars
  end
end

if $0 == __FILE__
  STDERR.puts "missing argument FILENAME" and exit 1 if ARGV[0].nil?
  encoded = File.read ARGV[0]
  challenges = JSON.parse Base64.decode64 "#{encoded}"
  puts Spelunker.new.solve challenges
end
# Game will hold all Game Logic, gameboard etc.
class Game < ApplicationRecord
  belongs_to :white_user, class_name: 'User'
  belongs_to :black_user, class_name: 'User', optional: true
  has_many :pieces

  after_create :fill_board

  scope :available, ->{ where(black_user_id: nil) }

  def available?
    self.black_user.blank?
  end

  def populate_board!

  end

  def fill_board
    # fill white pieces
    (0..7).each do |i|
      Pawn.create(user_id: self.white_user_id, game_id: self.id, x_position: i, y_position: 6, color: true)
    end

    Rook.create(user_id: self.white_user_id, game_id: self.id, x_position: 0, y_position: 7, image: 'white-rook.png', color: true)
    Rook.create(user_id: self.white_user_id, game_id: self.id, x_position: 7, y_position: 7, image: 'white-rook.png', color: true)
    Knight.create(user_id: self.white_user_id, game_id: self.id, x_position: 1, y_position: 7, image: 'white-knight.png', color: true)
    Knight.create(user_id: self.white_user_id, game_id: self.id, x_position: 6, y_position: 7, image: 'white-knight.png', color: true)
    Bishop.create(user_id: self.white_user_id, game_id: self.id, x_position: 2, y_position: 7, image: 'white-bishop.png', color: true)
    Bishop.create(user_id: self.white_user_id, game_id: self.id, x_position: 5, y_position: 7, image: 'white-bishop.png', color: true)
    Queen.create(user_id: self.white_user_id, game_id: self.id, x_position: 3, y_position: 7, image: 'white-queen.png', color: true)
    King.create(user_id: self.white_user_id, game_id: self.id, x_position: 4, y_position: 7, image: 'white-king.png', color: true)

    # fill black pieces
    (0..7).each do |i|
      Pawn.create(user_id: self.black_user_id, game_id: self.id, x_position: i, y_position: 1, color: false)
    end

    Rook.create(user_id: self.black_user_id, game_id: self.id, x_position: 0, y_position: 0, image: 'black-rook.png', color: false)
    Rook.create(user_id: self.black_user_id, game_id: self.id, x_position: 7, y_position: 0, image: 'black-rook.png', color: false)
    Knight.create(user_id: self.black_user_id, game_id: self.id, x_position: 1, y_position: 0, image: 'black-knight.png', color: false)
    Knight.create(user_id: self.black_user_id, game_id: self.id, x_position: 6, y_position: 0, image: 'black-knight.png', color: false)
    Bishop.create(user_id: self.black_user_id, game_id: self.id, x_position: 2, y_position: 0, image: 'black-bishop.png', color: false)
    Bishop.create(user_id: self.black_user_id, game_id: self.id, x_position: 5, y_position: 0, image: 'black-bishop.png', color: false)
    Queen.create(user_id: self.black_user_id, game_id: self.id, x_position: 3, y_position: 0, image: 'black-queen.png', color: false)
    King.create(user_id: self.black_user_id, game_id: self.id, x_position: 4, y_position: 0, image: 'black-king.png', color: false)
  end
end

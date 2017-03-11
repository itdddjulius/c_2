require 'rails_helper'

RSpec.describe King, type: :model do

  describe 'valid_move?' do
      
    king = King.create(color: true, x_position: 3, y_position: 5)
    
    it 'be a valid move' do
      expect(king.valid_move?(3, 6)).to eq(true)
      expect(king.valid_move?(3, 4)).to eq(true)
      expect(king.valid_move?(2, 6)).to eq(true)
      expect(king.valid_move?(2, 5)).to eq(true)
      expect(king.valid_move?(2, 4)).to eq(true)
      expect(king.valid_move?(4, 6)).to eq(true)  
      expect(king.valid_move?(4, 5)).to eq(true)
      expect(king.valid_move?(4, 4)).to eq(true)    
    end

    it 'be an invalid move' do
      expect(king.valid_move?(3, 5)).to eq(false)
      expect(king.valid_move?(3, 7)).to eq(false)
      expect(king.valid_move?(3, 8)).to eq(false)
      expect(king.valid_move?(1, 5)).to eq(false)
    end
  end
  
  describe 'castling' do 
    black_king = King.create(color: false, x_position: 4, y_position: 7)
    black_kingside_rook = Rook.create(color: false, x_position: 7, y_position: 7)
    black_queenside_rook = Rook.create(color: false, x_position: 0, y_position: 7)
    white_king = King.create(color: true, x_position: 4, y_position: 0)
    white_kingside_rook = Rook.create(color: false, x_position: 7, y_position: 0)
    white_queenside_rook = Rook.create(color: false, x_position: 0, y_position: 0)

    context 'valid castle moves' do 
      it 'returns true for queenside castle' do 
        expect(black_king.can_castle?(black_queenside_rook)).to eq(true)
        expect(white_king.can_castle?(white_queenside_rook)).to eq(true)
      end 
      it 'returns true for kingside castle' do 
        expect(black_king.can_castle?(black_kingside_rook)).to eq(true)
        expect(white_king.can_castle?(white_kingside_rook)).to eq(true)
      end 
    end 
  end 

end
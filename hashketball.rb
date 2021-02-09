# Write your code below game_hash
require 'pry'
require_relative './game_hash.rb'

def get_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

# def get_teams
#   game_hash[:home][:team_name] + game_hash[:away][:team_name]
# end

def get_team(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away]
  end
end

def num_points_scored(player)
  # players = get_players
  get_players.each do |player_index|
    if player_index[:player_name] == player
      return player_index[:points]
    end
  end
end

def shoe_size(player)
  get_players.each do |player_index|
    if player_index[:player_name] == player
      return player_index[:shoe]
    end
  end
end

def team_colors(team)
  get_team(team)[:colors]
end

def team_names
  name_array = []
  name_array.push(game_hash[:home][:team_name])
  name_array.push(game_hash[:away][:team_name])
end

# def player_numbers (team_name)
#   players = get_team(team_name)[:players]
#   numbers_array = []
#   players.each do |index|
#     numbers_array.push(index[:number])
#   end
#   numbers_array
# end

def player_numbers (team_name)
  get_team(team_name)[:players].map do |player|
    player[:number]
  end
end

def player_stats(player_name)
  get_players.find do |poo|
    poo[:player_name] == player_name
  end
end

# def big_shoe_rebounds
#   get_players.map do |player|
#     player[:shoe]
#   end
#   binding.pry
#   player_shoes.max
# end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

#Write code here
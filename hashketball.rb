require "pry"

def game_hash()
  hashketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 
        },        
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },        
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 
        },        
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        },        
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },        
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0 
        },        
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  } 
end

def home_team_name()
  game_hash[:home][:team_name]
end

puts home_team_name

def num_points_scored(name)
  
  points = 0
  
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|  #player data 
          player.each do |k, v|
            if k == name
              return v[:points]
            end
          end
        end
      end
    end
  end
  points
end


def shoe_size(name)
  
  size = game_hash
  
  size.each do |location, team_data|
    
    team_data.each do |attribute, data|
      
      if attribute == :players
        
        data.each do |player|
          
          player.each do |k, v|
            if k == name
              return v[:shoe]
            end
          end
        end
      end
    end
  end
  
end

def team_colors(team_name)
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if team_data[:team_name] == team_name
        return team_data[:colors]
      end
    end
  end
end

def team_names()
  teams = []
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
        #binding.pry
        if attribute == :team_name
          #binding.pry
          teams << team_data[:team_name]
        end
    end
  end
  
  teams
end

def player_numbers(team_name)
  
  jersey = game_hash
  
  jersey_list = []
  
  jersey.each do |location, team_data|
    
    if team_data[:team_name] == team_name
    
      team_data.each do |attribute, data|
        
        if attribute == :players
          
          data.each do |player|
            player.each do |k, v|
              #binding.pry
                jersey_list << v[:number]
            end
          end
        end
      end
    end
  end
  
  jersey_list
end

def player_stats(player_name)
  
  game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data|
        
        if attribute == :players
          data.each do |player|
            #binding.pry
            player.each do |k,v|
              if k == player_name
              return v
              end
            end
          end
        end
      end
  end
end

def big_shoe_rebounds()
  # First, find the player with the largest shoe size
  # Then, return that player's number of rebounds
  # Remember to think about return values here. Use `binding.pry` to drop into
  #   your method and understand what it is returning and why.
  
  big_shoe = 0
  rebounds = 0
  
  game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data|
        
        if attribute == :players
          data.each do |player|
            #binding.pry
            player.each do |k,v|
              if v[:shoe] > big_shoe
                big_shoe = v[:shoe]
                rebounds = v[:rebounds]
              end
            end
          end
        end
      end
  end
  
  return rebounds
end

# **Bonus Questions:**

# Define methods to return the answer to the following questions:

# 1. Which player has the most points? Call the method `most_points_scored`.

def most_points_scored
  top_scorer = ""
  current_max = 0
  
  game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data|
        
        if attribute == :players
          data.each do |player|
            player.each do |k,v|
              if v[:points] > current_max
                #binding.pry
                top_scorer = k
                current_max = v[:points]
              end
            end
          end
        end
      end
  end
  
  return top_scorer
end

# 2. Which team has the most points? Call the method `winning_team`.

def winning_team
  away_score = 0
  home_score = 0
  
  game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data|
        
        if attribute == :players
          data.each do |player|
            player.each do |k,v|
              if location == :away 
                away_score += v[:points]
              elsif location == :home
                home_score += v[:points]
            
            end
          end
        end
      end
  end
  
  return top_scorer
end

# 3. Which player has the longest name? Call the method `player_with_longest_name`.

# **Super Bonus:**

# 1. Write a method that returns true if the player with the longest name had the
#   most steals. Call the method `long_name_steals_a_ton?`.


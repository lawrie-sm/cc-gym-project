createdb gym
psql -d gym -f "./db/gym.sql"
ruby ./db/seeds.rb

class LeaderboardController < ApplicationController
  skip_before_action :authenticate_request


  def index
    @users = User.includes(:activity_logs).all
    @leaderboard = []
    @users.each do |user|
      user.position = 0
      user.activity_logs.each do |activity|
        user.position += activity[:data][:data][:attributes][:distance]
      end
      @leaderboard.push({user: user[:name], meters: user.position})
    end
    @leaderboard.sort_by {|runner| runner[:meters]}
    @leaderboard.each_with_index do |runner, index|
      runner[:position] = index
    end
    render json: @leaderboard
  end
end

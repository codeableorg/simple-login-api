class ConversationsController < ApplicationController
  def index
    render json: Conversation.all, status: :ok
  end
end

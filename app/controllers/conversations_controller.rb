class ConversationsController < ApplicationController
  def index
    conversations = Conversation.all
    render json: conversations, include: :messages, status: :ok
  end
end

class SendMessage < ApplicationService
  def call
    send_message

    result
  end

  private

  def channel_id
    context[:channel_id] || params[]
  end

  def message
    params[:message]
  end

  def send_message
    Bot.send_message(channel_id: channel_id, message: message)
  end
end

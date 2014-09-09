class RepliesController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    reply = reply_params['From']
    Reply.auto_reply(reply)
    redirect_to contacts_path
  end

private
  def reply_params
    params.permit(:From)
  end
end

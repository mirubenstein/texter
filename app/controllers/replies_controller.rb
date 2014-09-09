class RepliesController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    @reply = Reply.create(from: reply_params['From'], body: reply_params['Body'])
    Reply.auto_reply(@reply.from)
    redirect_to contacts_path
  end

private
  def reply_params
    params.permit(:From, :Body)
  end
end

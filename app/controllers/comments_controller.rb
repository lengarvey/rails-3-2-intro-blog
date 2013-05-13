class CommentsController < ApplicationController
  respond_to :html, :xhr

	def create
		post = Post.find(params[:post_id])
		@comment = post.comments.create!(params[:comment])
    respond_with(@comment) do |format|
      format.html { redirect_to post }
    end
	end

  private

  def self.responder
    XhrResponder
  end
end

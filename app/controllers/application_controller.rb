class ApplicationController < ActionController::Base
    # rescue_from ActiveRecord::RecordNotFound do |ex|
    #     render json: { status: 404, error: ex.to_s }, status: 404
    # end

    # rescue_from ActiveRecord::RecordNotFound do
    #     render :action => "article_missing", :status => :not_found
    #   end
end

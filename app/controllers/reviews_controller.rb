class ReviewsController < ApplicationController
    before_action :set_movie
    before_action :require_signin
    
    def index
        @reviews = @movie.reviews
    end

    def new
        @review = @movie.reviews.new
    end

    def create
        @review = @movie.reviews.new(review_params)
        @review.user = current_user
        
        if @review.save
            redirect_to movie_reviews_path(@movie),
                        notice: "Thanks for your review!"
        else
            render :new, status: :unprocessable_entity
        end
    end


    private

        def set_movie
            @movie = Movie.find(params[:movie_id])
        end

        def review_params
            params.require(:review).permit(:stars, :comment) 
        end

end

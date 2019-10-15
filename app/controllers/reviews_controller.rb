class ReviewsController < ApplicationController
    before_action :find_resturant
    before_action :find_review, only: [:edit, :update, :destroy]
    # @review allows for the respective view to use the object 
    def new
        @review = Review.new
        
    end

    def create
        @review = Review.new(review_params)
        # set review's X_ID to selected X's ID
        @review.resturant_id = @resturant.id
        @review.user_id = current_user.id #will cause issues if unAuth user accesses the new_resturant_review_path

        if @review.save
            redirect_to resturant_path(@resturant)
            else
            render 'new'
        end
    end
    
    def edit
    end

    def update
        @review = Review.find(params[:id])

        if @review.update(review_params)
            redirect_to resturant_path(@resturant)
        else
            render 'edit'
        end
    end
    
    def destroy
        @review.destroy
        redirect_to resturant_path(@resturant)

    end
    
    

    private
        # select review values
        def review_params
            params.require(:review).permit(:rating, :comment)
        end
        # select resturant that is associated with said review
        def find_resturant
            @resturant = Resturant.find(params[:resturant_id])
        end
        
        def find_review
            @review = Review.find(params[:id])
        end
        

end

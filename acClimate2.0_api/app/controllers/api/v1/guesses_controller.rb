class Api::V1::GuessesController < ApplicationController

          before_action :set_guesses, only: [:show, :update]
      
          # GET /guesses
          def index
            @guesses = Guess.all
            render json: @guesses
          end
      
          # GET /guesses/1
          def show
            render json: @guess
          end
      
          # POST /guesses
          def create
            # binding.pry
            @guess = Guess.new(guess_params)
            @guess.date = Date.today
            # binding.pry
            if @guess.save
              render json: @guess, status: :created
            else
              render json: @guess.errors, status: :unprocessable_entity
            end
          end
      
          # PATCH/PUT /guesses/1
          def update
            if @guess.update(guess_params)
              render json: @guess
            else
              render json: @guess.errors, status: :unprocessable_entity
            end
          end
      
          private

            def set_guess
              @guess = Guess.find(params[:id])
            end

            def guess_params
              params.require(:guess).permit(:guess, :date, :temperature)
            end

end

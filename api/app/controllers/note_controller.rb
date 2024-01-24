class NoteController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize_user

    def index
        @notes = current_user.notes

        render json: @notes
    end
    
    def create
        @note = current_user.notes.build(note_params)

        if @note.save
            render json: @note, status: :created
        else
            render json: { 
                errors: @note.errors.full_messages 
            }, status: :unprocessable_entity
        end
    end

    def show
        @note = current_user.notes.find(params[:id])

        render json: @note
    end

    def update
        @note = current_user.notes.find(params[:id])
    
        if @note.update(note_params)
            render json: @note
        else
            render json: { errors: @note.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @note = current_user.notes.find(params[:id])

        @note.destroy

        render json: {}, status: :no_content
    end

    private

    def note_params
        params.require(:note).permit(
            :title, 
            :body
        )
    end
end

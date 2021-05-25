class UserNotesController < ApplicationController
    def index
        user_notes = UserNote.all
        render json: user_notes
    end

    def show
        user_note = UserNote.find_by(id: params[:id])
        render json: user_note, except: [:created_at, :updated_at]
    end

    def create
        user_note = UserNote.create(user_note_params)
        render json: user_note
    end

    def update
        user_note = UserNote.find_by(id: params[:id])
        user_note.update(user_note_params)
        render json: user_note
    end

    def destroy
        user_note = UserNote.find_by(id: params[:id]) 
        user_note.destroy
    end

    private
    
    def user_note_params
        params.require(:user_note).permit(:id, :note, :user_id, :entry_item_id)
    end
end

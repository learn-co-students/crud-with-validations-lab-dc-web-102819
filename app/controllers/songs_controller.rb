class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all 
        # render :index
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_strong_params)
        if @song.valid?
            redirect_to song_path(@song)
        else 
            render :new 
        end
    end

    def edit
        find_song
    end

    def update
        find_song
        if @song.update(song_strong_params)
        redirect_to song_path(@song)
        else 
            render :edit 
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path 
    end

    def find_song
        @song = Song.find(params[:id])
    end

    private

    def song_strong_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end

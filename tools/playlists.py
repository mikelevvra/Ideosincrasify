import spotipy

spotify = spotipy.Spotify(client_credentials_manager=spotipy.oauth2.SpotifyClientCredentials(client_id = 'ac2db8cc25544c078bfd3dfcbba69466', client_secret = 'cf897d6e5628485db1077ba87f594547'))
def get_artists_from_playlist(playlist_uri):
    '''
    :param playlist_uri: Playlist to analyse
    :return: A dictionary(artist uri : artist name) of all primary artists in a playlist.
    '''
    artists = {}
    playlist_tracks = spotify.playlist_tracks(playlist_id=playlist_uri)
    for song in playlist_tracks['items']:
        if song['track']:
            print(song['track']['artists'][0]['name'])
            artists[song['track']['artists'][0]['uri']] = song['track']['artists'][0]['name']
    return artists
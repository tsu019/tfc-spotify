terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.5"
      source  = "conradludgate/spotify"
    }
  }
}

variable "spotify_api_key" {
  type = string
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "spotify playlist as code question mark"
  description = "just messin around with terraform [source code in github]"
  public      = true

  tracks = [
    data.spotify_search_track.the_japanese_house.tracks[0].id,
    data.spotify_search_track.the_1975.tracks[0].id,
    data.spotify_search_track.kausai45.tracks[0].id,
    data.spotify_search_track.marc_e_bassy.tracks[0].id,
    data.spotify_search_track.brockhampton.tracks[0].id,
    data.spotify_search_track.niki.tracks[0].id,
    data.spotify_search_track.cody_lovaas.tracks[0].id,
    data.spotify_track.falling_for_you.id,
    data.spotify_search_track.rex_orange_county.tracks[0].id,
  ]
}

data "spotify_search_track" "the_japanese_house" {
  artist = "The Japanese House"
  name = "Dionne (feat. Justin Vernon)"
}

data "spotify_search_track" "the_1975" {
  artist = "The 1975"
  name = "The Birthday Party"
}

data "spotify_search_track" "kausai45" {
  artist = "Kauai45"
  name = "Just The Two of Us"
}

data "spotify_search_track" "marc_e_bassy" {
  artist = "Marc E. Bassy"
  name = "Morning"
}

data "spotify_search_track" "brockhampton" {
  artist = "BROCKHAMPTON"
  name = "SUGAR"
}

data "spotify_search_track" "niki" {
  artist = "Niki"
  name = "I Like U"
}

data "spotify_search_track" "cody_lovaas" {
  artist = "Cody Lovaas"
  name = "Just So You Know"
}

data "spotify_track" "falling_for_you" {
  url = "https://open.spotify.com/track/24MWSatP5sTylISvJONhnB?si=d6133ac83d244ea4"
}

data "spotify_search_track" "rex_orange_county" {
  artist = "Rex Orange County"
  name = "Loving Is Easy"
}
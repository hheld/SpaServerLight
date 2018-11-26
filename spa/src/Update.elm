module Update exposing (update)

import Messages exposing (Msg(..))
import Model exposing (..)
import Navigation
import Routing exposing (Route(..), route)
import UrlParser as Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                newRoute =
                    Url.parseHash route location
            in
            ( { model
                | route = newRoute
              }
            , Cmd.none
            )

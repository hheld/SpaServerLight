module Update exposing (update)

import Browser
import Browser.Navigation as Nav
import Messages exposing (Msg(..))
import Model exposing (..)
import Routing exposing (Route(..), fromUrl)
import Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                newRoute =
                    fromUrl location
            in
            ( { model
                | route = newRoute
              }
            , Cmd.none
            )

        UrlRequest urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Cmd.none )

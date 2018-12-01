module Main exposing (Flags, init, main, subscriptions)

import Browser
import Browser.Navigation as Nav
import Messages exposing (Msg(..))
import Model exposing (Model, initialModel)
import Routing
import Update exposing (update)
import Url
import Url.Parser
import View exposing (view)


type alias Flags =
    { pageHeader : String
    }


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags location key =
    let
        currentRoute =
            Routing.fromUrl location

        currentModel =
            initialModel key currentRoute flags.pageHeader
    in
    ( currentModel
    , Cmd.none
    )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Main


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChange
        , onUrlRequest = UrlRequest
        }

module Main exposing (Flags, init, main, subscriptions)

import Messages exposing (Msg(..))
import Model exposing (Model, initialModel)
import Navigation
import Routing
import Update exposing (update)
import UrlParser as Url
import View exposing (view)


type alias Flags =
    { pageHeader : String
    }


init : Flags -> Navigation.Location -> ( Model, Cmd Msg )
init flags location =
    let
        currentRoute =
            Url.parseHash Routing.route location

        currentModel =
            initialModel currentRoute flags.pageHeader
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
    Navigation.programWithFlags UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

module Main exposing (Flags, init, main, subscriptions)

import Browser
import Browser.Navigation as Nav
import Model as M
import Routing
import Update as U
import Url
import View as V


type alias Flags =
    { pageHeader : String
    }


init : Flags -> Url.Url -> Nav.Key -> ( M.Model, Cmd M.Msg )
init flags location key =
    let
        currentRoute =
            Routing.fromUrl location

        currentModel =
            M.initialModel key currentRoute flags.pageHeader
    in
    ( currentModel
    , Cmd.none
    )



-- Subscriptions


subscriptions : M.Model -> Sub M.Msg
subscriptions model =
    Sub.none



-- Main


main : Program Flags M.Model M.Msg
main =
    Browser.application
        { init = init
        , view = V.view
        , update = U.update
        , subscriptions = subscriptions
        , onUrlChange = M.UrlChange
        , onUrlRequest = M.UrlRequest
        }

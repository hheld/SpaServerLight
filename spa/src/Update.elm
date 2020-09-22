module Update exposing (update)

import Browser
import Browser.Navigation as Nav
import Model as M
import Routing as R
import Url


update : M.Msg -> M.Model -> ( M.Model, Cmd M.Msg )
update msg model =
    case msg of
        M.UrlChange location ->
            let
                newRoute =
                    R.fromUrl location
            in
            ( { model
                | route = newRoute
              }
            , Cmd.none
            )

        M.UrlRequest urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Cmd.none )

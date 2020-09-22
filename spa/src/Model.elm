module Model exposing (Model, Msg(..), initialModel)

import Browser
import Browser.Navigation as Nav
import Routing as R
import Url


type alias Model =
    { key : Nav.Key
    , route : Maybe R.Route
    , pageHeader : String
    }


initialModel : Nav.Key -> Maybe R.Route -> String -> Model
initialModel key route pageHeader =
    { key = key
    , route = route
    , pageHeader = pageHeader
    }


type Msg
    = UrlChange Url.Url
    | UrlRequest Browser.UrlRequest

module Model exposing (Model, initialModel)

import Browser.Navigation as Nav
import Routing exposing (Route)


type alias Model =
    { key : Nav.Key
    , route : Maybe Route
    , pageHeader : String
    }


initialModel : Nav.Key -> Maybe Route -> String -> Model
initialModel key route pageHeader =
    { key = key
    , route = route
    , pageHeader = pageHeader
    }

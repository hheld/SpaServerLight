module Model exposing (..)

import Routing exposing (Route)


type alias Model =
    { route : Maybe Route
    , pageHeader : String
    }


initialModel : Maybe Route -> String -> Model
initialModel route pageHeader =
    { route = route
    , pageHeader = pageHeader
    }

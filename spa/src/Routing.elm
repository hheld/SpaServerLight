module Routing exposing (Route(..), route)

import Navigation
import UrlParser as Url exposing ((</>), s, top)


type Route
    = HomeRoute
    | OtherRoute


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map HomeRoute top
        , Url.map OtherRoute (s "otherRoute")
        ]

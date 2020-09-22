module Routing exposing (Route(..), fromUrl)

import Url
import Url.Parser exposing ((</>), Parser, map, oneOf, s, top)


type Route
    = HomeRoute
    | OtherRoute


route : Parser (Route -> a) a
route =
    oneOf
        [ map HomeRoute top
        , map OtherRoute (s "otherRoute")
        ]


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    Url.Parser.parse route <| { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }

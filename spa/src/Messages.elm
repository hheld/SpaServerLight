module Messages exposing (Msg(..))

import Navigation


type Msg
    = UrlChange Navigation.Location

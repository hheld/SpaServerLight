module Messages exposing (Msg(..))

import Browser
import Url


type Msg
    = UrlChange Url.Url
    | UrlRequest Browser.UrlRequest

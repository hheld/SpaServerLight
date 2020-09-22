module View exposing (TabInfo, isTabActive, navigation, outerLayout, page, tabInfos, view)

import Browser
import Html exposing (Html, a, div, h1, li, text, ul)
import Html.Attributes exposing (class, href)
import Model as M
import Routing as R


view : M.Model -> Browser.Document M.Msg
view model =
    { title = model.pageHeader
    , body = [ div [] [ page model ] ]
    }


page : M.Model -> Html M.Msg
page model =
    let
        content =
            case model.route of
                Just R.HomeRoute ->
                    text "Home"

                Just R.OtherRoute ->
                    text "Other route content goes here"

                Nothing ->
                    text "Page not found!"
    in
    outerLayout model content


outerLayout : M.Model -> Html M.Msg -> Html M.Msg
outerLayout model content =
    div [ class "container-fluid" ]
        [ div
            [ class "pb-2 mt-4 mb-2 border-bottom" ]
            [ h1 []
                [ text model.pageHeader ]
            ]
        , div [ class "row" ]
            [ div [ class "col-sm-2" ]
                [ navigation model
                ]
            , div [ class "col" ]
                [ content ]
            ]
        ]


type alias TabInfo =
    { route : String
    , tabTitle : String
    }


tabInfos : List TabInfo
tabInfos =
    [ { route = "#", tabTitle = "Home" }
    , { route = "#otherRoute", tabTitle = "Other route" }
    ]


isTabActive : M.Model -> TabInfo -> Bool
isTabActive model { route, tabTitle } =
    case model.route of
        Just R.HomeRoute ->
            if route == "#" || route == "" then
                True

            else
                False

        Just R.OtherRoute ->
            if route == "#otherRoute" then
                True

            else
                False

        Nothing ->
            False


navigation : M.Model -> Html M.Msg
navigation model =
    let
        tabClass : TabInfo -> String
        tabClass ti =
            if isTabActive model ti then
                "nav-item active"

            else
                "nav-item"

        linkClass : TabInfo -> String
        linkClass ti =
            if isTabActive model ti then
                "nav-link active"

            else
                "nav-link"

        tabs : List (Html M.Msg)
        tabs =
            List.map
                (\ti ->
                    li [ class (tabClass ti) ]
                        [ a [ href ti.route, class (linkClass ti) ]
                            [ text ti.tabTitle ]
                        ]
                )
                tabInfos
    in
    ul [ class "nav nav-pills flex-column" ] tabs

module View exposing (TabInfo, isTabActive, navigation, outerLayout, page, tabInfos, view)

import Browser
import Html exposing (Html, a, div, h1, li, text, ul)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg)
import Model exposing (Model)
import Routing exposing (Route(..))


view : Model -> Browser.Document Msg
view model =
    { title = model.pageHeader
    , body = [ div [] [ page model ] ]
    }


page : Model -> Html Msg
page model =
    let
        content =
            case model.route of
                Just HomeRoute ->
                    text "Home"

                Just OtherRoute ->
                    text "Other route content goes here"

                Nothing ->
                    text "Page not found!"
    in
    outerLayout model content


outerLayout : Model -> Html Msg -> Html Msg
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


isTabActive : Model -> TabInfo -> Bool
isTabActive model { route, tabTitle } =
    case model.route of
        Just HomeRoute ->
            if route == "#" || route == "" then
                True

            else
                False

        Just OtherRoute ->
            if route == "#otherRoute" then
                True

            else
                False

        Nothing ->
            False


navigation : Model -> Html Msg
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

        tabs : List (Html Msg)
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

module View exposing (..)

import Html exposing (Html, text, div, ul, a, h1, li)
import Html.Attributes exposing (class, href)
import Model exposing (Model)
import Messages exposing (Msg)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div [] [ page model ]


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
            [ class "page-header" ]
            [ h1 []
                [ text model.pageHeader ]
            ]
        , div [ class "row" ]
            [ div [ class "col-xs-2" ]
                [ navigation model
                ]
            , div [ class "col-xs-10" ]
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
                "active"
            else
                ""

        tabs : List (Html Msg)
        tabs =
            List.map
                (\ti ->
                    li [ class (tabClass ti) ]
                        [ a [ href ti.route ]
                            [ text ti.tabTitle ]
                        ]
                )
                tabInfos
    in
        ul [ class "nav nav-pills nav-stacked" ] tabs

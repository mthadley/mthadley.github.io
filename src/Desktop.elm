module Desktop exposing (view)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


view : Html msg
view =
    div
        [ css
            [ position absolute
            , top zero
            , bottom zero
            , left zero
            , right zero
            , backgroundColor (hex "#FFF")
            ]
        ]
        [ text "Desktop" ]

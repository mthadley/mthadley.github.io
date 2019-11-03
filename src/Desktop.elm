module Desktop exposing (view)

import Colors
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Ui.Button as Button


view : Html msg
view =
    div
        [ css
            [ position absolute
            , top zero
            , bottom zero
            , left zero
            , right zero
            , backgroundColor Colors.wallpaper
            ]
        ]
        [ viewTaskbar
        ]


viewTaskbar : Html msg
viewTaskbar =
    nav
        [ css
            [ backgroundColor Colors.background
            , bottom zero
            , minHeight (px 35)
            , left zero
            , position absolute
            , right zero
            , padding (px 3)
            , displayFlex
            , borderTop3 (px 2) solid (hex "#E6E6E6")
            ]
        ]
        [ Button.view [] [ text "Start" ]
        ]

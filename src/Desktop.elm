module Desktop exposing (view)

import Colors
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
            , height (px 35)
            , left zero
            , position absolute
            , right zero

            -- Top highlight
            , after
                [ boxShadow5 inset zero (px 2) (px 1) (hex "#F3F3F3")
                , display block
                , property "content" "\"\""
                , position absolute
                , top zero
                , left zero
                , right zero
                , height (px 4)
                , pointerEvents none
                ]
            ]
        ]
        []

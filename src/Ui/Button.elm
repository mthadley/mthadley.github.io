module Ui.Button exposing (view)

import Colors
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


view : List (Attribute msg) -> List (Html msg) -> Html msg
view attrs =
    button
        (attrs
            ++ [ css
                    [ backgroundColor Colors.background
                    , color Colors.lightForeground
                    , fontWeight (int 700)
                    , borderWidth zero
                    , borderStyles (hex "#D5D5D5") (hex "#797979")
                    , active
                        [ backgroundColor Colors.backgroundDarker
                        , borderStyles (hex "#C2C2C2") (hex "#454545")
                        ]
                    ]
               ]
        )


borderStyles : Color -> Color -> Style
borderStyles topLeftColor bottomRightColor =
    Css.batch
        [ borderTop3 (px 2) solid topLeftColor
        , borderLeft3 (px 2) solid topLeftColor
        , borderBottom3 (px 2) solid bottomRightColor
        , borderRight3 (px 2) solid bottomRightColor
        ]

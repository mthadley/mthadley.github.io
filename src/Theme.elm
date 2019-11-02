module Theme exposing (theme)

import Css exposing (..)


theme : { primary : Color, secondary : Color, accent : Color }
theme =
    { primary = hex "111"
    , secondary = hex "EEE"
    , accent = hex "ABC"
    }

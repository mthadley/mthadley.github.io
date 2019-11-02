module Main exposing (main)

import App exposing (Model, Msg, init, subscriptions, update, view)
import Browser
import Html
import Html.Styled exposing (toUnstyled)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = toUnstyled << view
        , update = update
        , subscriptions = subscriptions
        }

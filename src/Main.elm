module Main exposing (main)

import BootScreen
import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


main : Program () Model Msg
main =
    Browser.element
        { init = \() -> ( init, Cmd.none )
        , view = toUnstyled << view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { booting : Maybe BootScreen.Model
    }


init : Model
init =
    { booting = Just BootScreen.init
    }


view : Model -> Html Msg
view model =
    main_ []
        [ case model.booting of
            Just bootingModel ->
                BootScreen.view bootingModel

            Nothing ->
                text "Running"
        ]


type Msg
    = NewBootScreen (Maybe BootScreen.Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewBootScreen bootingModel ->
            ( { model | booting = bootingModel }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.booting of
        Just bootingModel ->
            Sub.map NewBootScreen (BootScreen.subs bootingModel)

        Nothing ->
            Sub.none

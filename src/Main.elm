module Main exposing (main)

import BootScreen
import Browser
import Css exposing (..)
import Desktop
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


type Model
    = Booting BootScreen.Model
    | Running


init : Model
init =
    Booting BootScreen.init


view : Model -> Html Msg
view model =
    main_ []
        [ case model of
            Booting bootingModel ->
                BootScreen.view bootingModel

            Running ->
                Desktop.view
        ]


type Msg
    = NewBootScreen (Maybe BootScreen.Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( NewBootScreen maybeBootingModel, Booting _ ) ->
            ( case maybeBootingModel of
                Just newBootingModel ->
                    Booting newBootingModel

                Nothing ->
                    Running
            , Cmd.none
            )

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Booting bootingModel ->
            Sub.map NewBootScreen (BootScreen.subs bootingModel)

        Running ->
            Sub.none

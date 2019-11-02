module App exposing (Model, Msg, init, subscriptions, update, view)

import BootScreen
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)



-- MODEL


type alias Model =
    { booting : Maybe BootScreen.Model
    }


init : Model
init =
    { booting = Just BootScreen.init
    }



-- VIEW


view : Model -> Html Msg
view model =
    main_ []
        [ case model.booting of
            Just bootingModel ->
                BootScreen.view bootingModel

            Nothing ->
                text "Running"
        ]



-- UPDATE


type Msg
    = NewBootScreen (Maybe BootScreen.Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewBootScreen bootingModel ->
            ( { model | booting = bootingModel }, Cmd.none )



-- SUBS


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.booting of
        Just bootingModel ->
            Sub.map NewBootScreen (BootScreen.subs bootingModel)

        Nothing ->
            Sub.none

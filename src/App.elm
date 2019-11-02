module App exposing (Model, Msg, init, subscriptions, update, view)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)



-- MODEL


type alias Model =
    { greeting : String
    }


init : () -> ( Model, Cmd Msg )
init () =
    ( Model "Hello World", Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    main_ [] []



-- UPDATE


type Msg
    = Noop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )



-- SUBS


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none

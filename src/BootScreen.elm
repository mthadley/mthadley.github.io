module BootScreen exposing (Model, init, subs, view)

import Browser.Events
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


type Model
    = Model Float Int


type Step
    = Print String
    | UpdateInterval Float
    | Numbered Int String
    | Blank


messages : List Step
messages =
    [ Print "Booting cpu..."
    , Print "Starting filesystem..."
    , Print "Warming registers..."
    , UpdateInterval 50
    , Print "Spinning up mutexes..."
    , Print "Loaded progresses..."
    , UpdateInterval 300
    , Blank
    , Print "Busting caches:"
    , UpdateInterval 20
    , Blank
    , Numbered 10 "Zapped cache: "
    , UpdateInterval 300
    , Blank
    , Print "Starting graphical user interface..."
    ]


defaultInterval : Float
defaultInterval =
    200


totalSteps : Int
totalSteps =
    messages
        |> List.map stepSize
        |> List.sum


stepSize : Step -> Int
stepSize step =
    case step of
        Print _ ->
            1

        UpdateInterval _ ->
            0

        Numbered count _ ->
            count

        Blank ->
            0


init : Model
init =
    Model 0 0


view : Model -> Html msg
view (Model _ progress) =
    let
        -- Basically a scan over the steps rendered so far, so that
        -- `Numbered` can correctly render.
        viewHelp step ( count, html ) =
            ( count + stepSize step
            , if count > progress then
                html

              else
                html ++ [ viewStep count progress step ]
            )
    in
    List.foldl viewHelp ( 0, [] ) messages
        |> Tuple.second
        |> List.filterMap identity
        |> div [ css [ fontFamily monospace ] ]


viewStep : Int -> Int -> Step -> Maybe (Html msg)
viewStep progressSoFar progress step =
    case step of
        Print message ->
            Just (viewLine message)

        UpdateInterval _ ->
            Nothing

        Blank ->
            Just (br [] [])

        Numbered count message ->
            List.range 1 (min (progress - progressSoFar) count)
                |> Debug.log "List"
                |> List.map (\i -> viewLine (message ++ String.fromInt i))
                |> div []
                |> Just


viewLine : String -> Html msg
viewLine message =
    Html.Styled.pre
        [ css
            [ color (hex "FFF")
            , margin zero
            ]
        ]
        [ text message ]


currentInterval : Int -> Float
currentInterval progress =
    let
        currentIntervalHelp step ( count, interval ) =
            let
                newCount =
                    count + stepSize step
            in
            case step of
                UpdateInterval newInterval ->
                    ( newCount
                    , if count <= progress then
                        Just newInterval

                      else
                        interval
                    )

                _ ->
                    ( newCount, interval )
    in
    messages
        |> List.foldl currentIntervalHelp ( 0, Nothing )
        |> Tuple.second
        |> Maybe.withDefault defaultInterval


subs : Model -> Sub (Maybe Model)
subs (Model previousTimeSinceStep progress) =
    Browser.Events.onAnimationFrameDelta <|
        \time ->
            let
                newTimeSinceStep =
                    previousTimeSinceStep + time
            in
            if newTimeSinceStep > currentInterval progress then
                let
                    newProgress =
                        progress + 1
                in
                if progress > totalSteps then
                    Nothing

                else
                    Just (Model (newTimeSinceStep - previousTimeSinceStep) newProgress)

            else
                Just (Model newTimeSinceStep progress)

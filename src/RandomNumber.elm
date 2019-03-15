module RandomNumber exposing (main)

import Html exposing (..)
import Html.Events exposing (onClick)
import Random
import Browser


type alias Model =
    Int

-- empty flags, needed for Browser.element
type alias Flags =
    ()

init : Flags -> ( Model, Cmd Msg )
init flags =
    ( 0, Cmd.none )

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick GenerateRandomNumber ] [ text "Generate Random Number" ]
        , text (Debug.toString model)
        ]

type Msg
    = GenerateRandomNumber | NewRandomNumber Int

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GenerateRandomNumber ->
            ( model, Random.generate NewRandomNumber (Random.int 0 100) )

        NewRandomNumber number ->
            ( number, Cmd.none)


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }

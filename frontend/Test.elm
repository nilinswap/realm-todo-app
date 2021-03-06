module Test exposing (main)

import Actions
import Json.Encode as JE
import Pages.IndexTest as Index
import Realm.Test as RT
import Routes


main =
    RT.app { tests = tests, title = "Realm ToDo App" }


tests : List RT.Test
tests =
    let
        context =
            [ ( "name", JE.string "Realm Tutorial" ) ]

        f : String -> List RT.Step -> RT.Test
        f id steps =
            { id = id, context = context, steps = steps }

        t =
            [ f "index" index
            , f "resetDB" resetDB
            , f "manual" manual
            ]
    in
    t



--index : List RT.Step
--index =
--    [ RT.Navigate ToDo.threeNotDone Routes.clearTodos
--    , RT.Navigate ToDo.threeNotDone Routes.index
--    , RT.SubmitForm ToDo.firstDone (Actions.toggleToDo 0)
--    , RT.Navigate ToDo.firstDone Routes.index
--    , RT.SubmitForm ToDo.threeNotDone (Actions.toggleToDo 0)
--    , RT.Navigate ToDo.threeNotDone Routes.index
--    ]


index : List RT.Step
index =
    [ RT.Navigate Index.emptyList Routes.emptyToDo
    , RT.SubmitForm Index.singleToDo (Actions.addToDo "Hello" False)
    , RT.SubmitForm Index.twoToDos (Actions.addToDo "World" False)
    , RT.SubmitForm Index.toggleToDo (Actions.toggleToDo 2)
    , RT.SubmitForm Index.deleteToDo (Actions.deleteToDo 2)
    ]


resetDB : List RT.Step
resetDB =
    [ RT.Navigate Index.emptyList Routes.emptyToDo ]


manual : List RT.Step
manual =
    [ RT.Navigate Index.emptyList Routes.emptyToDo
    , RT.SubmitForm Index.singleToDo (Actions.addToDo "Hello" False)
    , RT.SubmitForm Index.twoToDos (Actions.addToDo "World" False)
    ]

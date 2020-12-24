module Storybook exposing (main)

import Json.Encode as JE
import Pages.Index as Index
import Realm.Storybook as RSB exposing (Story)


main =
    RSB.app { stories = stories, title = "Realm-Starter" }


stories : List ( String, List Story )
stories =
    [ ( "Index"
      , [ index "todo-1"
            "2 ToDos"
            { list =
                [ Index.todo 0 "hello world" False
                , Index.todo 0 "hello world, its really nice to meet you!" True
                ]
            }
        , index "todo-2" "0 ToDo" { list = [] }
        ]
      )
    ]


index : String -> String -> Index.Config -> Story
index id title c =
    { id = id
    , title = title
    , pageTitle = title
    , elmId = "Pages.Index"
    , config = Index.configE c
    }

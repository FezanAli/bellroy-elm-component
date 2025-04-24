module TravelProductsComponent exposing (..)

import Browser
import Html exposing (Html, div, h2, img, p, text)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL

type alias Product =
    { title : String
    , price : String
    , imageUrl : String
    , description : String
    , colors : List String
    }

products : List Product
products =
    [ { title = "Venture Sling 6L"
      , price = "$129"
      , imageUrl = "https://via.placeholder.com/300x200"
      , description = "6L / An organized sling that’s ready for adventure"
      , colors = ["black", "sienna"]
      }
    , { title = "Tech Kit"
      , price = "$59"
      , imageUrl = "https://via.placeholder.com/300x200"
      , description = "Charger, mouse, powerbank, dongles, cables, earbuds"
      , colors = ["black", "gray", "khaki"]
      }
    , { title = "Pack Well Travel Set"
      , price = "$79 (Valued at $98)"
      , imageUrl = "https://via.placeholder.com/300x200"
      , description = "Tech Kit + Lite Pouch Duo"
      , colors = []
      }
    ]


-- VIEW

viewColor : String -> Html msg
viewColor color =
    div
        [ style "background-color" color
        , style "width" "20px"
        , style "height" "20px"
        , style "border-radius" "50%"
        , style "border" "2px solid #ccc"
        ]
        []

viewProduct : Product -> Html msg
viewProduct product =
    div [ class "product-card" ]
        [ img [ src product.imageUrl, class "product-img", alt product.title ] []
        , div [ class "title" ] [ text product.title ]
        , div [ class "price" ] [ text product.price ]
        , div [ class "color-options" ] (List.map viewColor product.colors)
        , p [ class "desc" ] [ text product.description ]
        ]

view : Html msg
view =
    div []
        [ h2 [ style "text-align" "center", style "font-size" "2rem", style "margin-top" "2rem" ]
            [ text "Traveling soon? These travel products will help." ]
        , div [ class "carousel" ] (List.map viewProduct products)
        ]


-- MAIN

main : Program () () msg
main =
    Browser.sandbox { init = (), update = \_ model -> model, view = \_ -> view }

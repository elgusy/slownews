{-# LANGUAGE OverloadedStrings #-}

module Frontend.CSS (appCssStr) where

import Prelude hiding (rem)

import Data.Semigroup ((<>))
import Data.String.Conv (toS)
import Data.Text (Text)

import Clay

appCssStr :: Text
appCssStr = toS $ render appCss

themeColor :: Color
themeColor = lightgreen

themeLighterColor :: Color
themeLighterColor = "#e9fce9"

mainFont :: (Text, Text)
mainFont = ("Comfortaa:700", "Comfortaa")

headerFont :: (Text, Text)
headerFont = ("Faster+One", "Faster One")

appCss :: Css
appCss = do
  importUrl $ "https://fonts.googleapis.com/css?family=" <> fst mainFont
  importUrl $ "https://fonts.googleapis.com/css?family=" <> fst headerFont

  ".content" ? do
    important $ fontFamily [snd mainFont] [sansSerif]

  h1 ? do
    textAlign center
    important $ fontFamily [snd headerFont] [cursive]
    fontSize $ em 1.5
    important $ color themeColor
    sym padding $ em 0.3

  ".row" ? do
    important $ paddingTop $ rem 0.3
    important $ paddingBottom $ rem 0.3
    important $ sym margin $ px 0

  ".meta" ? do
    textAlign $ alignSide sideRight
    important $ paddingRight $ em 0.5

  a ? do
    textDecoration none

  "a:visited" ? do
    textDecoration lineThrough
    color gray

  ".row:hover" ? do
    backgroundColor themeLighterColor -- "#efefef"

  ".meta a" ? do
    fontSize $ pct 85
    textDecoration none
    color themeColor
    backgroundColor "#444"
    sym2 padding (em 0.2) (em 0.4)
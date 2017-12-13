module Routes.Resources(
  Resource,
  ResourcePath,
  root,
  topic
)where

import Data.Text

//

type Resource = Text
type ResourcePath = [Text]


root :: Resource
{-# INLINE root #-}
root = pack ""

topic :: Resource
{-# INLINE topic #-}
topic = pack "topic"

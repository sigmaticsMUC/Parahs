{-# LANGUAGE OverloadedStrings #-}

import Network.Wai (responseLBS, Application)
import Network.Wai.Handler.Warp as Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)
import qualified Data.ByteString.Lazy.Char8 as BS

main = do
    let port = 3000
    putStrLn $ "Listening on port " ++ show port
    Warp.run port app

app :: Application
app req f =
    f $ responseLBS status200 [(hContentType, "text/plain")] (toByteString 8)


toByteString :: (Num a, Show a) => a -> BS.ByteString
toByteString = BS.pack . show

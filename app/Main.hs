{-# LANGUAGE OverloadedStrings #-}

import Network.Wai as Wai
import Network.Wai.Handler.Warp as Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)
import qualified Data.ByteString.Lazy.Char8 as BS
import qualified Data.Text as T
import Routes.Resources (Resource,root,topic)
import Handler.RequestHandler
import Handler.RequestHandlerFactory
import Control.Monad

main = do
    let port = 3000
    putStrLn $ "\nListening on port " ++ show port
    putStr $ "Init RQH... "
    let rqh = initRQH
    putStr $ "Done! " ++ (show rqh) ++ "\n"
    putStr $ "Parahs is ready!\n\n"
    Warp.run port (app rqh)


app :: [RequestHandler String] -> Wai.Application
app = handleRequest

handleRequest :: [RequestHandler String] -> Wai.Application
handleRequest rqh rq rs = do
  let handler = filter (\h -> (_resource h) == resourceHead) rqh
  forM handler $ \h -> do
    resp <- (_get h) path :: IO String
    rs $ Wai.responseLBS status200 [(hContentType, "text/plain")] (toByteString resp)
  rs $ Wai.responseLBS status200 [(hContentType, "text/plain")] (toByteString "Nothing here boi")
      where path = getPath rq
            resourceHead = getHead path


getPath :: Wai.Request -> [T.Text]
getPath = Wai.pathInfo

getHead :: [T.Text] -> T.Text
getHead [] = ""
getHead list = Prelude.head list

toByteString :: (Show a) => a -> BS.ByteString
{-# INLINE toByteString #-}
{-# SPECIALISE toByteString :: String -> BS.ByteString #-}
toByteString i = BS.pack $ (show i) ++ "\n"

module Handler.RequestHandler(
  RequestHandler (RequestHandler),
  _type,
  _resource,
  _get,
  _post,
  _put,
  _delete,
  _head,
  _connect,
  _patch,
  _trace,
)where

import Routes.Resources (Resource, ResourcePath)


data RequestHandler a = RequestHandler {

  _type :: String,
  _resource :: Resource,
  _get :: ResourcePath -> IO a,
  _post :: ResourcePath -> IO a,
  _put :: ResourcePath -> IO a,
  _delete :: ResourcePath -> IO a,
  _head :: ResourcePath -> IO a,
  _connect :: ResourcePath -> IO a,
  _patch :: ResourcePath -> IO a,
  _trace :: ResourcePath -> IO a
}


instance Show (RequestHandler a) where
  show rq = show (_resource rq)


getResource :: RequestHandler a -> Resource
getResource = _resource

module Handler.RequestHandlerFactory(
  initRQH,
)where


import Handler.RequestHandler as RH
import Routes.Types as RT
import Routes.Resources as RR

initRQH :: [RequestHandler String]
initRQH = rootH : topicsH : topicsH : []
  where rootH = initRootH
        topicsH = initTopicsH


initRootH :: RequestHandler String
initRootH = RH.RequestHandler {
  RH._type = RT.string,
  RH._resource = RR.root,
  RH._get = \p -> return "Parahs running!",
  RH._post = \p -> return "Not defined here!",
  RH._put = \p -> return "Not defined here!",
  RH._delete = \p -> return "Not defined here!",
  RH._head = \p -> return "Not defined here!",
  RH._connect = \p -> return "Not defined here!",
  RH._patch = \p -> return "Not defined here!",
  RH._trace = \p -> return "Not defined here!"
}



initTopicsH :: RequestHandler String
initTopicsH = RH.RequestHandler {
  RH._type = RT.string,
  RH._resource = RR.topic,
  RH._get = \p -> return "Topics boi!",
  RH._post = \p -> return "Not defined here!",
  RH._put = \p -> return "Not defined here!",
  RH._delete = \p -> return "Not defined here!",
  RH._head = \p -> return "Not defined here!",
  RH._connect = \p -> return "Not defined here!",
  RH._patch = \p -> return "Not defined here!",
  RH._trace = \p -> return "Not defined here!"
}

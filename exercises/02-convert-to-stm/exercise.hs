#!/usr/bin/env stack
-- stack --resolver lts-13.21 script
import Control.Concurrent.STM

main :: IO ()
main = do
  -- You'll need to change some function names, and add in some calls to
  -- atomically
  myA <- atomically $ do
      var <- newTVar "Hello"

      origVal <- readTVar var
      writeTVar var (origVal ++ " World")

      newVal <- readTVar var
      return newVal
   
  putStrLn myA

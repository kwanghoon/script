#!/home/khchoi/.local/bin/stack
-- stack runghc --install-ghc --package fsnotify
{-# LANGUAGE OverloadedStrings #-} -- for FilePath literals

import System.FSNotify
import Control.Concurrent (threadDelay)
import Control.Monad (forever)

main =
  withManager $ \mgr -> do
    -- start a watching job (in the background)
    watchDir
      mgr          -- manager
      "."          -- directory to watch
      (const True) -- predicate
      print        -- action

    -- sleep forever (until interrupted)
    forever $ threadDelay 1000000
    
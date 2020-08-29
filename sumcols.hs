#!/home/khchoi/.local/bin/stack
-- stack runghc --install-ghc

import System.IO
import System.Environment

main = do
  idx <- columnIdx
  col <- interactM ( (read :: String -> Int) . (\s -> s !! idx) . words )
  putStrLn $ show $ sum col

interactM :: (String -> a) -> IO [a]
interactM f = do
  eof <- isEOF
  if eof
  then return []
  else do
    line <- getLine
    results <- interactM f 
    return (f line : results)

columnIdx :: IO Int
columnIdx = do
  args <- getArgs
  case args of
    [] -> return 0
    (s:_) -> return $ read s
import System.Environment (getArgs)
import System.IO (openFile, hGetContents)
import System.IO(IOMode(ReadMode))
import Data.Function(on)

div_i_f :: Int -> Int -> Float
div_i_f = (/) `on` fromIntegral

oxyDiscard _ [x] = x
oxyDiscard p (x:y:ys) = (oxyDiscard (p+1) $ filter ( (== (mostCommon p (x:y:ys))) . (!!p)) (x:y:ys))
  where
    mostCommon p lst
      | fromIntegral (length (filter ((=='1') . (!!p)) lst)) >= ((length lst) `div_i_f` 2) = '1'
      | otherwise = '0'

co2Discard _ [x] = x
co2Discard p (x:y:ys) = (co2Discard (p+1) $ filter ( (== (leastCommon p (x:y:ys))) . (!!p)) (x:y:ys))
  where
    leastCommon p lst
      | fromIntegral (length (filter ((=='1') . (!!p)) lst)) < ((length lst) `div_i_f` 2) = '1'
      | otherwise = '0'

bintodec :: Integral i => i -> i
bintodec 0 = 0
bintodec i = 2 * bintodec (i `div` 10) + (i `mod` 10)

co2 = bintodec . read . co2Discard 0 . words
oxy = bintodec . read . oxyDiscard 0 . words

solve x = (co2 x) * (oxy x)

main = do
        args <- getArgs
        file <- openFile (head args) ReadMode
        text <- hGetContents file
        print $ solve text


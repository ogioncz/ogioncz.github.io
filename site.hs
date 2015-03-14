{-# LANGUAGE OverloadedStrings #-}
import Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
	match "assets/images/*" $ do
		route idRoute
		compile copyFileCompiler

	match "assets/css/*" $ do
		route idRoute
		compile compressCssCompiler

	match "index.html" $ do
		route idRoute
		compile $ do
			getResourceBody
				>>= loadAndApplyTemplate "templates/layout.html" defaultContext
				>>= relativizeUrls

	match "templates/*" $ compile templateCompiler

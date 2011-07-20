-- ResetPrototype
--
-- Copyright (c) 2011, Charles-Axel Dein
-- All rights reserved.
-- 
-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
-- 
-- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
-- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-- tested with OmniGraffle 5.3 and Mac OS 10.6.8

-- Some configurable Settings
property settingsFirstScreenName : "First screen" -- case insensitive 
property settingsFirstScreenPrefix : "1"
property settingsAlwaysVisibleLayerPrefix : "*"
-- End

tell application "OmniGraffle Professional 5"
	set theWindow to front window
	set theDocument to document of theWindow
	
	set canvasCount to count of canvases of theDocument

	repeat with canvasNumber from 1 to canvasCount
		set theCanvas to canvas canvasNumber of theDocument
		set layerCount to count of layers of theCanvas
		set couldBeShownLayersCount to 0
		set firstScreenIsPresent to False
		
		repeat with layerNumber from 1 to layerCount
			set theLayer to layer layerNumber of theCanvas
			set layerName to name of theLayer as string
			
			-- non-printable layers should be hidden
			if theLayer is not prints then

				set visible of theLayer to False

			-- shared layers should always be shown
			else if class of theLayer is shared layer ¬
				or (character 1 of layerName is settingsAlwaysVisibleLayerPrefix) ¬
				then

				set visible of theLayer to True

			-- first screen should be shown
			else if (character 1 of layerName is settingsFirstScreenPrefix) ¬
				or (layerName is settingsFirstScreenName) then

				set visible of theLayer to True
				set firstScreenIsPresent to True

			-- all remaining layers should be hidden
			else

				set couldBeShownLayersCount to couldBeShownLayersCount + 1
				set couldBeShownLayer to theLayer

				set visible of theLayer to False
			end if
		end repeat
		
		-- if there's only one layer that could be shown, then we show it
		if (couldBeShownLayersCount = 1) and (firstScreenIsPresent is False) then
			set visible of couldBeShownLayer to True
		end if
	end repeat
end tell

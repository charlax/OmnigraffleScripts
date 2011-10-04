-- export all layers to image files
-- Copyright (c) 2011, Charles-Axel Dein

-- Settings
property exportFileExtension : "png"
-- End of Settings

tell application "OmniGraffle Professional 5"
	set theWindow to front window
	set theDocument to document of theWindow
	set theFilename to name of theDocument
	
	set export_folder to (choose folder with prompt "Pick the destination folder") as string
	set export_folder to export_folder & theFilename & ":"
	
	-- create folder
	do shell script "mkdir -p " & quoted form of POSIX path of export_folder
	
	set canvasCount to count of canvases of theDocument
	
	set i to 0
	repeat with canvasNumber from 1 to canvasCount
		set theCanvas to canvas canvasNumber of theDocument
		set canvas_name to name of theCanvas
		set canvas of theWindow to theCanvas
		set layerCount to count of layers of theCanvas
		
		-- hide all layers, except those beginning with "*"
		-- also check if there is only one layer to be exported
		repeat with layerNumber from 1 to layerCount
			set theLayer to layer layerNumber of theCanvas
			set number_of_layer_to_be_exported to 0
			
			if theLayer is prints and class of theLayer is not shared layer then
				set layer_name to name of theLayer as string
				if character 1 of layer_name is not "*" then
					set visible of theLayer to false
					set number_of_layer_to_be_exported to number_of_layer_to_be_exported + 1
				else
					set visible of theLayer to true
				end if
			end if
			
		end repeat
		
		repeat with layerNumber from 1 to layerCount
			set theLayer to layer layerNumber of theCanvas
			
			if (theLayer is prints) and (class of theLayer is not shared layer) then
				set layer_name to name of theLayer as string
				set filename to canvas_name & " - " & layer_name & "." & exportFileExtension
				set export_filename to export_folder & filename
				
				-- show the layer, export, then hide the layer
				if character 1 of layer_name is not "*" then
					set visible of theLayer to true
					set area type of current export settings to current canvas
					save theDocument in export_filename
					set visible of theLayer to false
				end if
				
			end if
			
		end repeat
		
	end repeat
end tell

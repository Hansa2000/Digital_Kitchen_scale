PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//339539/908816/2.50/2/5/Resistor

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r145_100"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1) (shapeHeight 1.45))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "RESC2012X60N" (originalName "RESC2012X60N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r145_100) (pt -0.95, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r145_100) (pt 0.95, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.7 1) (pt 1.7 1) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.7 1) (pt 1.7 -1) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.7 -1) (pt -1.7 -1) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.7 -1) (pt -1.7 1) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 0.625) (pt 1 0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 0.625) (pt 1 -0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 -0.625) (pt -1 -0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 -0.625) (pt -1 0.625) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 0.525) (pt 0 -0.525) (width 0.2))
		)
	)
	(symbolDef "CR0805-JW-473ELF" (originalName "CR0805-JW-473ELF")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 700 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 700 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 50 mils) (pt 500 mils 50 mils) (width 6 mils))
		(line (pt 500 mils 50 mils) (pt 500 mils -50 mils) (width 6 mils))
		(line (pt 500 mils -50 mils) (pt 200 mils -50 mils) (width 6 mils))
		(line (pt 200 mils -50 mils) (pt 200 mils 50 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 550 mils 250 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 550 mils 150 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "CR0805-JW-473ELF" (originalName "CR0805-JW-473ELF") (compHeader (numPins 2) (numParts 1) (refDesPrefix R)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "CR0805-JW-473ELF"))
		(attachedPattern (patternNum 1) (patternName "RESC2012X60N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Mouser Part Number" "652-CR0805JW-473ELF")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Bourns/CR0805-JW-473ELF?qs=%252BcBkmVQIZ2S5L%2FTv0l5Nkg%3D%3D")
		(attr "Manufacturer_Name" "Bourns")
		(attr "Manufacturer_Part_Number" "CR0805-JW-473ELF")
		(attr "Description" "Bourns CR0805 Series Thick Film Surface Mount Resistor 0805 Case 47k 0.125W +/-200ppm/C")
		(attr "<Hyperlink>" "https://www.bourns.com/pdfs/chpreztr.pdf")
		(attr "<Component Height>" "0.6")
		(attr "<STEP Filename>" "CR0805-JW-473ELF.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0.25")
		(attr "<STEP Rotation>" "X=90;Y=0;Z=0")
	)

)

SamacSys ECAD Model
235195/908816/2.50/2/5/Resistor

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r270_110"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.1) (shapeHeight 2.7))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "RESC3225X60N" (originalName "RESC3225X60N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r270_110) (pt -1.5, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r270_110) (pt 1.5, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -2.3 1.6) (pt 2.3 1.6) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 2.3 1.6) (pt 2.3 -1.6) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 2.3 -1.6) (pt -2.3 -1.6) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -2.3 -1.6) (pt -2.3 1.6) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.6 1.25) (pt 1.6 1.25) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.6 1.25) (pt 1.6 -1.25) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.6 -1.25) (pt -1.6 -1.25) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.6 -1.25) (pt -1.6 1.25) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 1.15) (pt 0 -1.15) (width 0.2))
		)
	)
	(symbolDef "CRCW1210470RJNEA" (originalName "CRCW1210470RJNEA")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 700 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 700 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Default"))
		))
		(line (pt 200 mils 50 mils) (pt 500 mils 50 mils) (width 6 mils))
		(line (pt 500 mils 50 mils) (pt 500 mils -50 mils) (width 6 mils))
		(line (pt 500 mils -50 mils) (pt 200 mils -50 mils) (width 6 mils))
		(line (pt 200 mils -50 mils) (pt 200 mils 50 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 550 mils 250 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "CRCW1210470RJNEA" (originalName "CRCW1210470RJNEA") (compHeader (numPins 2) (numParts 1) (refDesPrefix R)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "CRCW1210470RJNEA"))
		(attachedPattern (patternNum 1) (patternName "RESC3225X60N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Vishay")
		(attr "Manufacturer_Part_Number" "CRCW1210470RJNEA")
		(attr "Mouser Part Number" "71-CRCW1210J-470-E3")
		(attr "Mouser Price/Stock" "https://www.mouser.com/Search/Refine.aspx?Keyword=71-CRCW1210J-470-E3")
		(attr "Arrow Part Number" "")
		(attr "Arrow Price/Stock" "")
		(attr "Description" "Thick Film Resistors - SMD 1/2watt 470ohms 5%")
		(attr "Datasheet Link" "")
		(attr "Height" "0.6 mm")
	)

)
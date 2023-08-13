PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//467623/908816/2.50/2/3/Capacitor Polarised

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r305_180"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.8) (shapeHeight 3.05))
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
	(patternDef "CAPAE430X550N" (originalName "CAPAE430X550N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r305_180) (pt -1.85, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef r305_180) (pt 1.85, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -3.875 2.75) (pt 3.875 2.75) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 3.875 2.75) (pt 3.875 -2.75) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 3.875 -2.75) (pt -3.875 -2.75) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -3.875 -2.75) (pt -3.875 2.75) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.15 2.15) (pt -1.075 2.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.075 2.15) (pt -2.15 1.075) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.15 1.075) (pt -2.15 -1.075) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.15 -1.075) (pt -1.075 -2.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.075 -2.15) (pt 2.15 -2.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.15 -2.15) (pt 2.15 2.15) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.375 2.15) (pt 2.15 2.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.075 -2.15) (pt 2.15 -2.15) (width 0.2))
		)
	)
	(symbolDef "865080340001" (originalName "865080340001")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 500 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 500 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 200 mils -100 mils) (width 6 mils))
		(line (pt 200 mils -100 mils) (pt 230 mils -100 mils) (width 6 mils))
		(line (pt 230 mils -100 mils) (pt 230 mils 100 mils) (width 6 mils))
		(line (pt 230 mils 100 mils) (pt 200 mils 100 mils) (width 6 mils))
		(line (pt 180 mils 50 mils) (pt 140 mils 50 mils) (width 6 mils))
		(line (pt 160 mils 70 mils) (pt 160 mils 30 mils) (width 6 mils))
		(line (pt 100 mils 0 mils) (pt 200 mils 0 mils) (width 6 mils))
		(line (pt 300 mils 0 mils) (pt 400 mils 0 mils) (width 6 mils))
		(poly (pt 300 mils 100 mils) (pt 300 mils -100 mils) (pt 270 mils -100 mils) (pt 270 mils 100 mils) (pt 300 mils 100 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 350 mils 250 mils) (justify 24) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 350 mils 150 mils) (justify 24) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "865080340001" (originalName "865080340001") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "+") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "-") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "865080340001"))
		(attachedPattern (patternNum 1) (patternName "CAPAE430X550N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Wurth Elektronik")
		(attr "Manufacturer_Part_Number" "865080340001")
		(attr "Mouser Part Number" "710-865080340001")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Wurth-Elektronik/865080340001?qs=0KOYDY2FL2%252BaqRFD837lAw%3D%3D")
		(attr "Arrow Part Number" "")
		(attr "Arrow Price/Stock" "")
		(attr "Description" "Wurth Elektronik 10uF 16 V dc Aluminium Electrolytic Capacitor, WCAP-ASLI Series 2000h 4 (Dia.) x 5.35mm")
		(attr "<Hyperlink>" "https://componentsearchengine.com/Datasheets/1/865080340001.pdf")
		(attr "<Component Height>" "5.5")
		(attr "<STEP Filename>" "865080340001.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)

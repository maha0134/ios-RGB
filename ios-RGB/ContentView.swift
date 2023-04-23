//
//  ContentView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct ContentView: View {
	//MARK: Environment variables
	@Environment(\.horizontalSizeClass) var hSizeClass
	@Environment(\.verticalSizeClass) var vSizeClass
	
	//MARK: State variables
	@State private var redSliderValue = 0.0
	@State private var greenSliderValue = 0.0
	@State private var blueSliderValue = 0.0
	@State private var opacitySliderValue = 255.0
	@State private var hexValue = ""
	@State private var errorMessage = ""
	
	var body: some View {
		if vSizeClass == .regular && hSizeClass == .compact {
			//Portrait orientation for mobile devices
			PortraitView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue, hexValue:$hexValue, errorMessage: $errorMessage)
				.font(.title2)
			
		} else if vSizeClass == .regular && hSizeClass == .regular {
			//Tablet view
			PortraitView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue, hexValue: $hexValue, errorMessage: $errorMessage)
				.font(.title)
				.frame(width: 850,height: 850)
		} else {
			//Landscape orientation for mobile devices
			LandscapeView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue, hexValue: $hexValue, errorMessage: $errorMessage)
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

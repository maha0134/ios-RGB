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
	@State var redSliderValue = 0.00
	@State var greenSliderValue = 0.00
	@State var blueSliderValue = 0.00
	@State var opacitySliderValue = 0.00
	@State var hexValue = ""
	
	var body: some View {
		if vSizeClass == .regular && hSizeClass == .compact {
			//Portrait orientation for mobile devices
			PortraitView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue,hexValue:$hexValue).font(.title2)
			
		}else if vSizeClass == .regular && hSizeClass == .regular{
			//Tablet view
			PortraitView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue,hexValue:$hexValue).font(.title).frame(width: 850,height:850)
		} else{
			//Landscape orientation for mobile devices
			LandscapeView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue,hexValue:$hexValue)
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

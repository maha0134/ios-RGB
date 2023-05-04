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
	
	@ObservedObject var vm = ContentViewModel()
	
	var body: some View {
		if vSizeClass == .regular && hSizeClass == .compact {
			//Portrait orientation for mobile devices
			PortraitView(redSliderValue: $vm.redSliderValue, greenSliderValue: $vm.greenSliderValue, blueSliderValue: $vm.blueSliderValue, opacitySliderValue: $vm.opacitySliderValue, hexValue:$vm.hexValue, errorMessage: $vm.errorMessage)
				.font(.title2)
			
		} else if vSizeClass == .regular && hSizeClass == .regular {
			//Tablet view
			PortraitView(redSliderValue: $vm.redSliderValue, greenSliderValue: $vm.greenSliderValue, blueSliderValue: $vm.blueSliderValue, opacitySliderValue: $vm.opacitySliderValue, hexValue: $vm.hexValue, errorMessage: $vm.errorMessage)
				.font(.title)
				.frame(width: 850,height: 850)
		} else {
			//Landscape orientation for mobile devices
			LandscapeView(redSliderValue: $vm.redSliderValue, greenSliderValue: $vm.greenSliderValue, blueSliderValue: $vm.blueSliderValue, opacitySliderValue: $vm.opacitySliderValue, hexValue: $vm.hexValue, errorMessage: $vm.errorMessage)
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

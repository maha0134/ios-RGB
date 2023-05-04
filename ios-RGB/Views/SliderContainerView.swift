//
//  SliderContainerView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct SliderContainerView: View {

	@ObservedObject var stateValues: ContentViewModel
	
	var body: some View {
		VStack{
			//can loop over using a Tuple or enum, but this gives more control for the limited use case and is readable and concise
			BaseSliderView(value: $stateValues.redSliderValue, color: .red, colorLabel: "Red")
			BaseSliderView(value: $stateValues.greenSliderValue, color: .green, colorLabel: "Green")
			BaseSliderView(value: $stateValues.blueSliderValue, color: .blue, colorLabel: "Blue")
			BaseSliderView(value: $stateValues.opacitySliderValue, color: Color("ColorBlack"), colorLabel: "Opacity")
			
			Button("Reset") {
				stateValues.redSliderValue = 0.00
				stateValues.greenSliderValue = 0.00
				stateValues.blueSliderValue = 0.00
				stateValues.opacitySliderValue = 255
				stateValues.hexValue = ""
				stateValues.errorMessage = ""
			}
			.padding()
		}
		.padding()
	}
}

struct SliderContainerView_Previews: PreviewProvider {
    static var previews: some View {
		SliderContainerView(stateValues: ContentViewModel())
    }
}

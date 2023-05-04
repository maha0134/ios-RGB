//
//  SliderContainerView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct SliderContainerView: View {
	//MARK: Binding variables
	@Binding var redSliderValue:Double
	@Binding var greeenSliderValue:Double
	@Binding var blueSliderValue:Double
	@Binding var opacitySliderValue:Double
	@Binding var hexValue: String
	@Binding var errorMessage: String
	
	var body: some View {
		VStack{
			//can loop over using a Tuple or enum, but this gives more control for the limited use case and is readable and concise
			BaseSliderView(value: $redSliderValue, color: .red, colorLabel: "Red")
			BaseSliderView(value: $greeenSliderValue, color: .green, colorLabel: "Green")
			BaseSliderView(value: $blueSliderValue, color: .blue, colorLabel: "Blue")
			BaseSliderView(value: $opacitySliderValue, color: Color("SliderColorBlack"), colorLabel: "Opacity")
			
			Button("Reset") {
				redSliderValue=0.00
				greeenSliderValue = 0.00
				blueSliderValue = 0.00
				opacitySliderValue = 255
				hexValue = ""
				errorMessage = ""
			}
			.padding()
		}
		.padding()
	}
}

struct SliderContainerView_Previews: PreviewProvider {
    static var previews: some View {
		SliderContainerView(redSliderValue: .constant(110), greeenSliderValue:  .constant(110), blueSliderValue:  .constant(110), opacitySliderValue:  .constant(110), hexValue: .constant("abc"), errorMessage: .constant(""))
    }
}

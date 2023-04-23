//
//  PortraitView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct PortraitView: View {
	//MARK: Binding variables
	@Binding var redSliderValue:Double
	@Binding var greenSliderValue:Double
	@Binding var blueSliderValue:Double
	@Binding var opacitySliderValue:Double
	@Binding var hexValue:String
	
	var body: some View {
		VStack {
			TextView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue, hexValue:$hexValue)
				.padding()
			
			ColorPreview(redSliderValue: $redSliderValue, greeenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue)
				.frame(width: 200, height: 200)
			
			SliderContainer(redSliderValue: $redSliderValue, greeenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue)
		}
		.padding()
	}
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
		PortraitView(redSliderValue: .constant(15), greenSliderValue: .constant(10), blueSliderValue: .constant(225), opacitySliderValue: .constant(255), hexValue: .constant("ABD"))
    }
}

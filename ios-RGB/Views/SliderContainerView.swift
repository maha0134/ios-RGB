//
//  SliderContainerView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct SliderContainer: View {
	//MARK: Binding variables
	@Binding var redSliderValue:Double
	@Binding var greeenSliderValue:Double
	@Binding var blueSliderValue:Double
	@Binding var opacitySliderValue:Double
	var body: some View {
		VStack{
			BaseSliderView(value: $redSliderValue, color: .red, colorLabel: "Red")
			BaseSliderView(value: $greeenSliderValue, color: .green, colorLabel: "Green")
			BaseSliderView(value: $blueSliderValue, color: .blue, colorLabel: "Blue")
			BaseSliderView(value: $opacitySliderValue, color: .black, colorLabel: "Opacity")
			Button("Reset"){
				redSliderValue=0.00
				greeenSliderValue = 0.00
				blueSliderValue = 0.00
				opacitySliderValue = 0.00
			}.padding()
		}.padding()
	}
}

//struct SliderContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderContainerView()
//    }
//}

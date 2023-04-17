//
//  LandscapeView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct LandscapeView: View {
	//MARK: State variables
	@Binding var redSliderValue:Double
	@Binding var greenSliderValue:Double
	@Binding var blueSliderValue:Double
	@Binding var opacitySliderValue:Double
	@Binding var hexValue:String
	var body: some View {
		ScrollView{
			HStack{
				VStack(alignment: .leading){
					TextView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue,hexValue:$hexValue).font(.title2)
					ColorPreview(redSliderValue: $redSliderValue, greeenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue).frame(width: 300.0, height: 300.0)
				}.padding()
				SliderContainer(redSliderValue: $redSliderValue, greeenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue)
				
			}.padding()
		}
	}
	
}
//struct LandscapeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LandscapeView()
//    }
//}

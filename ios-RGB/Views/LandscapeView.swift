//
//  LandscapeView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct LandscapeView: View {
	//MARK: State variables
	@Binding var redSliderValue: Double
	@Binding var greenSliderValue: Double
	@Binding var blueSliderValue: Double
	@Binding var opacitySliderValue: Double
	@Binding var hexValue: String
	@Binding var errorMessage: String
	
	var body: some View {
		ScrollView{
			HStack{
				VStack(alignment: .center, spacing: 20) {
					if !errorMessage.isEmpty {
						Text(errorMessage)
							.foregroundColor(.red)
					}
					TextView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue, hexValue:$hexValue, errorMessage: $errorMessage)
						.font(.title2)
					
					ColorPreview(redSliderValue: $redSliderValue, greeenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue)
						.frame(width: 200.0, height: 200.0)
				}
				.padding()
				
				SliderContainer(redSliderValue: $redSliderValue, greeenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, opacitySliderValue: $opacitySliderValue)
			}
			.padding()
		}
	}
}
struct LandscapeView_Previews: PreviewProvider {
	static var previews: some View {
		LandscapeView(redSliderValue: .constant(24), greenSliderValue: .constant(24), blueSliderValue: .constant(24), opacitySliderValue: .constant(24), hexValue: .constant("Red"), errorMessage: .constant(""))
	}
}

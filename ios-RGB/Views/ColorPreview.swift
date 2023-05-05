//
//  ColorPreview.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct ColorPreview: View {
	
	@ObservedObject var stateValues: ContentViewModel
	
	private var formattedString: String {
		return String(format: "%02X", Int(stateValues.redSliderValue))
		+ String(format:"%02X", Int(stateValues.greenSliderValue))
		+ String(format:"%02X", Int(stateValues.blueSliderValue))
		+ String(format:"%02X", Int(stateValues.opacitySliderValue))
	}
	
	var body: some View {
		VStack{
			RoundedRectangle(cornerRadius: 5)
				.fill(Color(red: stateValues.redSliderValue/255, green: stateValues.greenSliderValue/255, blue: stateValues.blueSliderValue/255, opacity: stateValues.opacitySliderValue/255))
				.shadow(radius: 5)
				.overlay(
					RoundedRectangle(cornerRadius: 5)
						.stroke(Color("ColorBlack"))
				)
				.padding(.bottom, 10)
			
			Text("Hex: " + formattedString)
				.font(.headline)
		}
	}
}

struct ColorPreview_Previews: PreviewProvider {
	static var previews: some View {
		ColorPreview(stateValues: ContentViewModel())
	}
}

//
//  ColorPreview.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct ColorPreview: View {
	//MARK: Binding variables
	@Binding var redSliderValue: Double
	@Binding var greeenSliderValue: Double
	@Binding var blueSliderValue: Double
	@Binding var opacitySliderValue: Double
	
	private var formattedString: String {
		return String(format: "%02X", Int(redSliderValue))
		+ String(format:"%02X", Int(greeenSliderValue))
		+ String(format:"%02X", Int(blueSliderValue))
		+ String(format:"%02X", Int(opacitySliderValue))
	}
	
	var body: some View {
		VStack{
			RoundedRectangle(cornerRadius: 10)
				.fill(Color(red: redSliderValue/255, green: greeenSliderValue/255, blue: blueSliderValue/255, opacity: opacitySliderValue/255))
			
			Text("Hex: " + formattedString)
		}
	}
}

struct ColorPreview_Previews: PreviewProvider {
	static var previews: some View {
		ColorPreview(redSliderValue: .constant(25), greeenSliderValue: .constant(35), blueSliderValue: .constant(35), opacitySliderValue: .constant(35))
	}
}

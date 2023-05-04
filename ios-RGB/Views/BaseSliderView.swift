//
//  BaseSliderView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct BaseSliderView: View {
	//MARK: Variables
	@Binding var value: Double
	let color: Color
	let colorLabel: String
	private let opacityLabel: String = "Opacity"
	
	var label: String {
		//change opacity label from 1-255 to 1-100%
		if colorLabel == opacityLabel {
			return String(format:"%.0f", (value * 100) / 255)
		}
		
		return String(format: "%.0f", value)
	}
	
	var body: some View {
		VStack{
			Slider(value: $value,
				   in: 0...255,
				   step: 1,
				   label:{})
			.tint(color)
			
			Text("\(colorLabel): \(self.label)")
				.foregroundColor(color)
		}
	}
}

struct BaseSliderView_Previews: PreviewProvider {
    static var previews: some View {
		BaseSliderView(value: .constant(15), color: .red, colorLabel: "Red")
    }
}

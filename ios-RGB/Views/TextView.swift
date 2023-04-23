//
//  TextView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct TextView: View {
	//MARK: Binding variables
	@Binding var redSliderValue:Double
	@Binding var greenSliderValue:Double
	@Binding var blueSliderValue:Double
	@Binding var opacitySliderValue:Double
	@Binding var hexValue:String
	
	var body: some View {
		HStack{
			TextField("Enter a hex value", text: $hexValue)
				.textInputAutocapitalization(.characters)
				.onChange(of: hexValue, perform: {
					hexValue = String($0.prefix(8))
					var arrOfCharacters = [Character](hexValue)
					if(!arrOfCharacters.isEmpty){
						//allow only hex characters
						if(!(arrOfCharacters.last!.isNumber) && !(["A","B","C","D","E","F"].contains(arrOfCharacters.last))){
							_ = arrOfCharacters.popLast()
							hexValue = String(arrOfCharacters)
						}
					}
					
				}).frame(width: 200)
				.border(.secondary)
			Button("Apply", action: validateHexValue)
				.disabled(validHexCount())
		}
	}
}

struct TextView_Previews: PreviewProvider {
	static var previews: some View {
		TextView(redSliderValue: .constant(10), greenSliderValue: .constant(10), blueSliderValue: .constant(10), opacitySliderValue: .constant(10), hexValue: .constant("AAF"))
	}
}

extension TextView {
	//Checks length of input
	func validHexCount() -> Bool {
		if(hexValue.count == 3 || hexValue.count == 4 || hexValue.count == 6 || hexValue.count == 8){
			return false
		}
		return true
	}
	
	//MARK: Runs when apply button is clicked
	private func validateHexValue() {
		var receivedHexValue:String = hexValue
		var newValue:String = ""
		//turn 3-digit/4-digit hex input into equivalent 6-digit/8-digit version before passing to the converter
		if(receivedHexValue.count == 3 || receivedHexValue.count == 4) {
			receivedHexValue.forEach { char in
				newValue.append(char)
				newValue.append(char)
			}
			receivedHexValue = newValue
		}
		var rgbaValues:(UInt8, UInt8, UInt8, UInt8)
		rgbaValues = getRGBAColor(rgba: receivedHexValue)
		redSliderValue = Double(rgbaValues.0)
		greenSliderValue = Double(rgbaValues.1)
		blueSliderValue = Double(rgbaValues.2)
		opacitySliderValue = Double(rgbaValues.3)
	}
}

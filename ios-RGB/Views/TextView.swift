//
//  TextView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct TextView: View {
	//MARK: Binding variables
	@Binding var redSliderValue: Double
	@Binding var greenSliderValue: Double
	@Binding var blueSliderValue: Double
	@Binding var opacitySliderValue: Double
	@Binding var hexValue: String
	@Binding var errorMessage: String
	
	let hexAlphabets: [Character] = ["A","B","C","D","E","F"]
	
	var body: some View {
		
		HStack{
			TextField("Enter a hex value", text: $hexValue)
				.textInputAutocapitalization(.characters)
				.onChange(of: hexValue, perform: { newHexValue in
					restrictInput(newHexValue: newHexValue)
				})
				.padding(7)
				.frame(width: 200)
				.border(.secondary)

			Button("Apply", action: validateHexValue)
		}
	}
}

struct TextView_Previews: PreviewProvider {
	static var previews: some View {
		TextView(redSliderValue: .constant(10), greenSliderValue: .constant(10), blueSliderValue: .constant(10), opacitySliderValue: .constant(10), hexValue: .constant("AAF"),errorMessage: .constant(""))
	}
}

extension TextView {
	//Checks length of input
	func validHexCount() -> Bool {
		if(hexValue.count == 3 || hexValue.count == 4 || hexValue.count == 6 || hexValue.count == 8){
			return true
		}
		return false
	}
	
	//MARK: Runs when apply button is clicked
	private func validateHexValue() {
		if !validHexCount() {
			errorMessage = "Please enter a valid Hex value"
			return
		}
		
		errorMessage = ""
		var receivedHexValue: String = hexValue
		var newValue: String = ""
		//turn 3-digit/4-digit hex input into equivalent 6-digit/8-digit version before passing to the converter
		if(receivedHexValue.count == 3 || receivedHexValue.count == 4) {
			receivedHexValue.forEach { char in
				for _ in 0...1 {
					newValue.append(char)
				}
			}
			receivedHexValue = newValue
		}
		
		var rgbaValues: (UInt8, UInt8, UInt8, UInt8)
		rgbaValues = getRGBAColor(rgba: receivedHexValue)
		redSliderValue = Double(rgbaValues.0)
		greenSliderValue = Double(rgbaValues.1)
		blueSliderValue = Double(rgbaValues.2)
		opacitySliderValue = Double(rgbaValues.3)
	}
	
	private func restrictInput(newHexValue: String) {
		hexValue = String(newHexValue.prefix(8))
		var arrOfCharacters = [Character](hexValue)
		if !arrOfCharacters.isEmpty {
			//allow only hex characters
			let currentCharacter = arrOfCharacters.last!
			if(!currentCharacter.isNumber && !hexAlphabets.contains(currentCharacter)) {
				_ = arrOfCharacters.popLast()
				hexValue = String(arrOfCharacters)
			}
		}
	}
}

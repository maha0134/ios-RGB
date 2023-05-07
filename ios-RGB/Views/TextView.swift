//
//  TextView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct TextView: View {
	
	@ObservedObject var stateValues: ContentViewModel
	@FocusState var focused
	
	var body: some View {
		
		HStack{
			TextField("Enter a hex value", text: $stateValues.hexValue)
				.textInputAutocapitalization(.characters)
				.onChange(of: stateValues.hexValue, perform: { newHexValue in
					if !newHexValue.isEmpty {
						restrictInput(newHexValue: newHexValue)
					}
				})
				.focused($focused)
				.padding(7)
				.frame(width: 200)
				.border(.secondary)
			
			Button("Apply") {
				if !stateValues.hexValue.isEmpty {
					validateHexValue()
				} else {
					stateValues.errorMessage = "Please enter a Hex value"
				}
			}
		}
	}
}

struct TextView_Previews: PreviewProvider {
	static var previews: some View {
		TextView(stateValues: ContentViewModel())
	}
}

extension TextView {
	//Checks length of input
	func validHexCount() -> Bool {
		let validHexCount = [3, 4, 6, 8]
		//Only allow a valid hex value count
		return  validHexCount.contains(stateValues.hexValue.count)
	}
	
	//MARK: Runs when apply button is clicked
	private func validateHexValue() {
		if !validHexCount() {
			stateValues.errorMessage = "Please enter a valid Hex value"
			return
		}
		focused = false
		stateValues.errorMessage = ""
		var receivedHexValue: String = stateValues.hexValue
		var newValue: String = ""
		//turn 3-digit/4-digit hex input into equivalent 6-digit/8-digit version before passing to the converter
		if receivedHexValue.count == 3 || receivedHexValue.count == 4 {
			receivedHexValue.forEach { char in
				//Repeat each character and add to the String
				newValue += "\(char)\(char)"
			}
			receivedHexValue = newValue
		}
		
		var rgbaValues: (UInt8, UInt8, UInt8, UInt8)
		rgbaValues = getRGBAColor(rgba: receivedHexValue)
		stateValues.redSliderValue = Double(rgbaValues.0)
		stateValues.greenSliderValue = Double(rgbaValues.1)
		stateValues.blueSliderValue = Double(rgbaValues.2)
		stateValues.opacitySliderValue = Double(rgbaValues.3)
	}
	
	private func restrictInput(newHexValue: String) {
		let hexAlphabets: [Character] = ["A", "B", "C", "D", "E", "F"]
		stateValues.hexValue = String(newHexValue.prefix(8))
		
		guard let lastAlphabet = stateValues.hexValue.last else {
			return
		}
		//Check the last entered character to be valid HEX digit
		if !hexAlphabets.contains(lastAlphabet) &&
			!lastAlphabet.isNumber {
			stateValues.hexValue.removeLast()
		}
	}
}

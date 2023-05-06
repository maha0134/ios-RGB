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
	
	let hexAlphabets: [Character] = ["A","B","C","D","E","F"]
	
	var body: some View {
		
		HStack{
			TextField("Enter a hex value", text: $stateValues.hexValue)
				.textInputAutocapitalization(.characters)
				.onChange(of: stateValues.hexValue, perform: { newHexValue in
					restrictInput(newHexValue: newHexValue)
				})
				.focused($focused)
				.padding(7)
				.frame(width: 200)
				.border(.secondary)

			Button("Apply", action: validateHexValue)
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
	//TODO: get rid of IF statement
	func validHexCount() -> Bool {
		if(stateValues.hexValue.count == 3 ||
		   stateValues.hexValue.count == 4 ||
		   stateValues.hexValue.count == 6 ||
		   stateValues.hexValue.count == 8) {
			return true
		}
		return false
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
		stateValues.redSliderValue = Double(rgbaValues.0)
		stateValues.greenSliderValue = Double(rgbaValues.1)
		stateValues.blueSliderValue = Double(rgbaValues.2)
		stateValues.opacitySliderValue = Double(rgbaValues.3)
	}
	
	private func restrictInput(newHexValue: String) {
		stateValues.hexValue = String(newHexValue.prefix(8))
		var arrOfCharacters = [Character](stateValues.hexValue)
		if !arrOfCharacters.isEmpty {
			//allow only hex characters
			let currentCharacter = arrOfCharacters.last!
			if(!currentCharacter.isNumber && !hexAlphabets.contains(currentCharacter)) {
				_ = arrOfCharacters.popLast()
				stateValues.hexValue = String(arrOfCharacters)
			}
		}
	}
}

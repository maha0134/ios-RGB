//
//  ContentViewModel.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-05-04.
//

import Foundation

class ContentViewModel : ObservableObject {
	//MARK: State variables
	@Published var redSliderValue = 0.0
	@Published var greenSliderValue = 0.0
	@Published var blueSliderValue = 0.0
	@Published var opacitySliderValue = 255.0
	@Published var hexValue = ""
	@Published var errorMessage = ""
}

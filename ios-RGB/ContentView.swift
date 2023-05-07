//
//  ContentView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct ContentView: View {
	//MARK: Environment variables
	@Environment(\.horizontalSizeClass) var hSizeClass
	@Environment(\.verticalSizeClass) var vSizeClass
	
	@StateObject var stateValues = ContentViewModel()
	@FocusState var focused
	
	var body: some View {
		ZStack {
			if vSizeClass == .regular && hSizeClass == .compact {
				//Portrait orientation for mobile devices
				PortraitView(stateValues: stateValues, focused: _focused)
					.font(.title2)
				
			} else if vSizeClass == .regular && hSizeClass == .regular {
				//Tablet view
				PortraitView(stateValues: stateValues, focused: _focused)
					.font(.title)
					.frame(width: 850, height: 850)
			} else {
				//Landscape orientation for mobile devices
				LandscapeView(stateValues: stateValues, focused: _focused)
			}
		}
		.onTapGesture {
			focused = false
			stateValues.errorMessage = ""
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

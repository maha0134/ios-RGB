//
//  ContentView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

/*
 TODO: Add keyboard focus state
 TODO: get rid of bindings at every level
 TODO: add padding under text view
 */
import SwiftUI

struct ContentView: View {
	//MARK: Environment variables
	@Environment(\.horizontalSizeClass) var hSizeClass
	@Environment(\.verticalSizeClass) var vSizeClass
	
	@StateObject var stateValues = ContentViewModel()
	
	var body: some View {
		if vSizeClass == .regular && hSizeClass == .compact {
			//Portrait orientation for mobile devices
			PortraitView(stateValues: stateValues)
				.font(.title2)
			
		} else if vSizeClass == .regular && hSizeClass == .regular {
			//Tablet view
			PortraitView(stateValues: stateValues)
				.font(.title)
				.frame(width: 850,height: 850)
		} else {
			//Landscape orientation for mobile devices
			LandscapeView(stateValues: stateValues)
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

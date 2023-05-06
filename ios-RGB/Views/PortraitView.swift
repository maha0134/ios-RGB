//
//  PortraitView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct PortraitView: View {

	@ObservedObject var stateValues: ContentViewModel
	@FocusState var focused
	
	var body: some View {
		ScrollView {
			if !stateValues.errorMessage.isEmpty {
				Text(stateValues.errorMessage)
					.foregroundColor(.red)
			}
			
			Spacer()
			
			TextView(stateValues: stateValues, focused: _focused)
				.padding(.bottom, 20)
			
			ColorPreview(stateValues: stateValues)
				.frame(width: 200, height: 200)
			
			SliderContainerView(stateValues: stateValues)
		}
		.padding()
	}
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
		PortraitView(stateValues: ContentViewModel())
    }
}

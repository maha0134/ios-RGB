//
//  LandscapeView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct LandscapeView: View {

	@ObservedObject var stateValues: ContentViewModel
	
	var body: some View {
		ScrollView{
			HStack{
				VStack(alignment: .leading, spacing: 20) {
					if !stateValues.errorMessage.isEmpty {
						Text(stateValues.errorMessage)
							.foregroundColor(.red)
					}
					TextView(stateValues: stateValues)
						.font(.title2)
					
					ColorPreview(stateValues: stateValues)
						.frame(width: 200.0, height: 200.0)
				}
				.padding()
				
				SliderContainerView(stateValues: stateValues)
			}
			.padding()
		}
	}
}
struct LandscapeView_Previews: PreviewProvider {
	static var previews: some View {
		LandscapeView(stateValues: ContentViewModel())
	}
}

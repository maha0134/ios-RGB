//
//  BaseSliderView.swift
//  ios-RGB
//
//  Created by AKSHAY MAHAJAN on 2023-04-17.
//

import SwiftUI

struct BaseSliderView: View {
	//MARK: Variables
	@Binding var value:Double
	var color:Color
	var colorLabel:String
	
	var body: some View {
		VStack{
			Slider(value: $value,
				   in: 0...255,
				   step: 1,
				   label:{})
			.tint(color)
			//change opacity label from 1-255 to 1-100%
			if(colorLabel == "Opacity"){
				Text("\(colorLabel): \(String(format:"%.0f",value*100/255))%").foregroundColor(color)
			}else{
				Text("\(colorLabel): \(String(format:"%.0f",value))").foregroundColor(color)
			}
		}
	}
}

//struct BaseSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        BaseSliderView()
//    }
//}

//
//  PickerViewMes.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 06/04/23.
//

import UIKit

protocol PickerViewSelectedMouth{
    func pickerMouth(mes:String)
        
    
}

class PickerViewMes: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate: PickerViewSelectedMouth?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "0\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.pickerMouth(mes: "0\(row + 1)")
        }
    }

}

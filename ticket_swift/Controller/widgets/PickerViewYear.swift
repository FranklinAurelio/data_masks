//
//  PickerViewYear.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 06/04/23.
//

import UIKit

protocol PickerViewSelectedYear{
    func pickerYear(year:String)
        
    
}

class PickerViewYear: NSObject, UIPickerViewDelegate, UIPickerViewDataSource{
    var delegate: PickerViewSelectedYear?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(2023 + row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.pickerYear(year: "\(2023 + row)")
        }
    }
}

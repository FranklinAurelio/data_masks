//
//  PickerViewInstallments.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 11/04/23.
//

import UIKit

protocol PickerViewSelectedInstallment{
    func pickerInstallment(installment:String)
        
    
}
class PickerViewInstallments: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    var delegate: PickerViewSelectedInstallment?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)x"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.pickerInstallment(installment: "\(row + 1)")
        }
    }
}

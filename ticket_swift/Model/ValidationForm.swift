//
//  ValidationForm.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 10/03/23.
//

import UIKit
import CPF_CNPJ_Validator

enum TextFieldsTypes:Int {
    case fullName = 1
    case email = 2
    case cpf = 3
    case cep = 4
    case adress = 5
    case neighborhood = 6
    case cardNumber = 7
    case mouthValidate = 8
    case yearValidade  = 9
    case cvv = 10
    case installments = 11
    
}

class ValidationForm: NSObject {
    
    func ValidateVoidTextFilds(TextFields:[UITextField]) -> Bool{
        for TextField in TextFields {
            if TextField.text == ""{
                return false
            }
        }
        return true
    }
    
    func ValidateTextFields(textFields:[UITextField]) -> Bool{
        var textfielDictionary: Dictionary<TextFieldsTypes, UITextField> = [:]
        for textField in textFields {
            if let textfieldTypes = TextFieldsTypes(rawValue: textField.tag){
                textfielDictionary[textfieldTypes] = textField
            }
        }
        guard let cpf = textfielDictionary[.cpf], BooleanValidator().validate(cpf: cpf.text!) else { return false }
        guard let email = textfielDictionary[.email], self.ValidateEmail( email.text!) else { return false }
        return true
    }
    
    func ValidateEmail(_ email:String) ->Bool{
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format: "self matches[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func displayTextfieldNotification(title:String, message:String) -> UIAlertController{
        let notification = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttom = UIAlertAction(title: "OK", style: .default)
        notification.addAction(buttom)
        return notification
    }

}

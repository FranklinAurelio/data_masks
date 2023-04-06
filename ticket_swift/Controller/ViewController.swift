//
//  ViewController.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 28/02/23.
//

import UIKit


class ViewController: UIViewController, PickerViewSelectedMouth, PickerViewSelectedYear {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageBanner: UIImageView!
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var pikerViewMes = PickerViewMes()
    var pikerViewYear = PickerViewYear()
    
    // MARK: - IBActions
    
    @IBAction func buyButtom(_ sender: UIButton) {
        let textFilidIsNotEmpaty = ValidationForm().ValidateVoidTextFilds(TextFields: textFields)
        let validAllTextFields = ValidationForm().ValidateTextFields(textFields: textFields)
        var alert:UIAlertController
        if textFilidIsNotEmpaty && validAllTextFields{
           alert =  ValidationForm().displayTextfieldNotification(title: "Compra finalizada", message: "Sua Compra foi realizada com sucesso")
        }
        else{
           alert =  ValidationForm().displayTextfieldNotification(title: "Compra não realizada", message: "Preencha os dados corretamente")
        }
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageBanner.layer.cornerRadius = 10
        self.imageBanner.layer.masksToBounds = true
        pikerViewMes.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(expandedScrollView(notification: )), name: UIWindow.keyboardWillShowNotification, object: nil)
        pikerViewYear.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(expandedScrollView(notification: )), name: UIWindow.keyboardWillShowNotification, object: nil)
      
        // Do any additional setup after loading the view.
    }
    
    @objc func expandedScrollView(notification: Notification){
        self.mainScrollView.contentSize = CGSize( width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height + 750)
    }
    func searchTextField(tipoTextField: TextFieldsTypes, completion:(_ textFieldSelected:UITextField) -> Void){
        for textfield in textFields{
            if let textfieldNow = TextFieldsTypes(rawValue: textfield.tag){
                if textfieldNow == tipoTextField{
                    completion(textfield)
                }
            }
        }
    }
    
    //MARK: - PickherViewDelegate
    func pickerMouth(mes: String) {
        self.searchTextField(tipoTextField: .mouthValidate) { textFieldMes in
            textFieldMes.text = mes
        }
    }
    
    func pickerYear(year: String) {
        self.searchTextField(tipoTextField: .yearValidade) { textFieldyear in
            textFieldyear.text = year
        }
    }
    
    @IBAction func textFieldCEPChange(_ sender: UITextField) {
        guard let cep = sender.text else { return  }
        LocalizationResponseApi().responseViaCepApi(cep: cep) { localization in
            print(localization)
        } fail: { error in
            print(error)
        }

    }
    
    
    @IBAction func textFieldMesPiker(_ sender: UITextField) {
        let  pikerView = UIPickerView()
        pikerView.delegate = pikerViewMes
        pikerView.dataSource = pikerViewMes
        
        sender.inputView = pikerView
    }
    
    
    @IBAction func textFieldPickerYear(_ sender: UITextField) {
        let  pikerView = UIPickerView()
        pikerView.delegate = pikerViewYear
        pikerView.dataSource = pikerViewYear
        
        sender.inputView = pikerView
    }
    
    @IBAction func textFieldCvv(_ sender: UITextField) {
        guard let text = sender.text else { return }
        if text.count > 3{
            let cvv = text.suffix(3)
            self.searchTextField(tipoTextField: .cvv) { textFieldCvv in
                textFieldCvv.text = String(cvv)
            }
        }
        else{
            self.searchTextField(tipoTextField: .cvv) { textFieldCvv in
                textFieldCvv.text = String(text)
            }
        }
    }
}


//
//  ViewController.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 28/02/23.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageBanner: UIImageView!
    
    @IBOutlet var textFields: [UITextField]!
    
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
        
      
        // Do any additional setup after loading the view.
    }


}


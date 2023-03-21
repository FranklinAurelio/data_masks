//
//  Localization.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 21/03/23.
//

import UIKit

class Localization: NSObject {
    var logradouro: String = ""
    var neighborhood: String = ""
    var city : String = ""
    var uf: String = ""
    
    init(_ dictionary: Dictionary<String, String>) {
        self.logradouro = dictionary["logradouro"] ?? ""
        self.neighborhood = dictionary["bairro"] ?? ""
        self.city = dictionary["localidade"] ?? ""
        self.uf = dictionary["uf"] ?? ""
    }
    
}

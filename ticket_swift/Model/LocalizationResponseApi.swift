//
//  LocalizationResponseApi.swift
//  ticket_swift
//
//  Created by Franklin Carvalho on 21/03/23.
//

import UIKit
import Alamofire

class LocalizationResponseApi: NSObject {
    func responseViaCepApi( cep:String, sucsses:@escaping(_ localization:Localization) -> Void, fail:@escaping(_ error:Error)->Void){
        
        AF.request("https://viacep.com.br/ws/\(cep)/json/", method: .get ).validate().response{
            response in debugPrint(response)
            switch response.result{
            case .success:
               
                let valueLocalization  = response.data  as Any
                if let resultApi = response.value as? Dictionary<String, String>{
                    let localization = Localization(resultApi)
                    sucsses(localization)
                    print("sucesso")
                }else{
                    print("here")
                    //print (response.response?.value(forKeyPath: <#T##String#>))
                
                }
                break
            case .failure:
                fail(response.error!)
                break
                
            }
        }

    }
}

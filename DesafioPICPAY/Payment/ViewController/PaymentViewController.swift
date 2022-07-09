//
//  PaymentViewController.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 17/03/22.
//

import UIKit

class PaymentViewController: UIViewController {

    var paymentViewScreen: PaymentViewScreen = PaymentViewScreen()
    
    override func loadView() {
        self.view = paymentViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.paymentViewScreen.delegate(delegate: self)
    }
}

extension PaymentViewController: PaymentScreenProtocol {
    func tappedPayment() {
        print("PAGAMENTO EFETUADO")
    }
    
    func tappedEditCard() {
        print("EDIÇÃO DE CARTÃO")
        
    }
}

//
//  ContactViewController.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 15/03/22.
//

import UIKit

class InitialViewController: UIViewController {
    
    var initialViewScreen:InitialViewScreen = InitialViewScreen()
    
    // loadView = Metodo de start para criação de uma view ou referencia entre view
    override func loadView() {
        self.view = self.initialViewScreen

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialViewScreen.delegate(delegate: self)
    }
}

extension InitialViewController: InitialScreenProtocol {
    
    func tappedStartChallenge() {
        // Criando uma constante do tipo: RegisterViewController que ira receber as caracterisca de RegisterViewController
        let contactViewController: ContactViewController = ContactViewController()
        // Dando um Push na RegisterViewController atraves da NavigationController
        self.navigationController?.pushViewController(contactViewController, animated: true)
    }
    
    // Função para exibição do Navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

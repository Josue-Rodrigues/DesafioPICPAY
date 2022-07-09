//
//  ContactViewController.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 15/03/22.
//

import UIKit

class ContactViewController: UIViewController {
    
    // Criando nossa variavel e instanciando ela como CONTACTVIEWSCREEN
    var contactViewScreen:ContactViewScreen? = ContactViewScreen()

    var contactDetail:[ContactDetail] = [
        ContactDetail(contactName: "@Ciclismo", detailContactName: "Daylson Pereira", imageName: "ciclismo"),
        ContactDetail(contactName: "@Corrida", detailContactName: "Jessé Pereira", imageName: "corrida"),
        ContactDetail(contactName: "@Karate", detailContactName: "Andrei Santos", imageName: "karate"),
        ContactDetail(contactName: "@Musculação", detailContactName: "Josué Rodrigues", imageName: "musculacao"),
        ContactDetail(contactName: "@Voley", detailContactName: "Valéria Rodrigues", imageName: "volley"),
    ]
    
    override func loadView() {
        // Indicando que nossa View terá o mesmo formato, medidas e detalhes de nossa ContactViewScreen
        self.view = contactViewScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assinando os protocolos de delegate e datasource criados em nossa CONTACTVIEWSCREEN
        self.contactViewScreen?.settingTableViewProtocols(delegate: self, dataSource: self)
    }
}

// Colocando no HomeViewController em conformidade com os protocolos de Delegate e DataSource
extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Função que determina a quantidade de celulas que terá a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactDetail.count
    }
    
//    // Função para criação do Title da TableView
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "CONTATOS"
//    }
//
//    // Função para ajuste e edição da fonte do Title da TableView
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//
//        if let header = view as? UITableViewHeaderFooterView {
//            header.textLabel!.font = UIFont.boldSystemFont(ofSize: 30)
//            header.textLabel?.textColor = UIColor.red
//            header.textLabel?.frame = header.frame
//            header.textLabel?.textAlignment = .center
//        }
//    }
//
//    // Função para ajuste da altura do titulo da TableView
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
    
    // Função de criação da Celula da TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ContactTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell
        cell?.setUpCell(data: self.contactDetail[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let contactRow = self.contactDetail[indexPath.row]
        
//        let paymentViewScreen = PaymentViewScreen()
//        paymentViewScreen.dataContactImage = String(contactRow.imageName)
//
//        self.dataContact = String(contactRow.imageName)
//
//        print(self.dataContact)

        print(contactRow.imageName)
        print(contactRow.detailContactName)
        print(contactRow.contactName)
        
        let paymentViewController: PaymentViewController = PaymentViewController()
        // Dando um Push na PaymentViewController atraves da NavigationController
        self.navigationController?.pushViewController(paymentViewController, animated: true)
    }

    // Função para determinar o tamanho da TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    // Função para exibição do Navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}


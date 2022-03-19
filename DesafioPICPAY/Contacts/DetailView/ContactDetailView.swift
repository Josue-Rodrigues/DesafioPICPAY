//
//  ContactDetailView.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 17/03/22.
//

import UIKit
import SnapKit

class ContactDetailView: UIView {
    
    lazy var labelTitleTableView: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Contatos"
        
        return label
    }()
    
    // Criando uma TextField = Email
    lazy var textFieldSearchContact: UITextField = {
        
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.backgroundColor = .gray.withAlphaComponent(0.3)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.attributedPlaceholder = NSAttributedString(
            string: "A quem você deseja pagar?",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        textField.textAlignment = .center
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 20
        textField.textColor = .white
        
        return textField
    }()
    
    /*// Criando o botão do DESAFIOPICPAY
    lazy var buttonSearchContact: UIButton = {
        
        let button = UIButton()
        button.setTitle("Iniciar desafio!!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(displayP3Red: 3/255, green: 150/255, blue: 30/255, alpha: 1.0)
//        button.addTarget(self, action: #selector(self.tappedStartChallenge), for: .touchUpInside)
        
        return button
    }()*/
    
    // Metodo construtor do itens da View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        //----------------------------------------------
        self.settingLabelTitleTableViewConstraint()
        self.settingTextFieldSearchContactConstraint()

    }
    
    // Função de erro (Criada automaticamente)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função para criação e edição do Backgound de nossa View
    private func settingsBackGround() {
        self.backgroundColor = .black
    }
    
    // Metodo de adição de nosso item em nossa SubView
    private func settingsSuperView() {
        self.addSubview(self.labelTitleTableView)
        self.addSubview(self.textFieldSearchContact)
    }
    
    // FUNÇÕES DE CONSTRAINT DOS ITENS DA VIEW
    
    func settingLabelTitleTableViewConstraint() {
        self.labelTitleTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    func settingTextFieldSearchContactConstraint() {
        self.textFieldSearchContact.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
    }
}

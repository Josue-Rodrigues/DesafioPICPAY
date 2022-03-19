//
//  ContactViewScreen.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 15/03/22.
//

import UIKit
import SnapKit

// Protocolo para ativação e chamada dos botões
protocol InitialScreenProtocol: AnyObject { // O protocol tipo Class foi substituido pelo tipo AnyObject
    func tappedStartChallenge()
}

class InitialViewScreen: UIView {
    
    // incrementando o protocol InitialScreen ao delegate
    private weak var delegate: InitialScreenProtocol?
    
    func delegate(delegate: InitialScreenProtocol?) {
        self.delegate = delegate
    }
    
    // Criando a imagem do DESAFIOPICPAY
    lazy var imageDesafioPICPAY: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "DesafioPICPAY")
        image.tintColor = UIColor(displayP3Red: 3/255, green: 150/255, blue: 30/255, alpha: 1.0)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    // Criando a label de titulo do DESAFIOPICPAY
    lazy var labelDesafioPICPAY: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 41)
        label.text = "DESAFIO PICPAY"
        
        return label
    }()
    
    // Criando a label de descrição do DESAFIOPICPAY
    lazy var descriptionDesafioPICPAY: UILabel = {
        
        let description = UILabel()
        description.textColor = .black
        description.font = UIFont.systemFont(ofSize: 18)
        description.textAlignment = .center
        description.text = "   O teste consiste em se desenvolver um app nativo iOS, dessa forma, deverá ser implementado em Swift ou Objective-C. É uma simulação de envio de dinheiro para uma outra pessoa via cartão de crédito. O usuário deverá escolher um contato de uma lista, informar o valor a ser enviado e finalizar o pagamento com o cartão de crédito cadastrado. Se não houver cartão de créditos cadastrado, deverá informá-lo também (número do cartão, data de validade e o CVV) antes de finalizar o pagamento. Os cartões devem ser persistidos no aplicativo para serem usados em pagamentos futuros. Devem ser usadas boas práticas de programação, assim como padrões de projeto e Arquitetura."
        description.numberOfLines = 20
        
        return description
    }()
    
    // Criando o botão do DESAFIOPICPAY
    lazy var buttonDesafioPICPAC: UIButton = {
        
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Iniciar desafio!!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(displayP3Red: 3/255, green: 150/255, blue: 30/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedStartChallenge), for: .touchUpInside)
        
        return button
    }()
    
    // Metodo construtor do itens da View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        //----------------------------------------------
        // Construção e Validação das Contraints
        self.settingImageDesafioPICPAYConstraint()
        self.settingLabelDesafioPICPAYConstraint()
        self.settingDescriptionDesafioPICPAYConstraint()
        self.settingButtonDesafioPICPAYConstraint()
    }
    
    // Função de erro (Criada automaticamente)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função para criação e edição do Backgound de nossa View
    private func settingsBackGround() {
        self.backgroundColor = .white
    }
    
    // Metodo de adição de nosso item em nossa SubView
    private func settingsSuperView() {
        self.addSubview(self.imageDesafioPICPAY)
        self.addSubview(self.labelDesafioPICPAY)
        self.addSubview(self.descriptionDesafioPICPAY)
        self.addSubview(self.buttonDesafioPICPAC)
    }
    
    // Função/Metodo para seleção/Clique de nosso botão
    @objc private func tappedStartChallenge() {
        self.delegate?.tappedStartChallenge()
    }
    
    // FUNÇÕES DE CONSTRAINT DOS ITENS DA VIEW
    func settingImageDesafioPICPAYConstraint() {
        self.imageDesafioPICPAY.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-50)
            make.centerX.equalToSuperview()
            make.height.equalTo(450)
            make.width.equalTo(450)
        }
    }
    
    func settingLabelDesafioPICPAYConstraint() {
        self.labelDesafioPICPAY.snp.makeConstraints { make in
            make.bottom.equalTo(self.imageDesafioPICPAY.snp.bottom).inset(110)
            make.centerX.equalTo(self.imageDesafioPICPAY.snp.centerX)
        }
    }
    
    func settingDescriptionDesafioPICPAYConstraint() {
        self.descriptionDesafioPICPAY.snp.makeConstraints { make in
            make.top.equalTo(self.labelDesafioPICPAY.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
        }
    }
    
    func settingButtonDesafioPICPAYConstraint() {
        self.buttonDesafioPICPAC.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(45)
        }
    }
}

//
//  PaymentViewScreen.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 17/03/22.
//

import UIKit

// Protocolo para ativação e chamada dos botões
protocol PaymentScreenProtocol: AnyObject { // O protocol tipo Class foi substituido pelo tipo AnyObject
    func tappedPayment()
    func tappedEditCard()
}

class PaymentViewScreen: UIView {
    
    var dataContact:DataContact = DataContact(contactName: "", detailContactName: "Josué Herrera Rodrigues", imageName: "ciclismo")

    // incrementando o protocol InitialScreen ao delegate
    private weak var delegate: PaymentScreenProtocol?
    
    func delegate(delegate: PaymentScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var imageViewContact: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "corrida")
        image.tintColor = UIColor(displayP3Red: 3/255, green: 150/255, blue: 30/255, alpha: 1.0)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    // Criando a label de titulo do DESAFIOPICPAY
    lazy var labelDetailContact: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Josué Herrera Rodrigues"
        
        return label
    }()
    
    lazy var labelSymbolR$: UILabel = {
        
        let description = UILabel()
        description.textColor = .systemGray
        description.font = UIFont.systemFont(ofSize: 18)
        description.textAlignment = .center
        description.text = "R$"
        
        return description
    }()
    
    lazy var textFieldValuePayment: UITextField = {
        
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.backgroundColor = .clear
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: 80)
        textField.attributedPlaceholder = NSAttributedString(
            string: "0,00",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        textField.textColor = UIColor(displayP3Red: 3/255, green: 150/255, blue: 30/255, alpha: 1.0)
        
        return textField
        
    }()
    
    lazy var labelDetailCard: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "MasterCard 1234 *"
        
        return label
    }()
    
    // Criando o botão do DESAFIOPICPAY
    lazy var buttonEditCard: UIButton = {
        
        let button = UIButton()
        button.setTitle("EDITAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(displayP3Red: 3/255, green: 150/255, blue: 30/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(self.tappedEditCard), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonPayment: UIButton = {
        
        let button = UIButton()
        button.setTitle("Pagar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.backgroundColor = UIColor(displayP3Red: 3/255, green: 150/255, blue: 30/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedPayment), for: .touchUpInside)
        
        return button
    }()
    
    // Metodo construtor do itens da View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.setUpCell(data: self.dataContact)
        //----------------------------------------------
        // Construção e Validação das Contraints
        self.settingImageViewContactConstraint()
        self.settingLabelDetailContactConstraint()
        self.settingLabelSymbolR$Constraint()
        self.settingLabelValuePaymentConstraint()
        self.settingLabelDetailCardConstraint()
        self.settingButtonEditCardConstraint()
        self.settingButtonPaymentConstraint()
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
        self.addSubview(self.imageViewContact)
        self.addSubview(self.labelDetailContact)
        self.addSubview(self.labelSymbolR$)
        self.addSubview(self.textFieldValuePayment)
        self.addSubview(self.labelDetailCard)
        self.addSubview(self.buttonEditCard)
        self.addSubview(self.buttonPayment)
    }
    
    // Função/Metodo para seleção/Clique de nosso botão
    @objc private func tappedPayment() {
        self.delegate?.tappedPayment()
    }
    
    // Função/Metodo para seleção/Clique de nosso botão
    @objc private func tappedEditCard() {
        self.delegate?.tappedEditCard()
    }
    
    // Função de chamada de nossa Model e atribuição de valores
    public func setUpCell(data:DataContact) {
        self.imageViewContact.image = UIImage(named:data.imageName)
        self.labelDetailContact.text = data.detailContactName
    }
    
    // FUNÇÕES DE CONSTRAINT DOS ITENS DA VIEW
    func settingImageViewContactConstraint() {
        self.imageViewContact.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
    }
    
    func settingLabelDetailContactConstraint() {
        self.labelDetailContact.snp.makeConstraints { make in
            make.top.equalTo(self.imageViewContact.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func settingLabelValuePaymentConstraint() {
        self.textFieldValuePayment.snp.makeConstraints { make in
            make.top.equalTo(self.labelDetailContact.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    }
    
    func settingLabelSymbolR$Constraint() {
        self.labelSymbolR$.snp.makeConstraints { make in
            make.centerY.equalTo(self.textFieldValuePayment.snp.centerY)
            make.trailing.equalTo(self.textFieldValuePayment.snp.leading).offset(-5)
        }
    }
    
    func settingLabelDetailCardConstraint() {
        self.labelDetailCard.snp.makeConstraints { make in
            make.top.equalTo(self.textFieldValuePayment.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(90)
        }
    }
    
    func settingButtonEditCardConstraint() {
        self.buttonEditCard.snp.makeConstraints { make in
            make.centerY.equalTo(self.labelDetailCard.snp.centerY)
            make.leading.equalTo(self.labelDetailCard.snp.trailing).offset(5)
        }
    }
    
    func settingButtonPaymentConstraint() {
        self.buttonPayment.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(45)
        }
    }
}

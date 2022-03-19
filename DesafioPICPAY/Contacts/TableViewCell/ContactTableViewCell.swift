//
//  ContactTableViewCell.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 15/03/22.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    // Criando o identifier de noss TableView
    static let identifier:String = "ContactTableViewCell"
    
    lazy var contactImageView:UIImageView = {
        
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var contactNameLabel:UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    lazy var detailContactNameLabel:UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemGray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingContactImageViewConstraint()
        self.settingContactNameLabelConstraint()
        self.settingDetailContactNameLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingsSuperView() {
        self.addSubview(self.contactImageView)
        self.addSubview(self.contactNameLabel)
        self.addSubview(self.detailContactNameLabel)
    }
    
    private func settingsBackGround() {
        self.backgroundColor = .black
    }
    
    // Função de chamada de nossa Model e atribuição de valores
    public func setUpCell(data:ContactDetail) {
        self.contactImageView.image = UIImage(named:data.imageName)
        self.contactNameLabel.text = data.contactName
        self.detailContactNameLabel.text = data.detailContactName
    }
    
    func settingContactImageViewConstraint() {
        self.contactImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            // Definindo medidas de Height e Width em uma unica linha, pois ambos possuem a mesma medida
            make.height.width.equalTo(70)
        }
    }
    
    func settingContactNameLabelConstraint() {
        self.contactNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.contactImageView.snp.centerY).inset(2)
            make.leading.equalTo(self.contactImageView.snp.trailing).offset(15)
        }
    }
    
    func settingDetailContactNameLabelConstraint() {
        self.detailContactNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contactImageView.snp.centerY).offset(2)
            make.leading.equalTo(self.contactImageView.snp.trailing).offset(15)
        }
    }
}

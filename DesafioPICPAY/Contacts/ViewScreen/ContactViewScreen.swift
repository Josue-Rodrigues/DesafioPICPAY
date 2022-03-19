//
//  ContactViewScreen.swift
//  DesafioPICPAY
//
//  Created by Josué Herrera Rodrigues on 15/03/22.
//

import UIKit

class ContactViewScreen: UIView {
    
    lazy var datailView: ContactDetailView = {
        
        let detailView = ContactDetailView()
        
        return detailView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        // Adicionando/Registrando nossas celulas dentro de nossa TableView
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.identifier)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingTableViewConstraint()
        self.settingDatailViewConstraint()
    }
    
    private func settingsBackGround() {
        self.backgroundColor = .white
    }
    
    // Função para configuração do delegate e dataSource em nossa tableView
    public func settingTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    func settingsSuperView() {
        self.addSubview(self.tableView)
        self.addSubview(self.datailView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Metodo de criação e configuração das Constraints (Framework - SNAPKIT)
    
    func settingDatailViewConstraint() {
        self.datailView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    func settingTableViewConstraint() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.datailView.snp.bottom)
            // Definindo medidas de left, right e bottom em uma unica linha, pois possuem a mesma referencia
            make.left.right.bottom.equalToSuperview()
        }
    }
}

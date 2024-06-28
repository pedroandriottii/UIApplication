//
//  SwitchViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

final class SwitchViewController: UIViewController {
    
    private var lblTitle: UILabel = {
        let label = UILabel()
        label.text = "Switch"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var lblDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var swToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swToggle.setOn(false, animated: false)
        swToggle.addTarget(self, action: #selector(updateSwitch), for: .valueChanged)
        
        setupView()
        setConstraints()
        updateSwitch()
    }
    
    private func setupView(){
        view.addSubview(swToggle)
        view.addSubview(lblDescription)
        view.addSubview(lblTitle)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            swToggle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swToggle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            lblDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblDescription.topAnchor.constraint(equalTo: swToggle.bottomAnchor, constant: 20.0),
            
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0)
        ])
    }
    
    @objc func updateSwitch() {
        lblDescription.text = swToggle.isOn ? "Light is ON" : "Light is OFF"
        lblDescription.textColor = swToggle.isOn ? .black : .white
        self.view.backgroundColor = swToggle.isOn ? .white : .black
    }

}

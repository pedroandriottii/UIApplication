//
//  SwitchViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

class SwitchViewController: UIViewController {
    
    var lblTitle = UILabel()
    var lblDescription = UILabel()
    var swToggle = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = "Switch"
        lblTitle.textColor = .red
        
        swToggle.setOn(false, animated: false)
        swToggle.addTarget(self, action: #selector(updateSwitch), for: .valueChanged)
        updateSwitch()
        
        self.view.addSubview(swToggle)
        swToggle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            swToggle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swToggle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.view.addSubview(lblDescription)
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblDescription.topAnchor.constraint(equalTo: swToggle.bottomAnchor, constant: 20.0)
        ])
        
        self.view.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
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

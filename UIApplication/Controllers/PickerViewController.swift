//
//  PickerViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 27/06/24.
//

import UIKit

class PickerViewController: UIViewController{
    
    let items = ["Brasil", "Estados Unidos", "Espanha", "França", "Argentina"]
    
    private var picker: UIPickerView = {
        let picker = UIPickerView()
       picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private var lblMain: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var lblTitle: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Picker View"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblMain.text = items[0]
        picker.delegate = self
        picker.dataSource = self
        
        setupView()
        setConstraints()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(lblTitle)
        view.addSubview(picker)
        view.addSubview(lblMain)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            
            picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            picker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lblMain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblMain.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: -20),
            lblMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component:Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblMain.text = items[row]
    }
}



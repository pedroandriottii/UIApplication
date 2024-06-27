//
//  PageControlViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

final class PageControlViewController: UIViewController{
    
    var currentPage = 0
    
    let colors: [UIColor] = [.blue, .green, .red, .yellow, .purple]
    
    private var lblTitle: UILabel = {
        let label = UILabel()
        label.text = "Page Control"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.tintColor = .white
        control.currentPageIndicatorTintColor = .red
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    private var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.gray, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private var previousBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Previous", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.blue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    private var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = colors.count
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        nextBtn.addTarget(self, action: #selector(rightArrow(_:)), for: .touchUpInside)
        previousBtn.addTarget(self, action: #selector(leftArrow(_:)), for: .touchUpInside)
        colorView.backgroundColor = colors[currentPage]
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(lblTitle)
        view.addSubview(pageControl)
        view.addSubview(nextBtn)
        view.addSubview(previousBtn)
        view.addSubview(colorView)
        updatePageControl()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nextBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextBtn.leftAnchor.constraint(equalTo: pageControl.rightAnchor, constant: 30),
            
            previousBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            previousBtn.rightAnchor.constraint(equalTo: pageControl.leftAnchor, constant: -30),
            
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),
            colorView.widthAnchor.constraint(equalToConstant: 200),
            colorView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func leftArrow(_ sender: Any){
        if currentPage == 0 {
            currentPage = pageControl.numberOfPages - 1
            updatePageControl()
        }
        else if currentPage > 0{
            currentPage -= 1
            updatePageControl()
        }
    }
    
    @objc func rightArrow(_ sender: Any){
        if currentPage == pageControl.numberOfPages - 1 {
            currentPage = 0
            updatePageControl()
        }
        else if currentPage < pageControl.numberOfPages - 1
        {
            currentPage += 1
            updatePageControl()
        }
    }
    
    @objc func updatePageControl(){
        pageControl.currentPage = currentPage
        colorView.backgroundColor = colors[currentPage]
    }
    
    @objc func pageControlChanged(_ sender: UIPageControl) {
        currentPage = sender.currentPage
        updatePageControl()
    }
}

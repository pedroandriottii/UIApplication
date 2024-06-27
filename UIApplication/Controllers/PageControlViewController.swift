//
//  PageControlViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

final class PageControlViewController: UIViewController{
    
    var currentPage = 0
    var pageControl = UIPageControl()
    var nextBtn = UIButton()
    var previousBtn = UIButton()
    var colorView = UIView()
    
    let colors: [UIColor] = [.blue, .green, .red, .yellow, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Page Control
        
        pageControl.numberOfPages = colors.count
        updatePageControl()
        pageControl.tintColor = .white
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
        // Next Button
        
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.backgroundColor = .white
        nextBtn.setTitleColor(.gray, for: .normal)
        nextBtn.addTarget(self, action: #selector(rightArrow(_:)), for: .touchUpInside)
        self.view.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                    nextBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    nextBtn.leftAnchor.constraint(equalTo: pageControl.rightAnchor, constant: 30)
        ])
        
        // Previous Button
        
        previousBtn.setTitle("Previous", for: .normal)
        previousBtn.backgroundColor = .white
        previousBtn.setTitleColor(.blue, for: .normal)
        previousBtn.translatesAutoresizingMaskIntoConstraints = false
        previousBtn.addTarget(self, action: #selector(leftArrow(_:)), for: .touchUpInside)
        self.view.addSubview(previousBtn)
        NSLayoutConstraint.activate([
            previousBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            previousBtn.rightAnchor.constraint(equalTo: pageControl.leftAnchor, constant: -30)
        ])
        
        // Color View
        
        colorView.backgroundColor = colors[currentPage]
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(colorView)
        NSLayoutConstraint.activate([
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

import UIKit

final class SegmentedControlViewController: UIViewController {
    
    var segmentControl = UISegmentedControl(items: ["Blue", "Green", "Red"])
    var lblTitle = UILabel()
    var colorView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Label
        
        lblTitle.text = "Segmented Control"
        lblTitle.textColor = .red
        self.view.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
        
        // Segment Control
        
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(colorChanged(_:)), for: .valueChanged)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentControl)
        
        // Color View
        
        colorView.backgroundColor = .blue
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(colorView)
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            segmentControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: segmentControl.trailingAnchor, multiplier: 4),
            
            colorView.heightAnchor.constraint(equalToConstant: 200),
            colorView.widthAnchor.constraint(equalToConstant: 200),
            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func colorChanged(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            colorView.backgroundColor = .blue
        case 1:
            colorView.backgroundColor = .green
        default:
            colorView.backgroundColor = .red
        }
    }
}

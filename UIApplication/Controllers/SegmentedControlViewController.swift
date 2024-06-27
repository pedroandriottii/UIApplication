import UIKit

class SegmentedControlViewController: UIViewController {
    
    let items = ["Blue", "Green", "Red"]
    
    lazy var segmentControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(segmentControl)
        self.view.addSubview(colorView)
        
        view.backgroundColor = .white
        lblTitle.text = "Segmented Control"
        lblTitle.textColor = .red
        self.view.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            segmentControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: segmentControl.trailingAnchor, multiplier: 4),
            
            colorView.heightAnchor.constraint(equalToConstant: 200),
            colorView.widthAnchor.constraint(equalToConstant: 200),
            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func colorChanged() {
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

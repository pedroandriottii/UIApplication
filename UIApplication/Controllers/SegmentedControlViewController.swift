import UIKit

final class SegmentedControlViewController: UIViewController {
    
    private var segmentControl: UISegmentedControl = {
        let items = ["Blue", "Green", "Red"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private var lblTitle: UILabel = {
        let label = UILabel()
        label.text = "Segmented Control"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.addTarget(self, action: #selector(colorChanged(_:)), for: .valueChanged)

        setupView()
        setConstraints()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(lblTitle)
        view.addSubview(segmentControl)
        view.addSubview(colorView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            
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

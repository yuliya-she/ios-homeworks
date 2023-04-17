
import UIKit

class InfoViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var goAlert: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("goAlert", for: .normal)
        button.addTarget(self, action: #selector(addAlert(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var action = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
        print("OK")
    }
    
    private lazy var action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in
        print("Cancel")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBrown
        self.setupSubviews()
    }
    
    // MARK: - Actions
    
    @objc func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func addAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alertController.addAction(action)
        alertController.addAction(action2)
        present(alertController, animated: true)
    }
    
    //MARK: - Constraints
    
    private func setupSubviews () {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        view.addSubview(backButton)
        view.addSubview(goAlert)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            backButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            backButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 44.0),
       
            
            goAlert.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            goAlert.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            goAlert.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                             constant: 30.0),
            goAlert.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
}

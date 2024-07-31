import UIKit

class SearchVC: UIViewController {
    let logoImageView = UIImageView()
    let backgroundImageView = UIImageView()
    let cgTextField = CGTextField()
    let cgButton = CGButton(backgroundColor: .yellow, title: "Get Followers")
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        cgTextField.delegate = self
        configureBackgroundImageView()
        configureLogoImageView()
        configureTextField()
        configureCGButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func configureBackgroundImageView() {
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "bob")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 175),
            logoImageView.widthAnchor.constraint(equalToConstant: 247)
        ])
    }
    
    private func configureTextField() {
        view.addSubview(cgTextField)
        
        NSLayoutConstraint.activate([
            cgTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 58),
            cgTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            cgTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            cgTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureCGButton() {
        view.addSubview(cgButton)
        cgButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cgButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            cgButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            cgButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            cgButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc func pushFollowerListVC() {
        let followerListVC = FollowerListVC()
        if let text = cgTextField.text {
            followerListVC.userName = text
            followerListVC.title = text
            navigationController?.pushViewController(followerListVC, animated: true)
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("AAAA")
        return true
    }
}

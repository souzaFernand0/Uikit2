import UIKit

class FollowerListVC: UIViewController {
    var userName: String = ""
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .cyan
    }
}

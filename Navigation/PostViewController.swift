import UIKit

class PostViewController: UIViewController {
    var titleName: String?
    
        override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        let infoButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(infoTap))
        navigationItem.rightBarButtonItem = infoButton
        self.title = titleName
    }
    
    @objc func infoTap() {
        let vc = InfoViewController()
        self.present(vc, animated: true, completion: nil)
    }

}

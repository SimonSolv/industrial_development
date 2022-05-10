import UIKit

class PostViewController: UIViewController {
    var titleName: String?
    let model: PostModel
    let presenter: PostPresenter
    
    init (model: PostModel, presenter: PostPresenter) {
        self.model = model
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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

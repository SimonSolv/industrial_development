import UIKit

class FeedViewController: UIViewController {
    var titleInfo = Post (title: "Post information")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        let postButton1: UIButton = {
            let btn = UIButton()
            btn.setTitle("New Post 1", for: .normal)
            btn.backgroundColor = .systemRed
            btn.addTarget(self, action: #selector(tapNewPostButton), for: .touchUpInside)
            return btn
        }()
        let postButton2: UIButton = {
            let btn = UIButton()
            btn.setTitle("New Post 2", for: .normal)
            btn.backgroundColor = .systemGray
            btn.addTarget(self, action: #selector(tapNewPostButton), for: .touchUpInside)
            return btn
        }()
        let buttonsView = UIStackView(arrangedSubviews: [
            postButton1,
            postButton2
        ])
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.axis = .vertical
        view.addSubview(buttonsView)

        [
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            buttonsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
            buttonsView.bottomAnchor.constraint(equalTo: buttonsView.topAnchor,constant: 210),
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),

        ]
        .forEach {
            $0.isActive = true
        }
        buttonsView.spacing = 10

    }
    @objc func tapNewPostButton() {
        let vc = PostViewController()
        navigationController?.pushViewController(vc, animated: true)
        vc.titleName = titleInfo.title
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Post" else { return }
        guard segue.destination is PostViewController else { return }
    }
}

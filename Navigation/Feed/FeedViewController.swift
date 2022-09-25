import UIKit
import SnapKit

class FeedViewController: UIViewController {

    var titleInfo = Post(title: "Post information")

    var checkWord: String?

    lazy var firstTextfield: UITextField = {
        let textfield = UITextField()
        textfield.setStyle(style: .other)
        textfield.placeholder = "Введите проверочное слово"
        textfield.addTarget(self, action: #selector(firstTextfieldChanged), for: .editingChanged)
        return textfield
    }()

    lazy var redLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: self.view.center.x-75, y: 600, width: 150, height: 50))
        label.layer.backgroundColor = UIColor.red.cgColor
        label.text = "Wrong word"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.textColor = .white
        return label
    }()

    lazy var greenLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: self.view.center.x-75, y: 600, width: 150, height: 50))
        label.layer.backgroundColor = UIColor.green.cgColor
        label.text = "Correct word"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.textColor = .black
        return label
    }()

    lazy var checkButton: CustomButton = {
        let btn = CustomButton(title: "Check", titleColor: .white, onTap: checkButtonTapped)
        btn.setStyle(style: .login)
        return btn
    }()

    func displayGreenLabel() {
        self.view.addSubview(greenLabel)
    }

    func displayRedLabel() {
        self.view.addSubview(redLabel)
    }

    func displayEptyFieldAlert() {
        let alertVC = UIAlertController(title: "Ошибка", message: "Вы ничего не ввели", preferredStyle: .alert )
        let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: {(_: UIAlertAction!) in })
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }

    lazy var postButton1: CustomButton = {
        let btn = CustomButton(title: "New Post 1", titleColor: .white, onTap: tapNewPostButton)
        btn.backgroundColor = .systemRed
        return btn
    }()

    lazy var postButton2: CustomButton = {
        let btn = CustomButton(title: "New Post 2", titleColor: .white, onTap: tapNewPostButton)
        btn.backgroundColor = .systemGray
        return btn
    }()

    lazy var buttonsView = UIStackView(arrangedSubviews: [
        self.postButton1,
        self.postButton2
    ])

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.correctNotification(notification:)),
                                               name: Notification.Name("Correct"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.incorrectNotification(notification:)),
                                               name: Notification.Name("Incorrect"),
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self.correctNotification(notification:))
        NotificationCenter.default.removeObserver(self.incorrectNotification(notification:))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        setupViews()
        setupConstraints()
        buttonsView.spacing = 10
    }

    func setupViews() {
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.axis = .vertical
        view.addSubview(buttonsView)
        view.addSubview(firstTextfield)
        view.addSubview(checkButton)
    }

    func setupConstraints() {

        buttonsView.snp.makeConstraints { (make) in
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.height.equalTo(210)
            make.leading.equalTo(view.snp.leading).offset(20)
        }

        firstTextfield.snp.makeConstraints { (make) in
            make.top.equalTo(buttonsView.snp.bottom).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }

        checkButton.snp.makeConstraints { (make) in
            make.top.equalTo(firstTextfield.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
    }

    @objc func firstTextfieldChanged() {
        checkWord = firstTextfield.text
    }

    func tapNewPostButton() {
        let controller = PostViewController()
        navigationController?.pushViewController(controller, animated: true)
        controller.titleName = titleInfo.title
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Post" else { return }
        guard segue.destination is PostViewController else { return }
    }
}
extension FeedViewController {
    public func checkButtonTapped() {
        removeLabels()
        if self.firstTextfield.text == "" {
            displayEptyFieldAlert()
            return
        } else {
            guard self.checkWord != nil
            else {
                displayEptyFieldAlert()
                return
            }
            FeedModel().check(word: self.checkWord!)
        }
    }
    @objc func correctNotification(notification: NSNotification) {
        displayGreenLabel()
    }
    @objc func incorrectNotification(notification: NSNotification) {
        displayRedLabel()
    }
    func removeLabels() {
        redLabel.removeFromSuperview()
        greenLabel.removeFromSuperview()
    }
}

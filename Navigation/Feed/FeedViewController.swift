import UIKit
import SnapKit

class FeedViewController: UIViewController, FeedPresenerDelegate {
    
    private let output: FeedViewModel
    
    func presentAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert )
        let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: {(alert: UIAlertAction!) in })
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    func presentPost(title: String) {
        // coordinator.showPost()
    }
    var isShown: Bool = false
    
    var checkWord: String?
    
    let greenLabel = CustomLabel(name: "Correct word", color: UIColor.green.cgColor)
    
    let redLabel = CustomLabel(name: "Wrong word", color: UIColor.red.cgColor)
    
    let firstTextfield: UITextField = {
        let textfield = UITextField()
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .systemGray6
        textfield.layer.borderWidth = 0.5
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.font = .systemFont(ofSize: 16)
        textfield.textColor = .black
        textfield.placeholder = "Введите проверочное слово"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.addTarget(FeedViewController.self, action: #selector(firstTextfieldChanged), for: .editingChanged)
        return textfield
    }()
    
    lazy var checkButton: CustomButton = {
        let btn = CustomButton(title: "Check", titleColor: .white) {
            if self.firstTextfield.text == "" {
                self.presentAlert(title: "Ошибка", message: "Вы ничего не ввели")
                return
            }
            else {
                guard let word = self.checkWord
                else {
                    self.presentAlert(title: "Ошибка", message: "Вы ничего не ввели")
                    return
                }
                let checkResult = self.output.check(inputWord: word)
                if checkResult {
                    self.redLabel.removeFromSuperview()
                    self.greenLabel.removeFromSuperview()
                    self.view.addSubview(self.greenLabel)
                } else {
                    self.greenLabel.removeFromSuperview()
                    self.redLabel.removeFromSuperview()
                    self.view.addSubview(self.redLabel)
                }
            }
        }
        btn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        return btn
    }()
    
    
    lazy var postButton1: CustomButton = {
        let btn = CustomButton(title: self.output.postTitles[0], titleColor: .white) {
            self.presentPost(title: self.output.postTitles[0])
        }
        btn.backgroundColor = .systemRed
        return btn
    }()
    
    lazy var postButton2: CustomButton = {
        let btn = CustomButton(title: self.output.postTitles[1], titleColor: .white) {
            self.presentPost(title: self.output.postTitles[1])
        }
        btn.backgroundColor = .systemGray
        return btn
    }()
    
    lazy var buttonsView = UIStackView(arrangedSubviews: [
        self.postButton1,
        self.postButton2
    ])
    
    func setupViews(){
        
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
    
    init(output: FeedViewModel) {
        self.output = output
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        self.title = "Feed"
        setupViews()
        setupConstraints()
        buttonsView.spacing = 10
        
        switch output.configuration {
        case .first:
            view.backgroundColor = .gray

            // первый вариант конфигурации
        case .second:
            break
            // второй вариант конфигурации
            
        }
        
        
    }
    @objc private func buttonPressed() {
        output.onSelectAction?()
        // вызов callback для передачи touch event -> ViewModel
    }
}

//class FeedViewController: UIViewController, FeedPresenerDelegate {
//
//    let model = FeedModel()
//
//    private let presenter = FeedPresenter()
//
//    func presentPost(title: String) {
//       // coordinator.showPost()
//    }
//    func update(with element: String) {
//        //code
//    }
//
//    func presentAlert(title: String, message: String) {
//        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert )
//        let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: {(alert: UIAlertAction!) in })
//        alertVC.addAction(okAction)
//        self.present(alertVC, animated: true, completion: nil)
//    }
//
//    private let output: PresenterModuleControllerOutput
//
//    init(output: PresenterModuleControllerOutput) {
//        self.output = output
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    var isShown: Bool = false
//
//    var checkWord: String?
//
//    let greenLabel = CustomLabel(name: "Correct word", color: UIColor.green.cgColor)
//
//    let redLabel = CustomLabel(name: "Wrong word", color: UIColor.red.cgColor)
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    let firstTextfield: UITextField = {
//        let textfield = UITextField()
//        textfield.layer.cornerRadius = 10
//        textfield.backgroundColor = .systemGray6
//        textfield.layer.borderWidth = 0.5
//        textfield.layer.borderColor = UIColor.lightGray.cgColor
//        textfield.font = .systemFont(ofSize: 16)
//        textfield.textColor = .black
//        textfield.placeholder = "Введите проверочное слово"
//        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
//        textfield.leftViewMode = .always
//        textfield.translatesAutoresizingMaskIntoConstraints = false
//        textfield.addTarget(FeedViewController.self, action: #selector(firstTextfieldChanged), for: .editingChanged)
//        return textfield
//    }()
//
//    lazy var checkButton: CustomButton = {
//        let btn = CustomButton(title: "Check", titleColor: .white) {
//            if self.firstTextfield.text == "" {
//                self.presentAlert(title: "Ошибка", message: "Вы ничего не ввели")
//                return
//            }
//            else {
//                guard let word = self.checkWord
//                else {
//                    self.presentAlert(title: "Ошибка", message: "Вы ничего не ввели")
//                    return
//                }
//                let checkResult = self.model.check(inputWord: word)
//                if checkResult {
//                    self.redLabel.removeFromSuperview()
//                    self.greenLabel.removeFromSuperview()
//                    self.view.addSubview(self.greenLabel)
//                } else {
//                    self.greenLabel.removeFromSuperview()
//                    self.redLabel.removeFromSuperview()
//                    self.view.addSubview(self.redLabel)
//                }
//            }
//        }
//        btn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
//        btn.layer.cornerRadius = 10
//        btn.clipsToBounds = true
//        return btn
//    }()
//
//
//    lazy var postButton1: CustomButton = {
//        let btn = CustomButton(title: self.model.postTitles[0], titleColor: .white) {
//            self.presentPost(title: self.model.postTitles[0])
//        }
//        btn.backgroundColor = .systemRed
//        return btn
//    }()
//
//    lazy var postButton2: CustomButton = {
//        let btn = CustomButton(title: self.model.postTitles[1], titleColor: .white) {
//            self.presentPost(title: self.model.postTitles[1])
//        }
//        btn.backgroundColor = .systemGray
//        return btn
//    }()
//
//    lazy var buttonsView = UIStackView(arrangedSubviews: [
//        self.postButton1,
//        self.postButton2
//    ])
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        presenter.setViewDelegate(delegate: self)
//        view.backgroundColor = .lightGray
//        self.title = "Feed"
//        setupViews()
//        setupConstraints()
//        buttonsView.spacing = 10
//
//    }
//
//    func setupViews(){
//
//        buttonsView.translatesAutoresizingMaskIntoConstraints = false
//        buttonsView.axis = .vertical
//        view.addSubview(buttonsView)
//        view.addSubview(firstTextfield)
//        view.addSubview(checkButton)
//    }
//
//    func setupConstraints() {
//
//        buttonsView.snp.makeConstraints { (make) in
//            make.trailing.equalTo(view.snp.trailing).offset(-20)
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
//            make.height.equalTo(210)
//            make.leading.equalTo(view.snp.leading).offset(20)
//        }
//
//        firstTextfield.snp.makeConstraints { (make) in
//            make.top.equalTo(buttonsView.snp.bottom).offset(50)
//            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
//            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
//            make.height.equalTo(50)
//        }
//
//        checkButton.snp.makeConstraints { (make) in
//            make.top.equalTo(firstTextfield.snp.bottom).offset(30)
//            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
//            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
//            make.height.equalTo(50)
//        }
//
//    }
//
//    @objc func firstTextfieldChanged() {
//        checkWord = firstTextfield.text
//    }
//
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        guard segue.identifier == "Post" else { return }
////        guard segue.destination is PostViewController else { return }
////    }
//}

// MARK: CustomLabel

class CustomLabel: UILabel {
    let name: String
    let color: CGColor
    init(name: String, color: CGColor) {
        self.name = name
        self.color = color

        super.init(frame: .zero)
        frame = CGRect(origin: CGPoint(x: self.superview?.center.x ?? 200 - 75 , y: 600), size: CGSize(width: 150, height: 50))
        text = name
        layer.backgroundColor = color
        textColor = .white
        layer.cornerRadius = 5
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

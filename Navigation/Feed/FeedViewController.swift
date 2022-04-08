import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
    var titleInfo = Post (title: "Post information")
    
    var checkWord: String?
    
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
        textfield.addTarget(self, action: #selector(firstTextfieldChanged), for: .editingChanged)
        return textfield
    }()
    
    lazy var checkButton: CustomButton = {
        let btn = CustomButton(title: "Check", titleColor: .white) {
            if self.firstTextfield.text == "" {
                let alertVC = UIAlertController(title: "Ошибка", message: "Вы ничего не ввели", preferredStyle: .alert )
                let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: {(alert: UIAlertAction!) in })
                alertVC.addAction(okAction)
                self.present(alertVC, animated: true, completion: nil)
                return
            }
            else {
            guard let word = self.checkWord
            else {
                let alertVC = UIAlertController(title: "Ошибка", message: "Вы ничего не ввели", preferredStyle: .alert )
                let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: {(alert: UIAlertAction!) in })
                alertVC.addAction(okAction)
                self.present(alertVC, animated: true, completion: nil)
                return
            }
            let model = FeedModel(checkWord: word).check()
            if model {
                let greenLabel = UILabel(frame: CGRect(x: self.view.center.x-75, y: 600, width: 150, height: 50))
                greenLabel.layer.backgroundColor = UIColor.green.cgColor
                greenLabel.text = "Correct word"
                greenLabel.textAlignment = .center
                greenLabel.layer.cornerRadius = 5
                greenLabel.textColor = .white
                self.view.addSubview(greenLabel)
            } else {
                let redLabel = UILabel(frame: CGRect(x: self.view.center.x-75, y: 600, width: 150, height: 50))
                redLabel.layer.backgroundColor = UIColor.red.cgColor
                redLabel.text = "Wrong word"
                redLabel.textAlignment = .center
                redLabel.layer.cornerRadius = 5
                redLabel.textColor = .white
                self.view.addSubview(redLabel)
            }
            }
        }
        btn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var postButton1: CustomButton = {
        let btn = CustomButton(title: "New Post 1", titleColor: .white) {
            self.tapNewPostButton()
        }
//        btn.setTitle("New Post 1", for: .normal)
        btn.backgroundColor = .systemRed
 //       btn.addTarget(self, action: #selector(tapNewPostButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var postButton2: CustomButton = {
        let btn = CustomButton(title: "New Post 2", titleColor: .white) {
            self.tapNewPostButton()
        }
 //       btn.setTitle("New Post 2", for: .normal)
        btn.backgroundColor = .systemGray
 //       btn.addTarget(self, action: #selector(tapNewPostButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var buttonsView = UIStackView(arrangedSubviews: [
        self.postButton1,
        self.postButton2
    ])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        setupViews()
        setupConstraints()
        buttonsView.spacing = 10

    }
    
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
    
    func tapNewPostButton() {
        let vc = PostViewController()
        navigationController?.pushViewController(vc, animated: true)
        vc.titleName = titleInfo.title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Post" else { return }
        guard segue.destination is PostViewController else { return }
    }
}

import UIKit
import SnapKit
class ProfileHeaderView: UIView {
    var status: String? = "Waiting for something..."
    
    var isSelected: Bool = false
    
    var avatarImageView: UIImageView = {
        var image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ProfilePic")
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = CGColor(srgbRed: 100, green: 100, blue: 100, alpha: 100)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    var fullNameLabel: UILabel = {
        var name: UILabel = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Pajama Kid"
        name.font = .boldSystemFont(ofSize: 18)
        return name
    }()
    
    var statusLabel: UILabel = {
        var status: UILabel = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = .systemFont(ofSize: 14)
        status.font = .boldSystemFont(ofSize: 18)
        status.textColor = .gray
        return status
    }()

    let closeButton: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 1
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self , action: #selector(backwardsAnimation), for: .touchUpInside)
        btn.setTitle("X", for: .normal)
        return btn
    }()
    
    let dimView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0
        return view
    }()
    
    var statusTextField: UITextField = {
        var textfield: UITextField = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 12
        textfield.layer.borderWidth = 1
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.font = .systemFont(ofSize: 15)
        textfield.textColor = .black
        textfield.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textfield
    }()
    
    var setStatusButton: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 12
        btn.addTarget(self , action: #selector(buttonPressed), for: .touchUpInside)
        btn.setTitle("Set status", for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.layer.shadowRadius = 5
        btn.layer.shadowOpacity = 1.0
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))

 //       addGestureRecognizer(tapGesture)
        translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = status
        backgroundColor = .lightGray
        avatarImageView.addGestureRecognizer(tapGesture)

        addSubview(setStatusButton)
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(dimView)
        addSubview(closeButton)
        
        closeButton.isHidden = true
        dimView.isHidden = true
        bringSubviewToFront(avatarImageView)
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {

            avatarImageView.snp.makeConstraints { (make) in
                make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(36)
                make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
                make.size.equalTo(CGSize(width: 103, height: 103))
            }

        fullNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(36)
            make.height.equalTo(23)
        }
        statusLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(fullNameLabel)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(-35)
            make.bottom.equalTo(avatarImageView).offset(-10)
        }
        
        statusTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(fullNameLabel)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(statusLabel.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        
        setStatusButton.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(statusTextField.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.top.equalTo(self.snp.top).offset(10)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        dimView.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.height.equalTo(2000)

        }
        self.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(-30)
            make.bottom.equalTo(setStatusButton).offset(15)
        }

    }
    
    @objc func backwardsAnimation() {
        animate2()

    }
    @objc func tap() {
        animate()
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        status = textField.text
    }
    
    @objc func buttonPressed(){
        statusLabel.text = status
        statusTextField.text = ""
        }

    func animate() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.dimView.isHidden = false
                self.avatarImageView.layer.cornerRadius = 0
                self.dimView.layer.opacity = 0.5
                self.avatarImageView.transform = CGAffineTransform(scaleX: (self.window?.bounds.width)!/self.avatarImageView.bounds.width, y: (self.window?.bounds.width)!/self.avatarImageView.bounds.width)
                self.avatarImageView.center = CGPoint(x: (self.window?.bounds.midX)!, y:(self.window?.bounds.midY)! - (self.window?.safeAreaInsets.bottom)! - (self.window?.safeAreaInsets.top)!)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                    self.closeButton.isHidden = false
            }
        })
    }
    
    func animate2() {
        UIView.animateKeyframes(withDuration: 0.5,delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.dimView.layer.opacity = 0
                self.avatarImageView.layer.cornerRadius = 50
                self.avatarImageView.transform = CGAffineTransform(scaleX: 1 , y: 1)
                self.avatarImageView.center = CGPoint(x: 66, y: 66)
                
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.closeButton.isHidden = true
            }
        }, completion: {_ in self.dimView.isHidden = true})
       // self.dimView.isHidden = true
    }
}

    

    

    




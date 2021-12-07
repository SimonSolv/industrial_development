import UIKit
let vc = LoginViewController()

class ProfileHeaderView: UIView {
    var status: String? = "Waiting for something..."
    
    var isSelected: Bool = false
  
    var avatarImageView: UIImageView = {
        var image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = vc.selectedUser?.avatar
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
        name.text = vc.selectedUser?.name
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
        print (vc.selectedUser?.name)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))

        addGestureRecognizer(tapGesture)
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
    let constraints =
        [
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor ,constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: leadingAnchor,constant: 16+100),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor ,constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor ,constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 23),
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -35),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -10),
            
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor ,constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor ,constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor,constant: 10),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            bottomAnchor.constraint(equalTo: setStatusButton.bottomAnchor, constant: 15),
            
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            
            dimView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dimView.heightAnchor.constraint(equalToConstant: 2000),
            dimView.trailingAnchor.constraint(equalTo: super.trailingAnchor),
            dimView.leadingAnchor.constraint(equalTo: super.leadingAnchor),
        ]
    NSLayoutConstraint.activate(constraints)
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

    

    

    




import UIKit

final class CustomButton: UIButton {
    
    private var buttonAction: () -> Void

    init(title: String, titleColor: UIColor, buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc private func buttonTapped() {
        self.buttonAction()
    }
}

//final class UIButton2: UIButton {
//    
//    convenience init(title: String = "",
//                     color: UIColor,
//                     handler: @escaping () -> Void) {
//        self.init(primaryAction: UIAction(
//            title: title,
//            titleColor: color,
//            handler: { _ in
//                handler()
//            }
//        ))
//    }
//}

//extension UIBarButtonItem {
//
//    /// Typealias for UIBarButtonItem closure.
//    private typealias UIBarButtonItemTargetClosure = (UIBarButtonItem) -> ()
//
//    private class UIBarButtonItemClosureWrapper: NSObject {
//        let closure: UIBarButtonItemTargetClosure
//        init(_ closure: @escaping UIBarButtonItemTargetClosure) {
//            self.closure = closure
//        }
//    }
//
//    private struct AssociatedKeys {
//        static var targetClosure = "targetClosure"
//    }
//
//    private var targetClosure: UIBarButtonItemTargetClosure? {
//        get {
//            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? UIBarButtonItemClosureWrapper else { return nil }
//            return closureWrapper.closure
//        }
//        set(newValue) {
//            guard let newValue = newValue else { return }
//            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, UIBarButtonItemClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//}
//
//final class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let button = UIButton(type: .system, primaryAction: UIAction(title: "Button Title", handler: { _ in
//            print("Button tapped!")
//        }))
//    }
//}

//class Button: UIButton {
//
//    typealias DidTapButton = (Button) -> ()
//
//    var didTouchUpInside: DidTapButton? {
//        didSet {
//            if didTouchUpInside != nil {
//                addTarget(self, action: #selector(didTouchUpInside(_:)), forControlEvents: .TouchUpInside)
//            } else {
//                removeTarget(self, action: #selector(didTouchUpInside(_:)), forControlEvents: .TouchUpInside)
//            }
//        }
//    }
//
//    // MARK: - Actions
//
//    func didTouchUpInside(sender: UIButton) {
//        if let handler = didTouchUpInside {
//            handler(self)
//        }
//    }
//
//}
//let btn222 = Button(

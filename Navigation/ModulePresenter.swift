final class ModulePresenter {
    
    weak var viewInput: PresenterModuleControllerInput?
    
    var text: String = "" {
        didSet {
            viewInput?.update(with: text)
        }
    }
}

extension ModulePresenter: PresenterModuleControllerOutput {
    
    func didSelectElement(_ element: String) {
    }
}

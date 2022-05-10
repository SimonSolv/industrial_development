import UIKit

final class ModuleFactory {

    typealias Presenter = ModulePresenter

//    let model: ModelScenario
//    weak var coordinator: CoordinatorProtocol?
    
//    init(model: ModelScenario) {
//        self.model = model
//    }
    static func makeLoginModule() -> LoginModule {
        let input = LoginViewModel(logic: true)
        let output = LoginViewModel(logic: true)
        let view = LoginViewController(output: output)
      //  presenter.viewInput = view
        return LoginModule(input: input, output: output, view: view)
    }
    
    func makePresenterModule() -> (presenter: Presenter, view: UIViewController) {
        let presenter = ModulePresenter()
        let controller = PresenterModuleController(output: presenter)
        presenter.viewInput = controller

        return (presenter, controller)
    }

    static func makeFeedModule() -> FeedModule {
        let input = FeedViewModel(logic: true)
        let output = FeedViewModel(logic: true)
        let view = FeedViewController(output: output)
      //  presenter.viewInput = view
        return FeedModule(input: input, output: output, view: view)
    }

//    func makeSecondModule(dataSource: ModelScenario.DataSource) -> SecondViewController {
//        return SecondViewController(dataSource: dataSource)
//    }
    
    func makePostModule() -> UIViewController {
        let model = PostModel()
        let presenter = PostPresenter()
        let vc = PostViewController(model: model, presenter: presenter)
        return vc
    }

}

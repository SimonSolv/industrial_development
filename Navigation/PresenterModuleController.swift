import UIKit

protocol PresenterModuleControllerInput: AnyObject {
    func update(with element: String)
}

protocol PresenterModuleControllerOutput: AnyObject {
    func didSelectElement(_ element: String)
}


final class PresenterModuleController: UIViewController {
    
    private enum Constants {
        static let cellId = "cellId"
    }
    
    private var dataSource: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let output: PresenterModuleControllerOutput
    
    init(output: PresenterModuleControllerOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellId)
        tableView.dataSource = self
        tableView.delegate = self
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PresenterModuleController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        
        return cell
    }
}

extension PresenterModuleController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectElement(dataSource[indexPath.row])
    }
}

extension PresenterModuleController: PresenterModuleControllerInput {
    func update(with element: String) {
        dataSource.append(element)
    }
}

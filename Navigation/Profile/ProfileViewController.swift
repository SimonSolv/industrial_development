import UIKit

class ProfileViewController: UIViewController{
    static let identifier = "ProfileViewController"
    public var user: User?
    public var streamData: User? = nil
    init (user: User?){
        self.user = user
        streamData = self.user
        ProfileHeaderView().selectedUser = streamData
        print (ProfileHeaderView().selectedUser?.name ?? "Code7")
        print (streamData?.name ?? "Code01")
        print (self.user?.name ?? "Code00")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let tableView: UITableView = {
        var table = UITableView()
        table.frame = .zero
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let cellID = "CellID"
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   //     print (user?.name ?? "NoNameProfileVC")
        view.backgroundColor = .lightGray
        setupTableView()
        setupConstraints()
    }
    func setUser(user: User, view: ProfileHeaderView) {
        view.avatarImageView.image = user.avatar
        view.fullNameLabel.text = user.name
        view.statusLabel.text = user.status
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupConstraints() {
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func openGallery() {
        let vc = GalleryViewController()
        navigationController?.pushViewController(vc, animated: true)
        //navigationController?.navigationBar.isHidden = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Post" else { return }
        guard let destination = segue.destination as?  PostViewController else { return }
        destination.title = "Post222"

    }

}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostStorage.tableModel[section].body.count + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return PostStorage.tableModel.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ProfileHeaderView()
        setUser(user: user!, view: view)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? PostTableViewCell
        cell?.post = PostStorage.tableModel[indexPath.section].body[indexPath.row - 1]
        return cell!
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return PostStorage.tableModel[section].footer
    }
}


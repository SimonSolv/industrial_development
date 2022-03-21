import UIKit

class ProfileViewController: UIViewController {
    
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
        view.backgroundColor = .lightGray
        setupTableView()
        setupConstraints()
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
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }

    }
    
    @objc func openGallery() {
        let vc = GalleryViewController()
        vc.photos = PhotosTableViewCell().photoSource
        navigationController?.pushViewController(vc, animated: true)
        PhotosTableViewCell().photosPublisher.rechargeImageLibrary()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Post" else { return }
        guard segue.destination is PostViewController else { return }
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
        return PostStorage.tableModel[section].sectionHeader
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

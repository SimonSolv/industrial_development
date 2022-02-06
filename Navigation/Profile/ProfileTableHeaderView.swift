
import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    let profileHeader: ProfileHeaderView = {
        let view = ProfileHeaderView()
   //     view.selectedUser = UserStorage().userCurrent
   //     print (view.selectedUser?.name ?? "Code1")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
}
extension ProfileTableHeaderView {
    
    private func setupViews() {
        
        contentView.addSubview(profileHeader)
   
        let constraints = [
            
            profileHeader.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeader.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

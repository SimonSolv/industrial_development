import UIKit
import SnapKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    let profileHeader = ProfileHeaderView()
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
        
//        contentView.snp.makeConstraints { make in
//            make.trailing.leading.equalToSuperview()
//            
//        }
        
        profileHeader.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

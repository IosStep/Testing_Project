import UIKit

class NameTableViewCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var dateLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "location")?.withTintColor(.green)
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    

    func setUp() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(iconImageView)
        
        nameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(12)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.bottom.leading.equalToSuperview().inset(12)
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(12)
            make.width.height.equalTo(40)
        }
    }
    
    func configure() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

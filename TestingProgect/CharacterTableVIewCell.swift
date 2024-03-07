import UIKit
import SnapKit

class CharacterTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CharacterCell"
    
    let nameLabel = UILabel()
    let surnameLabel = UILabel()
    let houseLabel = UILabel()
    let wandLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(surnameLabel)
        addSubview(houseLabel)
        addSubview(wandLabel)
        
        // Customize label properties
        // Add any additional customization you want
        
        // Example:
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
        }
        
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel)
        }
        
        houseLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        wandLabel.snp.makeConstraints { make in
            make.top.equalTo(houseLabel.snp.bottom).offset(5)
            make.right.equalTo(houseLabel)
        }
    }
    
    func configure(_ model: HarryPotterCharacter) {
        
        nameLabel.text = model.name
        surnameLabel.text = model.surname
        houseLabel.text = model.house
        wandLabel.text = model.wand
        
        // Set background color according to house
        switch model.house {
        case "Gryffindor":
            backgroundColor = UIColor.red.withAlphaComponent(0.2)
        case "Slytherin":
            backgroundColor = UIColor.green.withAlphaComponent(0.2)
        case "Ravenclaw":
            backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        case "Hufflepuff":
            backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        default:
            backgroundColor = UIColor.white
        }
        
    }
}

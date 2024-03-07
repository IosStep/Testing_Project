import UIKit
import SnapKit

class CharacterDetailViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }
    
    
    func configure(_ model: HarryPotterCharacter) {
        nameLabel.text = model.name
    }

}

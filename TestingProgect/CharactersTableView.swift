import UIKit
import SnapKit

class CharactersTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let characters: [HarryPotterCharacter] = Data.characters

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier, for: indexPath) as! CharacterTableViewCell
        
        let character = characters[indexPath.row]
        
        cell.configure(character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = characters[indexPath.row]
        
        let vc = CharacterDetailViewController()
        vc.configure(object)
        navigationController?.pushViewController(vc, animated: true)
    }
}

struct HarryPotterCharacter {
    let name: String
    let surname: String
    let house: String
    let wand: String
    // You can add more parameters as needed

    init(name: String, surname: String, house: String, wand: String) {
        self.name = name
        self.surname = surname
        self.house = house
        self.wand = wand
        // Initialize more parameters here if necessary
    }
}


class Data {
    static let characters = [
        HarryPotterCharacter(name: "Harry", surname: "Potter", house: "Gryffindor", wand: "Holly, 11', phoenix feather core"),
        HarryPotterCharacter(name: "Hermione", surname: "Granger", house: "Gryffindor", wand: "Vine, 10 ¾', dragon heartstring core"),
        HarryPotterCharacter(name: "Ron", surname: "Weasley", house: "Gryffindor", wand: "Willow, 14', unicorn hair core"),
        // Add more characters here
        HarryPotterCharacter(name: "Albus", surname: "Dumbledore", house: "Gryffindor", wand: "Elder, 15', thestral tail hair core"),
        HarryPotterCharacter(name: "Severus", surname: "Snape", house: "Slytherin", wand: "Yew, 13 ½', phoenix feather core"),
        HarryPotterCharacter(name: "Minerva", surname: "McGonagall", house: "Gryffindor", wand: "Fir, 9 ½', dragon heartstring core"),
        HarryPotterCharacter(name: "Draco", surname: "Malfoy", house: "Slytherin", wand: "Hawthorn, 10', unicorn hair core"),
        HarryPotterCharacter(name: "Luna", surname: "Lovegood", house: "Ravenclaw", wand: "Cherry, 14', unicorn hair core"),
        HarryPotterCharacter(name: "Neville", surname: "Longbottom", house: "Gryffindor", wand: "Cherry, 13', unicorn hair core"),
        HarryPotterCharacter(name: "Ginny", surname: "Weasley", house: "Gryffindor", wand: "Yew, 9', phoenix feather core"),
        HarryPotterCharacter(name: "Sirius", surname: "Black", house: "Gryffindor", wand: "Mahogany, 16', unknown core"),
        HarryPotterCharacter(name: "Remus", surname: "Lupin", house: "Gryffindor", wand: "Cypress, 10 ¼', unicorn hair core"),
        HarryPotterCharacter(name: "Bellatrix", surname: "Lestrange", house: "Slytherin", wand: "Walnut, 12 ¾', dragon heartstring core"),
        HarryPotterCharacter(name: "Lucius", surname: "Malfoy", house: "Slytherin", wand: "Elm, 18', dragon heartstring core"),
        HarryPotterCharacter(name: "Rubeus", surname: "Hagrid", house: "Gryffindor", wand: "Oak, 16', unknown core")
    ]
}

import UIKit

class TableViewViewController: UIViewController {
    
    let students = [
    Student(name: "Akmaral", dateOfBirth: "1995-07-12", icon: "person.crop.circle.fill"),
    Student(name: "Nurdaulet", dateOfBirth: "1987-02-28", icon: "person.circle.fill"),
    Student(name: "Amir", dateOfBirth: "1990-11-05", icon: "person.circle"),
    Student(name: "Alisher", dateOfBirth: "1983-09-18", icon: "person.crop.circle"),
    Student(name: "Nurali", dateOfBirth: "1998-03-23", icon: "person.crop.circle.fill"),
    Student(name: "Bekarys", dateOfBirth: "1981-12-06", icon: "person.circle"),
    Student(name: "Nadir", dateOfBirth: "1985-05-20", icon: "sun.min"),
    Student(name: "Nursultan", dateOfBirth: "1992-08-14", icon: "person.crop.circle.fill"),
    Student(name: "Bakhtiyar", dateOfBirth: "1996-04-30", icon: "figure.australian.football"),
    Student(name: "Chingiz", dateOfBirth: "1989-10-09", icon: "person.circle.fill"),
    Student(name: "Amir", dateOfBirth: "1986-06-17", icon: "person.circle"),
    Student(name: "Marlen", dateOfBirth: "1984-01-25", icon: "swirl.circle.righthalf.filled")
]
    

    lazy var namesTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")
//        table.backgroundColor = .lightGray
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        namesTableView.reloadData()
    }
    
    func setUp() {
        view.addSubview(namesTableView)
        namesTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
   
}


extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    var name: String {
        return "some name"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "Some text"
//        cell.textLabel?.text = names[indexPath.row]
//        return cell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as? NameTableViewCell else { return UITableViewCell() }
        
        cell.dateLabel.text = students[indexPath.row].dateOfBirth
        cell.nameLabel.text = students[indexPath.row].name
        cell.iconImageView.image = UIImage(systemName: students[indexPath.row].icon)?.withTintColor(.red)
        return cell
    }

}

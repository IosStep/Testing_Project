import UIKit

class TableViewViewController: UIViewController {
    
    let storageManager = UserDefaultsManager.shared
    var isFiltered = false
    
    lazy var filteredStudent = students {
        didSet {
            namesTableView.reloadData()
        }
    }
    
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
    
    lazy var nameTextField: UITextField = {
       let textfield = UITextField()
        textfield.placeholder = "insert Name"
        textfield.addTarget(self, action: #selector(newValueInserted), for: .allEditingEvents)
        return textfield
    }()

    lazy var favouriteButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "star")?.withTintColor(.yellow)
        button.target = self
        button.action = #selector(favoriteTapped)
        return button
    }()
    
    lazy var namesTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        namesTableView.reloadData()
    }
    
    func setUpViews() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = favouriteButton
        view.addSubview(nameTextField)
        view.addSubview(namesTableView)
        
        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        namesTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom)
        }
    }
    
    @objc func favoriteTapped () {
        let favorites: Set<String> = Set(storageManager.getStudents())
        if isFiltered {
            filteredStudent = students
        }else {
            filteredStudent = students.filter({ favorites.contains($0.name) })
        }
        isFiltered.toggle()
    }
    
    @objc func newValueInserted(sender: UITextField) {
        guard let text = sender.text, !text.isEmpty else {
            filteredStudent = students
            return }
        filteredStudent = students.filter({ $0.name.contains(text) })
    }
    
    
    private func addStudentToFavorites(_ student: Student) {
        storageManager.saveStudent(student)
    }
   
}


extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    var name: String {
        return "some name"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as? NameTableViewCell else { return UITableViewCell() }
        
        cell.dateLabel.text = filteredStudent[indexPath.row].dateOfBirth
        cell.nameLabel.text = filteredStudent[indexPath.row].name
        cell.iconImageView.image = UIImage(systemName: filteredStudent[indexPath.row].icon)?.withTintColor(.red)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
          let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") { (action, view, completionHandler) in
//              guard let self = self else { return }
              
              let student = self.filteredStudent[indexPath.row]
              self.addStudentToFavorites(student)
              
              completionHandler(true)
          }
        
          favoriteAction.backgroundColor = .systemYellow
          favoriteAction.image = UIImage(systemName: "star.fill")
          
          let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
          swipeConfiguration.performsFirstActionWithFullSwipe = false
        
          return swipeConfiguration
      }

}

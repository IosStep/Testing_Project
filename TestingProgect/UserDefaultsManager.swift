import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    func saveStudent(_ student: Student) {

        if var students = UserDefaults.standard.array(forKey: "Students") {
            students.append(student.name)
            UserDefaults.standard.setValue(students, forKey: "Students")
        }else {
            UserDefaults.standard.setValue([student.name], forKey: "Students")
        }
    }
    
    func getStudents() -> [String] {
        let students = UserDefaults.standard.array(forKey: "Students") as! [String]
        print(students)

        return students
    }
}

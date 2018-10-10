
import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    var DTPicker = UIDatePicker()
    var Dob = Date()
    var today = Date()
    var finalage:Int?
    
    @IBOutlet weak var txt1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       date_picker()
    }

 
    
    func date_picker() {
        DTPicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        DTPicker.datePickerMode = .date
        
        txt1.inputView = DTPicker
        DTPicker.addTarget(self, action: #selector(self.test), for: .valueChanged)
    }
    
    @objc func test(sender:UIDatePicker)
    {
        Dob = DTPicker.date
        let format = DateFormatter()
        
        format.dateFormat = "dd-MM-YYYY"
        txt1.text = format.string(from: Dob)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func AgeCalculater()
    {
        let calancer = NSCalendar(calendarIdentifier: .indian)
        let calage = calancer?.components([.year],from: Dob, to: today, options: [])
        //let calage1 = calancer?.components([.day,.month,.year],from: Dob, to: today, options: [])
        
       let age = [calage?.year!]
       
        finalage = age[0]
        //let age1 = [calage?.day,calage?.month,calage?.year]
        
    }
    
    @IBAction func login_btn(_ sender: Any) {
         AgeCalculater()
        print(finalage!)
      let age = finalage!
        
        if age >= 18 {
            print("ok");
        }
        
        else{
            print("invalid is age");
        }
        
    }

}


import Foundation

/*
 What is delegate?
 Delegation is a design pattern that enables a class to hand off (or “delegate”) some of its responsibilities to an instance of another class.

 Ex.
 Whenever a person enters into a room, room should say hi with person name
 
 */

//Person class
protocol PersonDelegate{
    func enterIntoRoom(person:Person)
}

class Person{
    var name:String
    var id:Int
    var delegate:PersonDelegate?
    init(name:String,id:Int) {
        self.name = name
        self.id = id
    }
    func details() {
        print("My Name \(self.name) and my id is \(self.id)")
    }
    func enterIntoRoom() {
        delegate?.enterIntoRoom(person: self)
    }
}

//Room class

class Room:PersonDelegate{
    var name:String = ""
    func enterIntoRoom(person: Person) {
        print("Hi \(person.name) you entered into \(self.name)")
    }
}

var room:Room = Room()
room.name = "Living room"
var person:Person = Person(name: "Ravi", id: 1)
person.details()
person.delegate = room
person.enterIntoRoom()



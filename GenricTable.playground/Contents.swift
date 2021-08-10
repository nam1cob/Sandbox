import UIKit
import Foundation

enum Country {
    case India
}

struct Player {
    let firstName : String
    let lastName : String
    let age : Int
}

struct Team {
    let players : [Player]
}





//https://khawerkhaliq.com/blog/swift-associated-types-self-requirements/


// Swift do not consider the protocol with the assosiated type as firt-class type
// i.e. they cannot be used as
// 1. type of variable/constant
// 2. elements of collection
// 3. function pram or return type.


protocol AutoMarkableQuestion {
    associatedtype Answer: Equatable
    var statement: String { get set }
    var correctAnswer: Answer { get set }
    func isCorrect(answer: Answer) -> Bool
}


extension AutoMarkableQuestion {
    func isCorrect(answer: Answer) -> Bool {
        answer == correctAnswer
    }
}

enum TrueFalseAnswer {
    case t, f
}

enum MultipleChoiceAnswer {
    case a, b, c, d
}

struct TrueFalseQuestion: AutoMarkableQuestion {
    var statement: String
    var correctAnswer: TrueFalseAnswer
    
}

struct MultipleChoiceQuestion : AutoMarkableQuestion {
    var statement: String
    var correctAnswer: MultipleChoiceAnswer
}


let tfQ = TrueFalseQuestion(statement: "Statement 1", correctAnswer: .t)
let mcQ = MultipleChoiceQuestion(statement: "Statement 2" , correctAnswer: .c)


print(tfQ.isCorrect(answer: .f))
print(tfQ.isCorrect(answer: .t))

print(mcQ.isCorrect(answer: .a))
print(mcQ.isCorrect(answer: .c))

// But the point to using the protocol is to be able to treat question at an abstact level
// so the we can use the question without having to know the actual type of each question



// let question : AutoMarkableQuestion = tfQ <- This will lead to compiler error.
// let questions : [AutoMarkableQuestion] =[tfQ, mcQ]

// This is not limitation of Swift.
// It simply means AutoMarkableQuestion is aincomplet and protocol type does not provide sufficent info about the instance on conforming type.



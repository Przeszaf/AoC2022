// Copyright © 2022 xDesign. All rights reserved.

import Foundation

print("Hello, World!")

let strings = data
    .split(separator: "\n")
    .map { String($0) }
    .map { str in
        let firstString = str.dropFirst(str.count / 2)
        let secondString = str.dropLast(str.count / 2)
        return [firstString, secondString]
    }

let strings2 = data
    .split(separator: "\n")
    .map { String($0) }
    
let commonChars = strings.map { arr in
    for char in arr[0] {
        if arr[1].contains(char) {
            return char
        }
    }
    fatalError()
}

let priorityMap: (Character) -> Int = { char in
    if char.isUppercase {
        return Int(char.unicodeScalars.first!.value - 38)
    } else {
        return Int(char.unicodeScalars.first!.value - 96)
    }
}
let priority = commonChars.map(priorityMap)

let prioritySum = priority.reduce(0, +)

print(prioritySum)

var groupPriorities = [Int]()
for i in stride(from: 0, to: strings2.count, by: 3) {
    for char in strings2[i] {
        if strings2[i+1].contains(char) && strings2[i+2].contains(char) {
            groupPriorities.append(priorityMap(char))
            break
        }
    }
}

let groupPrioritiesSum = groupPriorities.reduce(0, +)
print(groupPrioritiesSum)

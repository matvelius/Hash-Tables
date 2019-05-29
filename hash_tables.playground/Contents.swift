import UIKit

var str = "ABC"

func naiveHash(_ string: String) -> Int {
    let unicodeScalars = string.unicodeScalars.map { Int($0.value) }
    return unicodeScalars.reduce(0, +)
}

// sourced from https://gist.github.com/kharrison/2355182ac03b481921073c5cf6d77a73#file-country-swift-L31
func djb2Hash(_ string: String) -> Int {
    let unicodeScalars = string.unicodeScalars.map { $0.value }
    return unicodeScalars.reduce(5381) {
        ($0 << 5) &+ $0 &+ Int($1)
    }
}

naiveHash(str)
djb2Hash(str)

//////////////////


var hashTable = HashTable<String, String>(capacity: 5)

// adding a name
hashTable["firstName"] = "Steve"

// lookup
if let firstName = hashTable["firstName"] {
    print(firstName)
}

if let lastName = hashTable["lastName"] {
    print(lastName)
} else {
    print("lastName key not in hash table")
}

// removing an item
hashTable["firstName"] = nil

if let firstName = hashTable["firstName"] {
    print(firstName)
} else {
    print("firstName key is not in the hash table")
}

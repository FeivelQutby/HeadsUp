//
//  Shuffler.swift
//  HeadsUp
//
//  Created by Feivel Qutby on 25/03/26.
//


import Foundation

struct Shuffler {
    static func shuffle(_ songs: [Song]) -> [Song] {
        var array = songs
        var seed = UInt64(Date().timeIntervalSince1970 * 1000)
        
        for i in stride(from: array.count - 1, through: 1, by: -1) {
            seed ^= seed << 13
            seed ^= seed >> 7
            seed ^= seed << 17
            let j = Int(seed % UInt64(i + 1))
            array.swapAt(i, j)
        }
        return array
    }
}

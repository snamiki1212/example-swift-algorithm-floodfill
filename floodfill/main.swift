//
//  main.swift
//  floodfill
//
//  Created by shunnamiki on 2021/08/16.
//

import Foundation


//print(question1())

func question2() -> Int {
    // helpers
    struct Point { let x: Int; let y: Int }
    let directions = [
        [-1, 0], // left
        [ 1, 0], // right
        [0, -1], // front
        [0,  1], // back
    ]
    
    // inputs
    let N = Int(readLine()!)!
    var country = [[Int]](repeating: [], count: N)
    var colored = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    for h in 0..<N {
        country[h] = readLine()!.split(separator: " ").map { Int($0)! }
    }

    func mutColor(x: Int, y: Int, color: Int, country: [[Int]], colored: inout [[Int]], visited: inout[[Bool]]){
        let q = Queue<Point>()
        q.enqueue(item: Point(x: x, y: y))
        visited[y][x] = true
        colored[y][x] = color
        while !q.isEmpty() {
            let p = q.dequeue()!
            for set in directions {
                let nx = set[0] + p.x
                let ny = set[1] + p.y
                let isInCountry = nx >= 0 && nx < N && ny >= 0 && ny < N
                if !isInCountry { continue }
                if country[ny][nx] == 0 { continue }
                if visited[ny][nx] { continue }
                colored[ny][nx] = color
                visited[ny][nx] = true
                q.enqueue(item: Point(x: nx, y: ny))
            }
        }
    }
    
    func mutCandidates(point: Point, colored: [[Int]], distances: [[Int]], visited: inout [[Bool]], adj: inout[Int]) {
        let thisColor = colored[point.y][point.x]
        visited[point.y][point.x] = true
        let q = Queue<Point>()
        q.enqueue(item: point)
        while !q.isEmpty() {
            let current = q.dequeue()!
            let x = current.x
            let y = current.y
            for set in directions {
                let nx = set[0] + x
                let ny = set[1] + y
                
                // guard
                let isInCountry = nx >= 0 && nx < N && ny >= 0 && ny < N
                if !isInCountry { continue }
                if visited[ny][nx] { continue }
                
                // case: same island
                if thisColor == colored[ny][nx] {
                    visited[ny][nx] = true
                    q.enqueue(item: Point(x: nx, y: ny))
                    continue
                }
                
                // case: ocean
                visited[ny][nx] = true
                adj.append(distances[ny][nx])
            }
        }
    }
    
    func mutDistances(point: Point, colored: [[Int]], distances: inout [[Int]], visited: inout [[Bool]]) {
        let thisColor = colored[point.y][point.x]
        let q = Queue<Point>()
        q.enqueue(item: point)
        while !q.isEmpty() {
            let current = q.dequeue()!
            let x = current.x
            let y = current.y
            for set in directions {
                // next point
                let nx = x + set[0]
                let ny = y + set[1]

                // guard
                let isInCountry = nx >= 0 && nx < N && ny >= 0 && ny < N
                if !isInCountry { continue }
                                
                // case: same islang
                if colored[ny][nx] == thisColor && !visited[ny][nx] {
                    visited[ny][nx] = true
                    q.enqueue(item: Point(x: nx, y: ny))
                    continue
                }
                
                // case: ocean
                if colored[ny][nx] == 0 {
                    let isFirstTime = !visited[ny][nx]
                    let shouldUpdate = visited[ny][nx] && distances[ny][nx] > distances[y][x] + 1
                    if isFirstTime || shouldUpdate {
                        visited[ny][nx] = true
                        distances[ny][nx] = distances[y][x] + 1
                        q.enqueue(item: Point(x: nx, y: ny))
                        continue
                    }
                    continue;
                }
                
                // case: another island
                visited[ny][nx] = true
                continue;
            }
        }
    }
    
    // 1. Get island map.
    var color = 1;
    var startPoints = [Point]()
    for y in 0..<N {
        for x in 0..<N {
            if country[y][x] == 1 && colored[y][x] == 0 {
                var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
                visited[y][x] = true
                mutColor(x: x, y: y, color: color, country: country, colored: &colored, visited: &visited)
                color += 1
                startPoints.append(Point(x: x, y: y))
            }
        }
    }

    // 2.lands len have to be more than equall 2
    if color <= 2 {
        print("Error: Invalid number of island. Island should be more than equal 2.")
        return -1
    }

    // 3. get shortest distances from one land to another land
    // - Combination, not permutation
    // - Create distances from X island to all ocean cell.
    // - Search shortest num from adjenct cell having above distances for each island except for X island
    var shortest = Int.max
    for i in 0..<startPoints.count {
        var distances = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
        mutDistances(point: startPoints[i], colored: colored, distances: &distances, visited: &visited)
        
        for j in 0..<startPoints.count where j != i {
            var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
            var candidates = [Int]();
            mutCandidates(point: startPoints[j], colored: colored, distances: distances, visited: &visited, adj: &candidates)
            shortest = min(shortest, candidates.min()!)
        }
    }
    return shortest
}

print(question2())

let vec1 = Vector3(x: 1, y: 2, z: 3)
let vec2 = Vector3(x: 1.5, y: 2, z: 3.1415926535)

print("-vec1 =       " + (-vec1).tos())
print("vec1 + vec2 = " + (vec1 + vec2).tos())
print("vec1 - vec2 = " + (vec1 - vec2).tos())
print("vec1 * 2 =    " + (vec1 * 2).tos())
print("vec1 * vec2 = " + (vec1 * vec2).tos())
print("vec1 / 2 =    " + (vec1 / 2).tos())
print("vec1 / vec2 = " + (vec1 / vec2).tos())
print("vec1・vec2 =  " + String(vec1.dot(vec2)))
// print("" + Vector3(x: 1, y: 0, z: 0).cross(Vector3(x: 0, y: 1, z: 0)).tos())
print("vec1 × vec2 = " + vec1.cross(vec2).tos())
print("|vec1| =      " + String(vec1.magnitude()))
print("vec1/|vec1| = " + vec1.normalize().tos())

// Image.output(array: [[1, 2, 3], [4, 5, 6], [7, 8, 9]], dir: "./output")

func floatToUInt8(_ n: Float) -> UInt8 {
	return UInt8(min(max(n, 0), 255))
}
func vec3ToColor(_ vec: Vector3) -> [UInt8] {
	// let v: Vector3 = vec.normalize()
	return [floatToUInt8(vec.x), floatToUInt8(vec.y), floatToUInt8(vec.z)]
}

let width: Int = 256
let height: Int = 256

var arr: [[Vector3]]
arr = Array(repeating: Array(repeating: Vector3(x: 0, y: 0, z: 0), count: width), count: height)
for var x in 0 ... 255 {
	for var y in 0 ... 255 {
		arr[y][x] = Vector3(x: Float(x), y: Float(y), z: Float(255))
	}
}

Image.output(array: arr, f: vec3ToColor, dir: "./output")

import Foundation

public class Vector3 {
	var x: Float
	var y: Float
	var z: Float
	var normalized: Vector3 {
		get {
			return self.normalize()
		}
	}
	var norm: Float {
		get {
			return self.magnitude()
		}
	}
	public init(x: Float, y: Float, z: Float) {
		self.x = x
		self.y = y
		self.z = z
	}
	public prefix static func -(right: Vector3) -> Vector3 {
		return Vector3(x: -right.x, y: -right.y, z: -right.z)
	}
	public static func +(left: Vector3, right: Vector3) -> Vector3 {
		return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
	}
	public static func -(left: Vector3, right: Vector3) -> Vector3 {
		return Vector3(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z)
	}
	public static func *(left: Vector3, right: Float) -> Vector3 {
		return Vector3(x: left.x * right, y: left.y * right, z: left.z * right)
	}
	public static func *(left: Vector3, right: Vector3) -> Vector3 {
		return Vector3(x: left.x * right.x, y: left.y * right.y, z: left.z * right.z)
	}
	public static func /(left: Vector3, right: Float) -> Vector3 {
		return Vector3(x: left.x / right, y: left.y / right, z: left.z / right)
	}
	public static func /(left: Vector3, right: Vector3) -> Vector3 {
		return Vector3(x: left.x / right.x, y: left.y / right.y, z: left.z / right.z)
	}
	public func tos() -> String {
		return "Vector3(" + String(self.x) + ", " + String(self.y) + ", " + String(self.z) + ")"
	}
	public func dot(_ vec: Vector3) -> Float {
		return self.x * vec.x + self.y * vec.y + self.z * vec.z
	}
	public func cross(_ vec: Vector3) -> Vector3 {
		return Vector3(x: self.y * vec.z + self.z * vec.y, y: self.z * vec.x + self.x * vec.z, z: self.x * vec.y + self.y * vec.x)
	}
	public func sq_magnitude() -> Float {
		return self.dot(self)
	}
	public func magnitude() -> Float {
		return sqrt(self.sq_magnitude())
	}
	public func normalize() -> Vector3 {
		let mag: Float = self.magnitude()
		return Vector3(x: self.x / mag, y: self.y / mag, z: self.z / mag)
		// return nVector3(self)
	}
	public func equals(_ vec: Vector3) -> Bool {
		if(self.x == vec.x && self.y == vec.y && self.z == vec.z) {
			return true
		} else {
			return false
		}
	}
}

// public class nVector3 : Vector3 {
// 	var x: Float
// 	var y: Float
// 	var z: Float
// 	public override init(x: Float, y: Float, z: Float) {
// 		let mag: Float = Vector3(x, y, z).magnitude()
// 		self.x = x / mag
// 		self.y = y / mag
// 		self.z = z / mag
// 	}
// 	public override init(vector: Vector3) {
// 		let mag: Float = vector.magnitude()
// 		self.x = vector.x / mag
// 		self.y = vector.y / mag
// 		self.z = vector.z / mag
// 	}
// 	public func tos() -> String {
// 		return "nVector3(" + String(self.x) + ", " + String(self.y) + ", " + String(self.z) + ")"
// 	}
// }

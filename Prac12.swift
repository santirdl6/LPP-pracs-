//Ejercicio 1
//a)
/*
protocol A {
    var a: String {get}
    func foo(a: String) -> String?
}
protocol B {
    mutating func bar()
}
struct MiStruct: A, B {
    var b: Int
    var a: String {
        return "Hola"
    }

    func foo(a: String)-> String? {
        if a == self.a {
            return a
        }else {
            return nil
        }
    }
    mutating func bar() {
        b = 2
    }

}
*/
// b)
/*
protocol A {
    var a: Int {get set}
    func foo(a: Int, b: Int) -> Int
}

protocol B {
    mutating func bar()
}
*/
/*
struct MiStruct: A, B {
    var a: Int {
        get{
            return 10
        }
        set{
            print("Hemos cambiado a")
        }
    }
    func foo(a: Int, b: Int) -> Int {
        let res: Int = a > 10 ? a: b
        return res
    }
    mutating func bar() {
        a = 15
    }
}






//c)
/*
struct Equipo: Equatable {
    let puntos: Int
    let nombre: String
}

let equipo1 = Equipo(puntos: 10, nombre: "Hércules")
let equipo2 = Equipo(puntos: 8, nombre: "Villareal")
print(equipo1 == equipo2) // imprime false
*/
*/


struct Equipo: Comparable {
    let puntos: Int
    let nombre: String

    static func < (equipo1: Equipo, equipo2: Equipo)-> Bool {
        if equipo1.puntos < equipo2.puntos {
            return true
        }else if equipo1.puntos == equipo2.puntos {
            if equipo1.nombre < equipo2.nombre {
                return true
            }else {
                return false
            }
        } else {
            return false
        }
    }
}
let equipo1 = Equipo(puntos: 8, nombre: "Hércules")
let equipo2 = Equipo(puntos: 8, nombre: "Villareal")

print(equipo1 > equipo2) // imprime true

let equipo3 = Equipo(puntos: 7, nombre: "Real Madrid")

var equipos = [equipo1, equipo2, equipo3].sorted()

print(equipos)

//Ejercicio 2


struct Cuadrado {
    var lado: Double
}

// Completa el código justo a continuación,
// no puedes modificar el código anterior

extension Cuadrado {
    var area: Double {
        return lado * lado
    }
    
}

var cuadrado = Cuadrado(lado: 4.0)
print(cuadrado.area) // Imprime: 16.0
cuadrado.lado = 10.0
print(cuadrado.area) // Imprime: 100.0



//b)

protocol Persona {
    var nombre: String {get}
    func encantada() -> Persona 
    func refrescada() -> Persona 
}

enum Pocion {
    case magica, refrescante, venenosa

    func esBebida(por persona: Persona) -> Persona? {
        switch self{
            case .magica:
                return persona.encantada()
            case .refrescante:
                return persona.refrescada()
            default:
                return nil
        }
    }
}

//c)
protocol A {
    var valor: Int {get set}
    func foo(a: Int) -> Int
}
protocol B {
    mutating func bar()
}
struct MiStruct: A, B {
    var valor: Int {
        get {
           return 10 
        }
        set{
            print("Modificamos a")
        }
    } 

    func foo(a: Int)-> Int {
        if valor > a {
            return a
        } else {
            return valor
        }
    }
    mutating func bar() {
        valor += 10
    }

}

//d)
/*
struct Circulo {
    var radio: Double
    // Completa el código
    static func + (circ1: Circulo, circ2: Circulo)-> Circulo{
        let circ = Circulo(radio: circ1.radio + circ2.radio)
        return circ
    }

}

let c1 = Circulo(radio: 5.0)
let c2 = Circulo(radio: 10.0)
let c3 = c1 + c2
print("El radio de la suma es: \(c3.radio)")
// Imprime: El radio de la suma es: 15.0

*/
//Ejercicio 3

protocol P {
   var p: Int { get }
}
class A1: P {
   var p = 0
   var a1 = 0
}
class A2: P {
   var p = 1
   var a2 = 0
}

var array: [P] = [A1(), A2()]
for i in array {
    if let ob1 = i as? A1  {
        print("p: \(ob1.p), a1 \(ob1.a1)")
    } else if let ob2 = i as? A2 {
        print("p: \(ob2.p), a2 \(ob2.a2)")
    }
   // Código a completar
   //
}

// debe imprimir:
// debe imprimir:
// p: 0, a1: 0
// p: 1, a2: 0


//b)
protocol TieneVelocidad {
    func velocidadActual () -> Double
}

class Vehiculo {
    var velocidad = 0.0
    func velocidadActual() -> Double {
        return velocidad
    }
}

class Tren {
    static let velocidadEnMarcha = 300.0
    var pasajeros = 0
    var enMarcha = false
}

//
// Código a completar
//
extension Vehiculo: TieneVelocidad{}
extension Tren: TieneVelocidad{
    func velocidadActual()->Double {
        return Tren.velocidadEnMarcha
    }
}

var vehiculo1 = Vehiculo()
var tren1 = Tren()
tren1.enMarcha = true

let transportes: [TieneVelocidad] = [vehiculo1, tren1]

for i in transportes {
    print(i.velocidadActual())
}
// 0.0
// 300.0

//Ejercicio 4

struct Timer {
    var segundos: Int
    static var pasosTotales = 0 
    mutating func paso(){
        segundos -= 1
        Timer.pasosTotales += 1
    }

    static func + (tim1: Timer, tim2: Timer)-> Timer {
        let tim = Timer(segundos: tim1.segundos + tim2.segundos)
        return tim
    }

}

var t1 = Timer(segundos: 10)
var t2 = Timer(segundos: 5)
for _ in 0...4 {
    t1.paso()
}
for _ in 0...2 {
    t2.paso()
}
var t3 = t1 + t2
t3.paso()
print("Segundos del temporizador 1: \(t1.segundos)")
print("Segundos del temporizador 2: \(t2.segundos)")
print("Segundos del temporizador 3: \(t3.segundos)")
print("Pasos totales: \(Timer.pasosTotales)")
// Imprime:
// Segundos del temporizador 1: 5
// Segundos del temporizador 2: 2
// Segundos del temporizador 3: 6
// Pasos totales: 9



//Ejercicio 5
import Foundation
struct Punto {
    var x = 0.0, y = 0.0
}

struct Tamaño {
    var ancho = 0.0, alto = 0.0
}

struct Circulo {
    var centro = Punto()
    var radio = 0.0

    var area: Double {
        // Propiedad calculada que devuelve el 
        // área del círculo y modifica el radio
        // cuando se actualiza
        get{
            return Double.pi * radio * radio
        }
        set{
            radio = sqrt(newValue/Double.pi)
        }

    }
}

struct Rectangulo {
    var origen = Punto()
    var tamaño = Tamaño()

    var centro: Punto {
        // Propiedad calculada que devuelve el 
        // centro del rectángulo y traslada su
        // origen cuando se modifica
         get {
            let centro = Punto(x: origen.x + tamaño.ancho / 2 , y: origen.y + tamaño.alto / 2 )
            return centro
        }
        set{
            origen = Punto(x: newValue.x - tamaño.ancho / 2 , y: newValue.y - tamaño.alto / 2)
        }
    }

    var area: Double {
        // Propiedad calculada que devuelve el
        // área del rectángulo
        return tamaño.ancho * tamaño.alto
    }
}

protocol Figura {
    var centro:Punto {get set}
    var area: Double {get}
    var tamaño: Tamaño {get}
    func descripcion()->String
}

extension Rectangulo: Figura {
    func descripcion()-> String {
        return "centro: \(self.centro), area: \(self.area)"
    }
}

extension Circulo: Figura {
    var origen: Punto {
        return Punto()
    }
    var tamaño: Tamaño {
        return Tamaño()
    }   
    func descripcion()->String {
        return "centro: \(self.centro), area: \(self.area)"
    }
}


var rect: Rectangulo = Rectangulo()
rect.centro = Punto(x: 10, y: 20)
var array12: [Figura] = [Rectangulo(), Circulo(), Rectangulo(), rect]


struct AlmacenFiguras {
    var figuras: [Figura] = []

    var numFiguras: Int {
        return figuras.count
    }

    var areaTotal: Double {
        var areas: Double = 0.0
        for figura in figuras {
            areas += figura.area
        }
        return areas
    }

    mutating func añade(figura: Figura) {
        figuras.append(figura)
    }

    func cuentaTipos() -> (Int,Int) {
        var circulos: Int = 0
        var rectangulos: Int = 0

        for figura in figuras {
            switch figura {
                case let circulo as Circulo:
                    print("Un círculo con descripción: ",circulo.descripcion())
                    circulos += 1
                case let rectangulo as Rectangulo:
                    print("Un rectangulo con tamaño \(rectangulo.tamaño) y descripción: ",rectangulo.descripcion())
                    rectangulos += 1
                default:
                    break
            }
        }
        return (rectangulos, circulos)
    }
}


var almacen: AlmacenFiguras = AlmacenFiguras()

almacen.añade(figura: rect)
almacen.añade(figura: Circulo())
almacen.añade(figura: Circulo())
almacen.añade(figura: Circulo())
almacen.añade(figura: Circulo())
almacen.añade(figura: Rectangulo())
almacen.añade(figura: Rectangulo())
almacen.añade(figura: Rectangulo())
almacen.añade(figura: Rectangulo())

almacen.cuentaTipos()




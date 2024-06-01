//Práctica 11

//Ejercicio 1

//a)
// no podemos atribuir a s1.x = 10 ya que es una estructura creada con let
struct MiEstructura {
    var x = 0
}

class MiClase {
    var x = 0
}

func foo(_ c: MiClase, _ x: Int) {
    c.x = x
}

var s1 = MiEstructura()
var s2 = s1
let c1 = MiClase()
var c2 = c1

s1.x = 10
c1.x = 10
print ("s2.x: \(s2.x), c2.x: \(c2.x)")

foo(c1, 20)
print("c1.x, después de llamar a la función: \(c1.x)")


//  b)
struct Coord {
    var x: Double
    var y: Double

    func movida(incX: Double, incY: Double) -> Coord {
        return Coord(x: x+incX, y: y+incY)
    }

    mutating func mueve(incX: Double, incY: Double) {
        x = x + incX
        y = y + incY
    }
}

struct Cuadrado {
    var esquina = Coord(x: 0.0, y: 0.0)
    var lado: Double

    func movido1(incX: Double, incY: Double, lado: Double) -> Cuadrado {
        return Cuadrado(esquina: esquina.movida(incX: incX, incY: incY), lado: lado)
    }

    mutating func movido2 (incX: Double, incY: Double, lado: Double) -> Cuadrado {
        esquina.mueve(incX: incX, incY: incY)
        return Cuadrado(esquina: esquina, lado: lado)
    }

    // Añade un método mutador mueve

    mutating func mueve(incX: Double, incY: Double) {
        esquina.x = esquina.x + incX
        esquina.y = esquina.y + incY
    }
}

//c)
//El print devolvera un array de booleanos en este caso [false, true, true]

func foo(palabra: String, longitud: Int) -> Bool {
    if palabra.count >= longitud {
        return true
    }
    else {
        return false
    } 
}

class MisPalabras {
    var guardadas: [String] = []
    func guarda(_ palabra: String) {
        guardadas.append(palabra)
    }
    var x : [Bool] {
        get {
            return guardadas.map {foo(palabra: $0,longitud: 4)}
        }
    } 
}

let palabras = MisPalabras()
palabras.guarda("Ana")
palabras.guarda("Pascual")
palabras.guarda("María")
print(palabras.x)


//Ejercicio 2

//a)

var x = 10  {
   didSet {
      if (x > 100) {
          x = oldValue
      }
   }
}

var y: Int {
    get {
        return x / 3
    }
    set {
        x = 3 * newValue
    }
}

var z : Int {
   get {
      return x + y
   }
   set {
      x = newValue / 2
      y = newValue / 2
   }
}
z = 60
print("y: \(y)") //Devuelve 30
print("x: \(x)") // Devuelve 90
z = 600
print("y: \(y)") // Devuelve 30
print("x: \(x)") // Devuelve 90

//b)

struct Valor {
    var valor: Int = 0 {
        willSet {
            Valor.z += newValue
        }        
        didSet {
            if valor > 10 {
                valor = 10
            }
        }
    }
    static var z = 0
}

var c5 = Valor()
var c7 = Valor()
c5.valor = 20
c7.valor = 8
print(c5.valor + c7.valor + Valor.z) //Devolvera 10 + 8 + 28 = 46


//Ejercicio 3
/*
Tenemos que escribir un programa que permita definir resultados de partidos de fútbol y calcular la puntuación de un conjunto de equipos una vez que se han jugado esos partidos.

Un ejemplo de ejecución del código debería ser cómo sigue:


--------------
Puntuación antes de los partidos:
Real Madrid: 0 puntos
Barcelona: 0 puntos
Atlético Madrid: 0 puntos
Valencia: 0 puntos
Athlétic Bilbao: 0 puntos
Sevilla: 0 puntos
--------------
Resultados:
Real Madrid 0 - Barcelona 3
Sevilla 1 - Athlétic Bilbao 1
Valencia 2 - Atlético Madrid 1
--------------
Puntuación después de los partidos:
Real Madrid: 0 puntos
Barcelona: 3 puntos
Atlético Madrid: 0 puntos
Valencia: 3 puntos
Athlétic Bilbao: 1 puntos
Sevilla: 1 puntos
Escribe código en Swift que permita resolver el problema, utilizando structs.

El ejercicio se puede resolver de varias formas. Te proponemos una solución con tres estructuras:

Equipo: Contiene el nombre y los puntos de un equipo y un método para actualizar las puntaciones
Partido: Nombres de los equipos y goles del partido
Liga: Contiene array de equipos y partidos jugados, así como los métodos para actualizar una jornada
Puedes usar esta propuesta, o proponer tú alguna solución alternativa.

*/
struct Equipo {
    var nombre: String
    var puntos: Int 
    
    mutating func actualizar(puntos: Int) {
        self.puntos += puntos
    }

    func info(){
        print(nombre,":" ,puntos ," puntos" )
    }
}

struct Partido {
    var equipos: (Equipo, Equipo)
    var goles: (Int, Int)

    func resultado() {
        print(equipos.0.nombre, " ", goles.0, " - ", equipos.1.nombre, " ", goles.1)
    }
}

struct Liga {
    var equipos: [Equipo]
    var partidos: [Partido]
    mutating func actualizaJornada(){
        for partido in partidos {
            if partido.goles.0 > partido.goles.1 {
                equipos[buscaEquipo(nombre: partido.equipos.0.nombre)].actualizar(puntos: 3)
            }else if partido.goles.0 <  partido.goles.1 {
                equipos[buscaEquipo(nombre: partido.equipos.1.nombre)].actualizar(puntos: 3)
            }else{
                equipos[buscaEquipo(nombre: partido.equipos.1.nombre)].actualizar(puntos: 1)
                equipos[buscaEquipo(nombre: partido.equipos.0.nombre)].actualizar(puntos: 1)
            }
        }
    }

    func buscaEquipo(nombre: String)->Int {
        var i = 0
        var bool = false

        while !bool && i < equipos.count {
            if equipos[i].nombre == nombre {
                bool = true
            }else {
                i += 1
            }
        }
        return i
    }
}

var AtleticoMadrid = Equipo(nombre: "Atlético Madrid", puntos: 0)
var Valencia = Equipo(nombre: "Valéncia",puntos: 0)
var RealMadrid = Equipo(nombre: "Real Madrid", puntos: 0)
var Barcelona = Equipo(nombre: "Barcelona", puntos: 0)
var AthleticBilbao = Equipo(nombre: "Athlétic Bilbao",puntos: 0)
var Sevilla = Equipo(nombre: "Sevilla", puntos: 0)

let partido1 = Partido(equipos: (Valencia,AtleticoMadrid), goles: (2,1))
let partido2 = Partido(equipos: (RealMadrid,Barcelona), goles: (3,0))
let partido3 = Partido(equipos: (Sevilla,AthleticBilbao), goles: (1,1))

var Liga1 = Liga(equipos: [AtleticoMadrid, Valencia, RealMadrid, Barcelona, AthleticBilbao, Sevilla],
partidos: [partido1, partido2, partido3])
/*
print("Puntuación antes de los partidos")
for equipo in Liga1.equipos {
    equipo.info()
}
print("--------------------------------")
print("Resultados:")

for partido in Liga1.partidos {
    partido.resultado()
}

print("---------------------------------")
Liga1.actualizaJornada()
print("Puntuación después de los partidos")
for equipo in Liga1.equipos {
    equipo.info()
}
*/
//Ejercicio 4

class Animal {
    var genero: String
    var edad: Int
    static var numeroAnimales: Int = 0

    init(genero: String, edad: Int) {
        self.genero = genero
        self.edad = edad
        Animal.numeroAnimales += 1
    }

    static func imprimeAnimales(){
        print(Animal.numeroAnimales)
    }

    func grunyido() {
        print("grgrrgrg")
    }
}

class Perro: Animal {
    var especie: String
    var comidaFavorita: String
    var cantidad: Int {
        get {
           return super.edad/3
        }
        set {
            super.edad = newValue * 3
        }

    }
    init(especie: String, comidaFavorita: String, genero: String, edad: Int) {
        self.especie = especie
        self.comidaFavorita = comidaFavorita
        super.init(genero: genero, edad: edad)
    }
    override var edad: Int {
        willSet(nuevaEdad) {
            print("La nueva edad es \(nuevaEdad)")
        }
    }
    override func grunyido(){
        super.grunyido()
        print("YIhaaaa")
    }
}


//¿Se puede sobreescribir el valor de una propiedad almacenada? ¿Y calculada?

let Beagle = Perro(especie: "Beagle", comidaFavorita: "Huesos", genero: "Masculino", edad: 8)
Beagle.especie = "Pastor Aleman"
Beagle.edad = 5

//Mientras las propiedades tengan la etiqueta let se puede sobreescribir el valor
print(Beagle.cantidad)
Beagle.cantidad = 5

//Para las propiedades calculadas solo se podrán sobreescribir en caso de que tengan 
// un set 

//¿Se puede añadir un observador a una propiedad de la clase base en una clase derivada?
// Si que es posible

//¿Hereda la clase derivada propiedades y métodos estáticos de la clase base?
//print(Beagle.imprimeAnimales)-> Error
//Las propiedades staticas no se heredan 

//¿Cómo se puede llamar a la implementación de un método de la clase base en una sobreescritura de ese mismo método en la clase derivada?

//Mediante la etiqueta super podemos llamar al método de la clase base
Beagle.grunyido()


//Ejercicio 5

enum MarcaCoche : Int {
    case Mercedes = 0, Ferrari, RedBull, McLaren

    static func random()->MarcaCoche {
        let max = McLaren.rawValue
        let r = Int.random(in: 0...max)

        return MarcaCoche(rawValue: r)!
    }

}

enum TipoCambio: Int {
    case Atomatico = 0, Manual
    static func random()->TipoCambio
     {
        let r = Int.random(in: 0...1)
        return TipoCambio(rawValue: r)!
    }
}

class Coche {
    var velocidadActual: Double = 0.0 
    var marcha: Int = 0
    var distanciaRecorrida: Double = 0.0
    var marca: MarcaCoche = MarcaCoche.random()
    var descripcion: String {
        return "Marca: \(marca)"
    }
    let velocidadMaxima: Double = 150.0
    let marchaMaxima: Int = 6

   
}

class CocheAutomatico: Coche {

    override var velocidadActual: Double {
        didSet {
            marcha = min(Int(velocidadActual / 25.0) + 1, 5)
            distanciaRecorrida += velocidadActual
            print("\(marca) Atomatico viajando a \(velocidadActual) kilometros por hora con la marcha \(marcha))") 
        }
    }
    override var descripcion: String{
        let descripcion = super.descripcion + "Automatico"
            return descripcion
    }
}

class CocheManual: Coche {
    override var velocidadActual: Double {
        didSet {
            distanciaRecorrida += velocidadActual
            print("\(marca) Manual viajando a \(velocidadActual) kilometros por hora con la marcha \(marcha))") 
        }
    }
    override var marcha: Int {
        didSet{
            self.velocidadActual = 25.0 * Double(marcha)
        }
    }
    override var descripcion: String {
        get{
            let descripcion = super.descripcion + "Manual"
            return descripcion
        }
    }
}

class Carrera {
    var numCoches: Int
    var horas: Int
    var coches: [Coche] = []
    
    init(numCoches: Int, horas: Int) {
        self.numCoches = numCoches
        self.horas = horas
    }

    func descripcion() {
        print(numCoches, "coches con una duración de \(horas) horas")
        var cont = 0
        while cont < numCoches {
            let cambio : TipoCambio = TipoCambio.random()
            switch cambio{
                case .Manual:
                coches.append(CocheManual())
                default:
                coches.append(CocheAutomatico())
            }
            cont += 1
        }

        for coche in coches {
            print(coche.descripcion)
        }
    }

    func empezar() {
        var cont = 1
        while cont <= horas {
            print("Horas transcurridas \(cont)")
            for coche in coches {
                if coche is CocheManual {
                    coche.marcha = Int.random(in: 1...coche.marchaMaxima)
                }else {
                    coche.velocidadActual = Double.random(in:0...coche.velocidadMaxima).rounded()
                }
            }
            cont += 1
        }
    }

    func clasificacion() {
        var cont = 0
        while cont < horas {
            if cont < self.coches.count{
                print("\(cont+1). \(self.coches[cont].descripcion) (\(self.coches[cont].distanciaRecorrida) kilómetros recorridos)")
            }
            cont += 1
        }
    }
}
let carrera = Carrera(numCoches: 2, horas: 3)
print("\nDescripción de la carrera:")
carrera.descripcion()
print("\n!!! Comienza la carrera !!!")
carrera.empezar()
print("\n!!! Clasificación !!!")
carrera.clasificacion()


  
  


//Eejercicio 6

import Foundation

struct Punto {
     var x = 0.0, y = 0.0
}

struct Tamaño {
    var ancho = 0.0, alto = 0.0
}

class Figura {
    var origen: Punto
    var tamaño: Tamaño
    var area: Double {
        return tamaño.ancho * tamaño.alto
    }
    var centro: Punto {
        get {
            let centro = Punto(x: origen.x + tamaño.ancho / 2 , y: origen.y + tamaño.alto / 2 )
            return centro
        }
        set{
            origen = Punto(x: newValue.x - tamaño.ancho / 2 , y: newValue.y - tamaño.alto / 2)
        }
    }
    init(origen: Punto, tamaño: Tamaño){
        self.origen = origen
        self.tamaño = tamaño
    }
    
}

class Cuadrilatero: Figura {
    var p1 : Punto
    var p2 : Punto
    var p3 : Punto
    var p4 : Punto

    override var centro: Punto {
        get{
            return super.centro
        }
        set {
            let incrementoX = newValue.x - super.centro.x
            let incrementoY = newValue.y - super.centro.y

            p1 = Punto(x: p1.x + incrementoX, y: p1.y + incrementoY)
            p2 = Punto(x: p2.x + incrementoX, y: p2.y + incrementoY)
            p3 = Punto(x: p3.x + incrementoX, y: p3.y + incrementoY)
            p4 = Punto(x: p4.x + incrementoX, y: p4.y + incrementoY)
            origen = Punto(x: origen.x + incrementoX, y: origen.y + incrementoY)
        }
    }

    override var area: Double {
        let area = areaTriangulo(p1,p2,p3) + areaTriangulo(p2,p3,p4)
        return area
    }

    


    init(p1: Punto, p2: Punto, p3: Punto, p4: Punto) {
        let menor = Punto(x: min(p1.x, p2.x, p3.x, p4.x), y: min(p1.y, p2.y, p3.y, p4.y))
        let mayor = Punto(x: max(p1.x, p2.x, p3.x, p4.x), y: max(p1.y, p2.y, p3.y, p4.y))
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.p4 = p4
        super.init(origen: menor, tamaño: Tamaño(ancho: mayor.x - menor.x , alto: mayor.y - menor.y))
        
    }
    func areaTriangulo(_ p1: Punto, _ p2: Punto, _ p3: Punto) -> Double {
    let det = p1.x * (p2.y - p3.y) + p2.x * (p3.y - p1.y) + p3.x * (p1.y - p2.y)
    return abs(det)/2
}


}

class Circulo: Figura {
    var radio: Double
    init(centro: Punto, radio1: Double){
        self.radio = radio1
        super.init(origen: Punto(x: centro.x - radio1, y: centro.y - radio1), tamaño: Tamaño(ancho: radio1*2, alto: radio1*2))
    }

    override var area: Double {
        get{
            return Double.pi * radio * radio
        }
        set {
            radio = sqrt(newValue / Double.pi)
        }
    }
}


struct AlmacenFiguras {
    var figuras: [Figura] = [+]

    var numFiguras: Int {
        return figuras.count
    }

    var areaTotal: Double {
        var sumAreas: Double = 0.0
        for figura in figuras{
            sumAreas += figura.area
        }
        return sumAreas
    }

    mutating func añade (figura: Figura) {
        figuras.append(figura)
    }

    mutating func desplaza(incX: Double, incY: Double) {
        for figura in figuras{
            let nuevoCentro = Punto(x: figura.centro.x + incX, y: figura.centro.y + incY )
            figura.centro = nuevoCentro
        }
    }
}
// Cuadrilaterio

var cuadrilatero = Cuadrilatero(p1: Punto(x: 2, y: 6), p2: Punto(x: 5, y: 2),
                                p3: Punto(x: 8, y: 7), p4: Punto(x: 3, y: 8))
print("\nCuadrilátero")
print("------------")
print("p1: \(cuadrilatero.p1), p2: \(cuadrilatero.p2)")
print("p3: \(cuadrilatero.p3), p4: \(cuadrilatero.p4)")
print("Origen: \(cuadrilatero.origen)")
print("Tamaño: \(cuadrilatero.tamaño)")
print("Centro: \(cuadrilatero.centro)")
print("Área: \(cuadrilatero.area)")
let nuevoCentro = Punto(x: 10, y: 10)
print("Movemos el centro a la posición \(nuevoCentro)")
cuadrilatero.centro = nuevoCentro
print("Origen: \(cuadrilatero.origen)")
print("Centro: \(cuadrilatero.centro)")
print("Área: \(cuadrilatero.area)")
print("p1: \(cuadrilatero.p1), p2: \(cuadrilatero.p2)")
print("p3: \(cuadrilatero.p3), p4: \(cuadrilatero.p4)")

// Circulo

var circulo = Circulo(centro: Punto(x: 12, y: 12), radio1: 5)
print("\nCírculo")
print("-------")
print("Centro: \(circulo.centro)")
print("Radio: \(circulo.radio)")
print("Área: \(circulo.area)")
print("Origen: \(circulo.origen)")
print("Tamaño: \(circulo.tamaño)")
let nuevoRadio = 3.0
print("Nuevo radio: \(nuevoRadio)")
circulo.radio = nuevoRadio
print("Radio: \(circulo.radio)")
print("Centro: \(circulo.centro)")
print("Origen: \(circulo.origen)")
print("Tamaño: \(circulo.tamaño)")
let nuevaArea = 100.0
circulo.area = nuevaArea
print("Nueva area: \(nuevaArea)")
print("Centro: \(circulo.centro)")
print("Radio: \(circulo.radio)")
print("Área: \(circulo.area)")
print("Origen: \(circulo.origen)")
print("Tamaño: \(circulo.tamaño)")

// Almacén

var almacen = AlmacenFiguras()
almacen.añade(figura: cuadrilatero)
almacen.añade(figura: circulo)
print("Total áreas de las figuras: \(almacen.areaTotal)")
almacen.desplaza(incX: 100, incY: 100)
print("Nuevos centros de las figuras:")
for figura in almacen.figuras {
    print("Centro: \(figura.centro)")
}



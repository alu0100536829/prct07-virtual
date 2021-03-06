=begin
**********************************************************
* Autores: 
       Teno González Dos Santos
       Albano José Yanes Reyes
* Fecha: 23/10/2013
* Asignatura: Lenguejes y Paradigmas de Programación
* Tercero de Grado en Ingeniería Informática
* Universidad de la Laguna
*
* Practica 07: Realice las modificaciones oportunas 
*   sobre la Practica 06 para contemplar el uso del 
*   módulo Comparable. Ademas La clase se ha de 
*   compilar con la herramienta Travis de 
*   integración continua
***********************************************************
=end

require "./lib/gcd.rb"

class Fraccion
	include Comparable
	attr_reader :a, :b #a: numerador, b: denominador
	def initialize(a,b)
		#comprobamos que los datos de entradas sean numericos
		raise unless a.is_a?(Numeric)
		raise unless b.is_a?(Numeric)
		#comprobamos que el dominador no sea cero 
		raise unless (b != 0)
		#inicializamos las variables
		 @a, @b = a, b
	end
	#formateo de la salida (a/b)
	def to_s
		"#{@a}/#{@b}"
	end

	#metodo que retorna el numerador 
	def num
		return @a
	end
	#metedo que retorna el denominador 
	def denom
		return @b
	end
	#Fraccion en modo flotante
	def to_f
		@a.to_f / @b.to_f #conversion de tipo a flotante mediante to_f
	end

	# #Comprueba si son iguales dos fracciones
	# def == (other)
	# 	if(@a == other.num) && (@b == other.denom)
	# 		return true 
	# 	else 
	# 		return false
	# 	end
	# end
	
	#Fracción pasada a float. (ej: 1.25)
	def abs
		 f= Fraccion.new(@a.abs, @b.abs)
	end

	#Fracción reciproca o inversa (a/b -> b/a)
	def reciprocal
		f= Fraccion.new(@b, @a)
	end
	
	#Suma de fracciones
	def + (other)
		comun = @b * other.denom
		a1 = @a * other.denom
		a2 = other.num * @b
		a3 = a1 + a2
		k = gcd(a3,comun)
		a3 /= k
		comun /= k
		Fraccion.new(a3,comun)
	end
	
	#Resta de fracciones
	def - (other)
		comun = @b * other.denom
		a1 = @a * other.denom
		a2 = other.num * @b
		a3 = a1 - a2
		k = gcd(a3,comun)
		a3 /= k
		comun /= k
		Fraccion.new(a3,comun)
	end

	#Opuesto de fracción. La suma de una fracción y su opuesto debe ser 0. 
	def -@
		k = gcd(@a, @b)
        a = @a / k
        b = @b / k
        if (b < 0)  #Si el denominador es negativo
			return Fraccion.new(a,-b)
		else 
			return Fraccion.new(-a,b)
		end
	end

	#Producto de fracciones
	def * (other)
		a = @a * other.num
		b = @b * other.denom
		k = gcd(a,b)
		a /= k
		b /= k
		Fraccion.new(a,b)
	end

	#División de fracciones
	def / (other)
		a = @a * other.denom
		b = @b * other.num
		k = gcd(a,b)
		a /= k
		b /= k
		Fraccion.new(a,b)
	end
	
	#Resto de fracciones
	def % (other)
		r = Fraccion.new(0,1) #Inicializa objeto
		r = self
		while (r.to_f >= other.to_f) do   #Hasta que no se pueda restar más. Queda en r el resto.
			r = r - other
		end
		return r	
	end

	#Método sobreescrito del módulo Comparable que permite usar los comparadores (<, >, ==, <=, >=, between?)
	def <=> (other)
		self.to_f <=> other.to_f
	end
	
	# #Comprueba si fracción es mayor que otra
	# def > (other)
	# 	if (self.to_f > other.to_f)
	# 		return true
	# 	else
	# 		return false
	# 	end
	# end
	
	# #Comprueba si fracción es menor que otra
	# def < (other)
	# 	if (self.to_f < other.to_f)
	# 		return true
	# 	else
	# 		return false
	# 	end
	# end
	
	# #Comprueba si fracción es mayor o igual que otra
	# def >= (other)
	# 	if (self.to_f >= other.to_f)
	# 		return true
	# 	else
	# 		return false
	# 	end
	# end
	
	# #Comprueba si fracción es menor o igual que otra
	# def <= (other)
	# 	if (self.to_f <= other.to_f)
	# 		return true
	# 	else
	# 		return false
	# 	end
	# end

	

end

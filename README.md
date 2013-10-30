Ya funciona todo bien en Travis.
Sólo hace falta que se añada el módulo Comparable.

- Haz el include Comparable
- Quita todos los procedimientos de comparación que hay en la clase fracción.
- Añade:
	def <=> (other)
		self.to_f <=> other.to_f
	end

- Borra las pruebas de las comparaciones y haz una donde se compruebe el funcionamiento de todas las posibilidades (<, >, <=, >=, ==, between?).

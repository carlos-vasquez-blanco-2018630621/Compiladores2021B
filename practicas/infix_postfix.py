
class afn(object):

	expresionRegular = ""
	abecedario = {}
	rePoint = []
	profija = []

	def __init__(self,expresionRegular):
		self.expresionRegular = expresionRegular

		for char in self.expresionRegular:
			if char in self.abecedario.keys():
				self.abecedario[char] += 1
			elif char.isalpha():
				self.abecedario[char] = 1
		
		print(self.abecedario)

	def addPoints(self):
		if len(self.expresionRegular) == 1:
			print("addPoints = " + self.expresionRegular)
			self.rePoint = self.expresionRegular
		else:
			newER = []
			for i in range(0,len(self.expresionRegular)-1):
				primero = self.expresionRegular[i]
				segundo = self.expresionRegular[i+1]
				newER.append(primero)
				if primero != '(' and primero != '|' and segundo.isalpha():
					newER.append('.')
				elif segundo == '(' and primero != '(' and primero != '|':
					newER.append('.')
			newER.append(segundo)
			self.rePoint = newER
			print(self.rePoint)


	def precedence(self, char):

			if char == '*':
				return 4
			elif char == '+':
				return 4
			elif char == '.':
				return 3
			elif char == '|':
				return 2
			else:
				return 1


	def posfija(self):
		
		salida = []
		pila = []
		pila.append('#')
		
		for i in range(0,len(self.rePoint)):

			if self.rePoint[i].isalpha():
				salida.append(self.rePoint[i])

			
			elif self.rePoint[i] == '+' or self.rePoint[i] == '*' or self.rePoint[i] == '|' or self.rePoint[i] == '.' and pila[-1] == '(':
				pila.append(self.rePoint[i])


			elif self.rePoint[i] == '+' or self.rePoint[i] == '*' or self.rePoint[i] == '|' or self.rePoint[i] == '.':
				
				while len(pila) > 0:
					if self.precedence(pila[-1]) >= self.precedence(self.rePoint[i]):
						salida.append(pila.pop())
					else:
						pila.append(self.rePoint[i])
						break

			elif self.rePoint[i] == '(':
				pila.append(self.rePoint[i])

			elif self.rePoint[i] == ')':

				while pila[-1] != '(':
					salida.append(pila.pop())
				pila.pop()

		while len(pila) > 0:
			salida.append(pila.pop())

		self.profija = salida
		print(self.profija)		


### main ---------------------------------------------	

print("Expresion regular: ")
re = input()
print(re)
afntest = afn(re)
afntest.addPoints()
afntest.posfija()

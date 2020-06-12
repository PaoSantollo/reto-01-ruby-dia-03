class Juego
  def imprimirTablero(tablero)
    for i in 0..9
      for j in 0..9
        print tablero[i][j]
      end
      print "\n"
    end
    print "\n"
  end

  def localizacionCelulasVivas(tablero, ubicacionx, ubicaciony)
    indice = 0
    y = 0
    x = 0
    limite = 10
    while y < limite
      while x < limite
        if tablero[x][y] == 1
          ubicacionx[indice] = x
          ubicaciony[indice] = y
          indice = indice + 1
        end
        x = x + 1
      end
      y = y + 1
    end
  end
end

class Reglas
  def contador
  end
end

class Tablero11 < Reglas
  def contador
    print "cont tablero11"
  end
end

class Tablero12 < Reglas
  def contador
    print "cont tablero12"
  end
end

class Tablero13 < Reglas
  def contador
    print "cont tablero13"
  end
end

class Tablero21 < Reglas
  def contador
    print "cont tablero21"
  end
end

class Tablero23 < Reglas
  def contador
    print "cont tablero23"
  end
end

class Tablero31 < Reglas
  def contador
    print "cont tablero31"
  end
end

class Tablero32 < Reglas
  def contador
    print "cont tablero32"
  end
end

class Tablero33 < Reglas
  def contador
    print "cont tablero33"
  end
end

tablero = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 1, 1, 1, 0, 0, 0, 0],
           [0, 0, 0, 1, 1, 1, 0, 0, 0, 0],
           [0, 0, 0, 1, 1, 1, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
ubicacionx = Array.new(10, 0)
ubicaciony = Array.new(10, 0)
vecinos = Array.new(10, 0)
obj = Juego.new
obj.imprimirTablero(tablero)
obj.localizacionCelulasVivas(tablero, ubicacionx, ubicaciony)
regla = Reglas.new
posisiones = [Tablero11.new, Tablero12.new, Tablero13.new, Tablero21.new, Tablero23.new, Tablero31.new, Tablero32.new, Tablero33.new]
posisiones.each do |reglas|
  reglas.contador
end

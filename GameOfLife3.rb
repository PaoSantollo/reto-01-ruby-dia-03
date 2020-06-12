class Juego
  def localizacionCelulasVivas(tablero, ubicacionx, ubicaciony)
    indice = 0
    for i in 0..9
      for j in 0..9
        if tablero[i][j] == 1
          ubicacionx[indice] = i
          ubicaciony[indice] = j
          indice = indice + 1
        end
      end
    end
  end

  def localizacionCelulasMuertas(ubicacionmuertasx, ubicacionmuertasy, tablero)
    indice = 0
    for i in 0..9
      for j in 0..9
        if tablero[i][j] == 0
        end
      end
    end
  end
end

class Tablero
  def imprimirTablero(tablero)
    for i in 0..9
      for j in 0..9
        print tablero[i][j]
      end
      print "\n"
    end
    print "\n"
  end
end

class Reglas
  def evaluarVecinos(ubicacionx, ubicaciony, vecinos, tablero)
    for i in 0..9
      contadorVecinos = 0
      x = ubicacionx[i]
      y = ubicaciony[i]
      xAuxiliar = x
      yAuxiliar = y + 1
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      xAuxiliar = x - 1
      yAuxiliar = y + 1
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      xAuxiliar = x + 1
      yAuxiliar = y + 1
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      xAuxiliar = x + 1
      yAuxiliar = y
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      xAuxiliar = x - 1
      yAuxiliar = y
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      xAuxiliar = x - 1
      yAuxiliar = y - 1
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      xAuxiliar = x
      yAuxiliar = y - 1
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      xAuxiliar = x + 1
      yAuxiliar = y - 1
      if tablero[xAuxiliar][yAuxiliar] == 1
        contadorVecinos = contadorVecinos + 1
      end
      if contadorVecinos == 1 || contadorVecinos == 0 || contadorVecinos >= 4
        vecinos[i] = 0
      end
      if contadorVecinos == 3 || contadorVecinos == 2
        vecinos[i] = 1
      end
    end
  end
end

class Celula
  def estado()
  end
end

class Muere < Celula
  def estado(ubicacionx, ubicaciony, tablero, vecinos)
    for i in 0..9
      if vecinos[i] == 0
        m = ubicacionx[i]
        n = ubicaciony[i]
        tablero[m][n] = 0
      end
    end
  end
end

class Vive < Celula
  def estado(ubicacionx, ubicaciony, tablero, vecinos)
    for i in 0..9
      if vecinos[i] == 1
        m = ubicacionx[i]
        n = ubicaciony[i]
        tablero[m][n] = 1
      end
    end
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
ubicacionmuertasx = Array.new(10, 0)
ubicacionmuertasy = Array.new(10, 0)
obj = Juego.new
tab = Tablero.new
tab.imprimirTablero(tablero)
obj.localizacionCelulasVivas(tablero, ubicacionx, ubicaciony)
reglas = Reglas.new
reglas.evaluarVecinos(ubicacionx, ubicaciony, vecinos, tablero)
celula = Celula.new
estado = [Muere.new, Vive.new]
estado.each do |celula|
  celula.estado(ubicacionx, ubicaciony, tablero, vecinos)
end
tab.imprimirTablero(tablero)

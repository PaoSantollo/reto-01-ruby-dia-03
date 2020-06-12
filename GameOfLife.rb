class Juego
  def imprimirTablero(tablero)
    print "\n"
    for i in 0..9
      for j in 0..9
        print tablero[i][j]
      end
      print "\n"
    end
  end
  def localizacionCelulas(tablero,ubicacionx,ubicaciony)
    indiceUbicacion=0
    for i in 0..9
      for j in 0..9
        if tablero[i][j]==1
          ubicacionx[indiceUbicacion]=i
          ubicaciony[indiceUbicacion]=j
          indiceUbicacion=indiceUbicacion+1
        end
      end
    end
  end
  def reglasJuego(ubicacionx,ubicaciony,vecinos,tablero)
    for i in 0..9
      contadorVecinos=0
      x= ubicacionx[i]
      y= ubicaciony[i]
      xAuxiliar=x
      yAuxiliar=y+1
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      xAuxiliar=x-1
      yAuxiliar=y+1
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      xAuxiliar=x+1
      yAuxiliar=y+1
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      xAuxiliar=x+1
      yAuxiliar=y
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      xAuxiliar=x-1
      yAuxiliar=y
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      xAuxiliar=x-1
      yAuxiliar=y-1
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      xAuxiliar=x
      yAuxiliar=y-1
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      xAuxiliar=x+1
      yAuxiliar=y-1
      if tablero[xAuxiliar][yAuxiliar]==1
        contadorVecinos=contadorVecinos+1
      end
      if contadorVecinos ==1 || contadorVecinos==0 || contadorVecinos >=4
        vecinos[i]=0
      end
      if contadorVecinos == 3 || contadorVecinos==2
        vecinos[i]=1
      end
    end
  end
  def creacionNuevoTablero(ubicacionx,ubicaciony,vecinos,tablero)
    for i in 0..9
      if vecinos[i]==0
        m=ubicacionx[i]
        n=ubicaciony[i]
        tablero[m][n]=0
      end
      if vecinos[i]==1
        m=ubicacionx[i]
        n=ubicaciony[i]
        tablero[m][n]=1
      end
    end
  end
end

tablero =[[0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0],
          [0,0,0,1,1,1,0,0,0,0],
          [0,0,0,1,1,1,0,0,0,0],
          [0,0,0,1,1,1,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0],]

ubicacionx=Array.new(10,0)
ubicaciony=Array.new(10,0)
vecinos=Array.new(10,0)
obj=Juego.new
obj.imprimirTablero(tablero)
obj.localizacionCelulas(tablero,ubicacionx,ubicaciony)
obj.reglasJuego(ubicacionx,ubicaciony,vecinos,tablero)
obj.creacionNuevoTablero(ubicacionx,ubicaciony,vecinos,tablero)
obj.imprimirTablero(tablero)

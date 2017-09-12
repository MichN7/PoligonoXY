import grafica.*;
 
GPlot plot1, plot2;
 
void setup() {
  size(440, 420);
 
  // Crea la primera trama
  plot1 = new GPlot(this);
  plot1.setPos(0, 0);
  plot1.setMar(60, 70, 40, 70);
  plot1.setDim(300, 300);
  plot1.setAxesOffset(4);
  plot1.setTicksLength(4);
 
  // Crea segunda trama con las mismas dimensiones
  plot2 = new GPlot(this);
  plot2.setPos(plot1.getPos());
  plot2.setMar(plot1.getMar());
  plot2.setDim(plot1.getDim());
  plot2.setAxesOffset(4);
  plot2.setTicksLength(4);
 
  //Prepara los puntos
  int nPoints = 20;
  GPointsArray points = new GPointsArray(nPoints);
  
  //se definen los puntos
  for (int i = 0; i < nPoints; i++) {
    points.add(i, 30 + 10*noise(i*0.1));
  }  
 
  //Pone los puntos el titulo y los labels axis 
  plot1.setPoints(points);
  plot1.setPointColors( new int [] { color ( 91, 135, 254)});
  plot1.setTitleText("Distancia");
  plot1.getYAxis().setAxisLabelText("Centimetros)");
  plot1.getXAxis().setAxisLabelText("Tiempo (minutos)");
 
  plot2.getRightAxis().setAxisLabelText("Pulgadas");
 
  //Hace el axis derecho de la segunda trama visible
  plot2.getRightAxis().setDrawTickLabels(true);
 
  // Activa la panoramización(solo la primera trama)
  plot1.activatePanning();
}
 
void draw() {
  background(194, 202, 243);
 
  // Dibuja la primera trama (grafica)
  plot1.beginDraw();
  plot1.drawBox();
  plot1.drawXAxis();
  plot1.drawYAxis();
  plot1.drawTitle();
  plot1.drawPoints();
  plot1.drawLines();
  plot1.endDraw();
 
  //Cambia la segunda grafica a vertical, escala de Celsius a Kelvin 
  plot2.setYLim(centimetrosToPulgadas(plot1.getYLim()));
 
  //Dibuja solo el axix derecho
  plot2.beginDraw();
  plot2.drawRightAxis();
  plot2.endDraw();
}
 
//transforma centimetros a pulgadas

float[] centimetrosToPulgadas(float[] centimetros){
  float[] pulgadas = new float[centimetros.length];
  for(int i = 0; i < centimetros.length; i++){
    pulgadas[i] = centimetros[i] * 2.3;
  }
  return pulgadas;
}
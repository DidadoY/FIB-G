#ifndef _ISAFLOOR_H
#define _ISAFLOOR_H

#include "plugin.h"
#include "vector.h" 

class Isafloor: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void preFrame();
	 void postFrame();

	 void onObjectAdd();
	 bool drawScene();
	 bool drawObject(int);

	 bool paintGL();

	 void keyPressEvent(QKeyEvent *);
	 void mouseMoveEvent(QMouseEvent *);
  private:
	void calcular();
	float areaTerra = 0;
	float areaTotal = 0;
};

#endif

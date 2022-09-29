#ifndef _DRAWBOUNDINGBOX_H
#define _DRAWBOUNDINGBOX_H

#include "plugin.h" 

class DrawBoundingBox: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void postFrame();
  private:
  
  	void crearCub();
  
	QOpenGLShaderProgram* program;
   	QOpenGLShader* vs;
    	QOpenGLShader* fs;
    	bool created;
    	
    	GLuint cubVAO;
    	GLuint coordsVBO;
    	GLuint colorVBO;
};

#endif

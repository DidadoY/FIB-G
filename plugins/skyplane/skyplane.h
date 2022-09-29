#ifndef _SKYPLANE_H
#define _SKYPLANE_H

#include "plugin.h" 

class Skyplane: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void crearFons();

  private:
    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;  
    GLuint textureId0;
    GLuint fonsVAO;
    GLuint coordsVBO;
    GLuint colorVBO;
};

#endif

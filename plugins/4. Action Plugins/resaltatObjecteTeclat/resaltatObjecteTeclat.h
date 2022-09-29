#ifndef _RESALTATOBJECTETECLAT_H
#define _RESALTATOBJECTETECLAT_H

#include "plugin.h" 
#include <QOpenGLShader>
#include <QOpenGLShaderProgram>

class ResaltatObjecteTeclat: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)
    
public:
	void onPluginLoad();
	void postFrame();
	void createBox();
	void pintaBox(int i);
	void onSceneClear();
	void onObjectAdd();
	void keyPressEvent(QKeyEvent *ke);
private:
	QOpenGLShaderProgram* program;
	QOpenGLShader* vs;
	QOpenGLShader* fs;
	int seleccionat;
	bool created;
	GLuint cubVAO;
	GLuint coordsVBO;
	GLuint colorVBO;
};

#endif

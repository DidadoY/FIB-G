#include "skyplane.h"
#include "glwidget.h"

const int TEX_WIDTH = 512;
const int TEX_HEIGHT = 512;
void Skyplane::onPluginLoad()
{
    GLWidget &g = *glwidget();
    g.makeCurrent();

    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceFile(glwidget()->getPluginPath()+"/../shaders/mirror.vert");
    //cout << "vs" << endl;

    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceFile(glwidget()->getPluginPath()+"/../shaders/mirror.frag");
    //cout << "fs" << endl;

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
    if (!program->isLinked()) cout << "Shader link error" << endl; 

    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceFile(glwidget()->getPluginPath()+"/../shaders/sky.vert");
    //cout << "vs" << endl;

    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceFile(glwidget()->getPluginPath()+"/../shaders/sky.frag");
    //cout << "fs" << endl;

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
    if (!program->isLinked()) cout << "Shader link error" << endl; 

	// Load Texture 1
	QString filename = QFileDialog::getOpenFileName(0, "Open Image", "/assig/grau-g/Textures", "Image file (*.png *.jpg)");	
	QImage img0(filename);	
	QImage im0 = img0.convertToFormat(QImage::Format_ARGB32).rgbSwapped().mirrored();
        g.makeCurrent();
	g.glActiveTexture(GL_TEXTURE0);
	g.glGenTextures( 1, &textureId0);
	g.glBindTexture(GL_TEXTURE_2D, textureId0);
	g.glTexImage2D( GL_TEXTURE_2D, 0, GL_RGB, im0.width(), im0.height(), 0, GL_RGBA, GL_UNSIGNED_BYTE, im0.bits());
	g.glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
	g.glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
	g.glBindTexture(GL_TEXTURE_2D, 0);

}

void Skyplane::crearFons()
{
	program->bind();

	GLWidget &g = *glwidget();
	g.makeCurrent();  
		float coords[] = { 
			0, 0, 0,
			0, 1, 0,
			1, 0, 0,
			1, 1, 0,};

		float color[] = { 
			1, 0, 1,};
		// Create & bind empty VAO
        	g.glGenVertexArrays(1, &fonsVAO);
       	g.glBindVertexArray(fonsVAO);
		// Create VBO
		g.glGenBuffers(1, &coordsVBO);
        	g.glBindBuffer(GL_ARRAY_BUFFER, coordsVBO);
        	g.glBufferData(GL_ARRAY_BUFFER, sizeof(coords), coords, GL_STATIC_DRAW);
		g.glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);
        	g.glEnableVertexAttribArray(0);

		g.glGenBuffers(1, &colorVBO);
        	g.glBindBuffer(GL_ARRAY_BUFFER, colorVBO);
        	g.glBufferData(GL_ARRAY_BUFFER, sizeof(color), color, GL_STATIC_DRAW);
		g.glVertexAttribPointer(2, 3, GL_FLOAT, GL_FALSE, 0, 0);
        	g.glEnableVertexAttribArray(2);
}


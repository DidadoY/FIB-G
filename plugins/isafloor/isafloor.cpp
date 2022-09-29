#include "isafloor.h"
#include "glwidget.h"
void Isafloor::calcular()
{
	areaTerra = 0;
	areaTotal = 0;
	vector<Object> objects = scene()->objects();
	
	vector<Face> faces = objects[0].faces();
	vector<Vertex> vertex = objects[0].vertices();
	objects[0].computeNormals();
	for(unsigned int i = 0; i < faces.size(); ++i) {
		Vector normal = faces[i].normal();
		Vector u = Vector(0.0,0.0,1.0);
		float a = normal.x()*u.x() + normal.y()*u.y() + normal.z()*u.z();
		
		if(a > 0.7) {
			if(normal.z() > 0) areaTerra += normal.z();
			else areaTerra += -normal.z();
		}
		if(normal.z() > 0) areaTotal += normal.z();
		else areaTotal += -normal.z();
		
	cout << areaTotal << ' ' << areaTerra << endl;
		
	}
}

void Isafloor::onPluginLoad()
{
	calcular();
}

void Isafloor::preFrame()
{
	
}

void Isafloor::postFrame()
{
	
}

void Isafloor::onObjectAdd()
{
	calcular();
}

bool Isafloor::drawScene()
{
	return false; // return true only if implemented
}

bool Isafloor::drawObject(int)
{
	return false; // return true only if implemented
}

bool Isafloor::paintGL()
{
	return false; // return true only if implemented
}

void Isafloor::keyPressEvent(QKeyEvent *)
{
	
}

void Isafloor::mouseMoveEvent(QMouseEvent *)
{
	
}


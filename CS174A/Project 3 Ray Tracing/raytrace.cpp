//
// template-rt.cpp
//

#define _CRT_SECURE_NO_WARNINGS
#include "matm.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

const int MAX_SPHERES = 5;
const int MAX_LIGHTS = 5;

int g_width;
int g_height;
vec4 g_dir;

struct Ray
{
    vec4 origin;
    vec4 dir;
};

// TODO: add structs for spheres, lights and anything else you may need.

struct Color
{
	float r,g,b; // Range from 0-1
};

struct Scaling  //scaling factors
{
	float x,y,z;
};

struct Sphere
{
	string name;
	vec4 position;
	Scaling scaling;
	Color color;
	float Ka, Kd, Ks, Kr;
	float n;
};

struct Back  //background color
{
	Color color;
};

struct Light
{
	string name;
	vec4 position;
	Color intensity;
};

struct Ambient   //ambient color
{
	Color intensity;
};

char g_file[1000];

//initialize array of objects
Sphere sphereArray[MAX_SPHERES];
Light LightArray[MAX_LIGHTS];

//counting the number of spheres and lights to be checked
int sphereNumber = 0;
int LightNumber = 0;

// Initialize objects
Back back;
Ambient ambient;

//end of defining structures

vector<vec4> g_colors;

float g_left;
float g_right;
float g_top;
float g_bottom;
float g_near;

// -------------------------------------------------------------------
// Input file parsing

vec4 toVec4(const string& s1, const string& s2, const string& s3)
{
    stringstream ss(s1 + " " + s2 + " " + s3);
    vec4 result;
    ss >> result.x >> result.y >> result.z;
    result.w = 1.0f;
    return result;
}

float toFloat(const string& s)
{
    stringstream ss(s);
    float f;
    ss >> f;
    return f;
}

void parseLine(const vector<string>& vs)
{
    //TODO: add parsing of NEAR, LEFT, RIGHT, BOTTOM, TOP, SPHERE, LIGHT, BACK, AMBIENT, OUTPUT.
    if (vs[0] == "NEAR")
		g_near = toFloat(vs[1]);
	if (vs[0] == "LEFT")
		g_left = toFloat(vs[1]);
	if (vs[0] == "RIGHT")
		g_right = toFloat(vs[1]);
	if (vs[0] == "BOTTOM")
		g_bottom = toFloat(vs[1]);
	if (vs[0] == "TOP")
		g_top = toFloat(vs[1]);
	if (vs[0] == "RES")
    {
        g_width = (int)toFloat(vs[1]);
        g_height = (int)toFloat(vs[2]);
        g_colors.resize(g_width * g_height);
    }
	if (vs[0] == "LIGHT")
	{
		// Read name
		LightArray[LightNumber].name = vs[1];

		// Read position
		LightArray[LightNumber].position.x = toFloat(vs[2]);
		LightArray[LightNumber].position.y = toFloat(vs[3]);
		LightArray[LightNumber].position.z = toFloat(vs[4]);
		LightArray[LightNumber].position.w = 1.0f;

		// Read intensity
		LightArray[LightNumber].intensity.r = toFloat(vs[5]);
		LightArray[LightNumber].intensity.g = toFloat(vs[6]);
		LightArray[LightNumber].intensity.b = toFloat(vs[7]);

		// Read light array for new light
		LightNumber++;
	}
	if (vs[0] == "SPHERE")
	{
		// Read name
		sphereArray[sphereNumber].name = vs[1];

		// Read position
		sphereArray[sphereNumber].position.x = toFloat(vs[2]);
		sphereArray[sphereNumber].position.y = toFloat(vs[3]);
		sphereArray[sphereNumber].position.z = toFloat(vs[4]);
		sphereArray[sphereNumber].position.w = 1.0f;

		// Read scaling
		sphereArray[sphereNumber].scaling.x = toFloat(vs[5]);
		sphereArray[sphereNumber].scaling.y = toFloat(vs[6]);
		sphereArray[sphereNumber].scaling.z = toFloat(vs[7]);

		// Read Color
		sphereArray[sphereNumber].color.r = toFloat(vs[8]);
		sphereArray[sphereNumber].color.g = toFloat(vs[9]);
		sphereArray[sphereNumber].color.b = toFloat(vs[10]);

		// Read K
		sphereArray[sphereNumber].Ka = toFloat(vs[11]);
		sphereArray[sphereNumber].Kd = toFloat(vs[12]);
		sphereArray[sphereNumber].Ks = toFloat(vs[13]);
		sphereArray[sphereNumber].Kr = toFloat(vs[14]);

		// Read n
		sphereArray[sphereNumber].n = toFloat(vs[15]);
		
		// Done with initializing current sphere, numberofsphere++
		sphereNumber++;
	}
	if (vs[0] == "AMBIENT")
	{
		ambient.intensity.r = toFloat(vs[1]);
		ambient.intensity.g = toFloat(vs[2]);
		ambient.intensity.b = toFloat(vs[3]);
	}
	if (vs[0] == "BACK")
	{
		//Read color
		back.color.r = toFloat(vs[1]);
		back.color.g = toFloat(vs[2]);
		back.color.b = toFloat(vs[3]);
	}
}

void loadFile(const char* filename)
{
    ifstream is(filename);
    if (is.fail())
    {
        cout << "Could not open file " << filename << endl;
        exit(1);
    }
    string s;
    vector<string> vs;
    while(!is.eof())
    {
        vs.clear();
        getline(is, s);
        istringstream iss(s);
        while (!iss.eof())
        {
            string sub;
            iss >> sub;
            vs.push_back(sub);
        }
        parseLine(vs);
    }
}


// -------------------------------------------------------------------
// Utilities

void setColor(int ix, int iy, const vec4& color)
{
    int iy2 = g_height - iy - 1; // Invert iy coordinate.
    g_colors[iy2 * g_width + ix] = color;
}


// -------------------------------------------------------------------
// Intersection routine

// TODO: add your ray-sphere intersection routine here.

//This is the first level ray-sphere intersection function
bool ifIntersect(const Ray& r, const Sphere& s, float &t, bool specialCase)
{	
	specialCase=false;
	vec4 dist;
	dist = s.position-r.origin; // Calculate vector from origin to sphere

	mat4 M; // Create matrix for scaling
	M = Scale(s.scaling.x, s.scaling.y, s.scaling.z);
	mat4 invM; // Invert matrix
	InvertMatrix(M, invM);

	vec4 S = invM*dist; // Find S'
	vec4 c = invM*g_dir; // Find c'

	vec3 newS;
	newS.x=S.x; newS.y=S.y; newS.z=S.z; 
	//vec4 c = invM*r.dir; // Find c'
	vec3 newc;
	newc.x=c.x; newc.y=c.y; newc.z=c.z; 
	//std::cout << "c component:" << c.x << " " << c.y << " " << c.z << " "<< c.w << endl;

	float A = dot(newc, newc); // Calculate A for quadratic equation
	//cout << A << endl;
	float B = dot(newS, newc); // Calculate B " "
	//cout << B << endl;
	float C = dot(newS, newS) - 1; // Calculate C " "

	if((B*B - A*C) < 0)
	{
		return false;
	}// No intersection if behind camera
	
	float t0 = B/A - (sqrtf(B*B - A*C)/A); // Solve quadratic equation
	float t1 = B/A + (sqrtf(B*B - A*C)/A);
	
	//cout <<"t0: " << t0 << "-------" <<"t1:" <<t1 << endl;
	
	if(t0<1&&t1<1)  //special cases when cut-sphere occurs
		return false;

	if(t0>0&&t0<1&&t1>1&&t0<t)
	{
		specialCase=true;
		t=t0;
		return true;
	}
	if(t1>0&&t1<1&&t0>1&&t1<t)
	{
		specialCase=true;
		t=t1;
		return true;
	}
	if(t0==t1&&t0<t&&t0>1)
	{
		t=t0;
		return true;
	}
	if((t0 > 1.0f) && (t0 < t) && (t0 < t1)) // Find closer t and use it
	{
		t = t0;
		return true; // Intersection exists!
	}
	else if((t1 > 1.0f) && (t1 < t) && (t1 < t0))
	{
		t = t1;
		return true;
	}
	return false;
}

//This is the recursion-level ray-sphere intersection function
bool rsIntersect(const Ray& r, const Sphere& s, float &t)
{	
	vec4 dist;
	dist = r.origin; // Calculate vector from origin to sphere

	mat4 MScale; // Create matrix for scaling
	MScale = Scale(s.scaling.x, s.scaling.y, s.scaling.z);
	MScale[0][3]+=s.position.x;
	MScale[1][3]+=s.position.y;
	MScale[2][3]+=s.position.z;
	mat4 invMTotal; // Invert matrix
	InvertMatrix(MScale, invMTotal);

	vec4 S = invMTotal*dist; // Find S'
	vec3 newS;
	newS.x=S.x; newS.y=S.y; newS.z=S.z; 
	vec4 c = invMTotal*r.dir; // Find c'
	vec3 newc;
	newc.x=c.x; newc.y=c.y; newc.z=c.z; 

	float A = dot(newc, newc); // Calculate A 
	//cout << A << endl;
	float B = dot(newS, newc); // Calculate B 
	//cout << B << endl;
	float C = dot(newS, newS) - 1; // Calculate C 
	//cout << C << endl;
	//cout << B*B - A*C << endl;
	if((B*B - A*C) < 0) return false; // No intersection if behind camera
	
	float t0 = -(B/A) - (sqrtf(B*B - A*C)/A); 
	//cout << t0 << endl;// Solve quadratic equation
	float t1 = -(B/A) + (sqrtf(B*B - A*C)/A);
	//cout << t1 << endl;
	
	if(t0==t1&&t0<t&&t0>0)
	{
		t=t0;
		return true;
	}

	if((t0 > 0.0) && (t0 < t) && (t0 <= t1)) // Find closer t and select
	{
		t = t0;
		return true; 
	}
	else if((t1 > 0.0) && (t1 < t) && (t1 < t0))
	{
		t = t1;
		return true;
	}
	return false;
}

// -------------------------------------------------------------------
// Ray tracing

vec4 tracer(Ray viewRay, Sphere* s, Light* l, int recursionLevel, float coef)
{
	bool flag=false;
    // TODO: implement your ray tracing routine here.
	// Background color if ray hits nothing
	vec4 pixColor = vec4(back.color.r, back.color.g, back.color.b, 0.0f);
	float subcoef = coef;
	{
		std::vector<float> myVec;
		vec4 intersectionPoint; // Initialized point of intersection
		float lowest;
		int currentSphere = -1; // Counter to iterate through sphere container
		{
			float t = 3333.3f; // Arbitrary intersection distance
			for(int i = 0; i < sphereNumber; i++)
				if(recursionLevel==0)
				{
					bool specialCase = false;
					if(ifIntersect(viewRay, sphereArray[i], t, specialCase)) // If intersect
					{
						myVec.push_back(t);
						std::sort(myVec.begin(),myVec.end());
						if(myVec.front()==t)
						{
							// Set color to sphere's colors
							currentSphere = i; // Set current sphere as active sphere
							pixColor.x = sphereArray[i].color.r*ambient.intensity.r*sphereArray[currentSphere].Ka;
							pixColor.y = sphereArray[i].color.g*ambient.intensity.g*sphereArray[currentSphere].Ka;
							pixColor.z = sphereArray[i].color.b*ambient.intensity.b*sphereArray[currentSphere].Ka;
							lowest=t;
						}
					}
				}
				else
				{
					if(rsIntersect(viewRay, sphereArray[i], t)) // If intersect
					{
						myVec.push_back(t);
						std::sort(myVec.begin(),myVec.end());  //always sort the t values and return the smallest one
						if(myVec.front()==t)
						{
							// Set color to sphere's colors
							currentSphere = i; // Set current sphere as active sphere
							pixColor.x = sphereArray[i].color.r*ambient.intensity.r*sphereArray[currentSphere].Ka;
							pixColor.y = sphereArray[i].color.g*ambient.intensity.g*sphereArray[currentSphere].Ka;
							pixColor.z = sphereArray[i].color.b*ambient.intensity.b*sphereArray[currentSphere].Ka;
							lowest=t;
						}
					}
				}

				if(currentSphere == -1&&recursionLevel==0) //No intersection found, return background color
					return pixColor;
				else if(currentSphere == -1&&recursionLevel>0) //No intersection found, don't add any color intensity into the original color
					{
						pixColor.x=0.0;
						pixColor.y=0.0;
						pixColor.z=0.0;
						return pixColor;
					}
			intersectionPoint = viewRay.origin + lowest*g_dir; // Calculate coordinate hit
		}

		vec4 N = intersectionPoint-sphereArray[currentSphere].position;// - sphereArray[currentSphere].position); // Find normal
		mat4 M; // Create matrix for scaling
		M = Scale(sphereArray[currentSphere].scaling.x, sphereArray[currentSphere].scaling.y, sphereArray[currentSphere].scaling.z);
		mat4 invM;
		InvertMatrix(transpose(M), invM); // Find transformed N
		N.w = 0;
		N = normalize(invM*N);

		Ray L; // Create light vector
		L.origin = intersectionPoint;

		vec4 totalDiffuse = vec4(0.0f, 0.0f, 0.0f, 0.0f); //initialize cumulative diffusion
		vec4 totalSpecular = vec4(0.0f, 0.0f, 0.0f, 0.0f); //initialize cumulative specular

		for(int j = 0; j < LightNumber; j++) // for each light we add up the diffuse and specular effect
		{
			Light curLight = LightArray[j];

			L.dir = curLight.position-intersectionPoint;

			float fLightProjection = dot(L.dir, N);

			if(fLightProjection <= 0.0f)
				continue;

			float lightDist = dot(L.dir,L.dir); // distance from intersect point to light source
			{
				float temp = lightDist;
				if(temp == 0.0f)
					continue;
				temp = 1/sqrtf(temp);
				L.dir = temp*L.dir;
				fLightProjection = temp*fLightProjection;
			}

			bool blocked = false;
			{
				float t = lightDist;
				for(int i = 0; i < sphereNumber; i++) // Parse active spheres
					if(rsIntersect(L, sphereArray[i], t)) // Reached by light ray?
					{
						blocked = true;
						flag=true;
					}
			}
			vec4 R = (2*(dot(L.dir, N)*N) - L.dir);
			if(!blocked) // If light ray not blocked
			{
				//Sum diffuse light
				float diffuseFactor = dot(L.dir,N)*subcoef;
				totalDiffuse.x += diffuseFactor*curLight.intensity.r*sphereArray[currentSphere].color.r;
				totalDiffuse.y += diffuseFactor*curLight.intensity.g*sphereArray[currentSphere].color.g;
				totalDiffuse.z += diffuseFactor*curLight.intensity.b*sphereArray[currentSphere].color.b;
			
                float fViewProjection = dot(viewRay.dir,N);
                vec4 bPhongDir = L.dir-viewRay.dir;
                float vecLength = dot(bPhongDir,bPhongDir);
                if(vecLength != 0)
                {
                  //Sum specular light
                  float specFactor = 1/sqrtf(vecLength)*max(fLightProjection-fViewProjection, 0.0f);
                  specFactor = powf(specFactor, sphereArray[currentSphere].n)*coef;
                  totalSpecular.x += specFactor*curLight.intensity.r;
                  totalSpecular.y += specFactor*curLight.intensity.g;
                  totalSpecular.z += specFactor*curLight.intensity.b;
                }
			}
		}

		// Multiple each component by its K factor
		// Add to color to be returned

		pixColor.x += totalDiffuse.x*sphereArray[currentSphere].Kd + totalSpecular.x*sphereArray[currentSphere].Ks;
		pixColor.y += totalDiffuse.y*sphereArray[currentSphere].Kd + totalSpecular.y*sphereArray[currentSphere].Ks;
		pixColor.z += totalDiffuse.z*sphereArray[currentSphere].Kd + totalSpecular.z*sphereArray[currentSphere].Ks;

		// Calculate reflection
		subcoef *= sphereArray[currentSphere].Kr;
		float NdotC = 2.0f * dot(viewRay.dir,N);	
		vec4 temp1 = viewRay.dir - NdotC * N;
		if(recursionLevel<4)
		{
			Ray newRay;
			newRay.origin=intersectionPoint;
			newRay.dir=temp1;
			int newrecur = recursionLevel+1;
			vec4 refectColor = tracer(newRay, sphereArray, LightArray, newrecur, subcoef); // Enter recursion
			// Add reflection color into current pixel color
			pixColor.x += sphereArray[currentSphere].Kr*refectColor.x;
			pixColor.y += sphereArray[currentSphere].Kr*refectColor.y;
			pixColor.z += sphereArray[currentSphere].Kr*refectColor.z;
		}
	} 
	return pixColor;
}

float calcX(float a)
{
	return g_left+(a/(g_width))*(g_right-g_left); // Calculate pixel on plane's x
}

float calcY(float b)
{
	return g_bottom+(b/(g_height))*(g_top-g_bottom); // Calculate pixel on plane's y
}

vec4 getDir(int ix, int iy)
{
    // TODO: modify this. This should return the direction from the origin
    // to pixel (ix, iy), normalized.
    vec4 d;
    d = vec4(calcX(ix), calcY(iy), -g_near, 0.0f);
	g_dir = d;
    return normalize(d);
}

void renderPixel(int ix, int iy)
{
    Ray ray;
    ray.origin = vec4(0.0f, 0.0f, 0.0f, 1.0f);
    ray.dir = getDir(ix, iy);
    vec4 color = tracer(ray, sphereArray, LightArray, 0, 1.0);
    setColor(ix, iy, color);
}

void render()
{
    for (int iy = 0; iy < g_height; iy++)
        for (int ix = 0; ix < g_width; ix++)
            renderPixel(ix, iy);
}


// -------------------------------------------------------------------
// PPM saving

void savePPM(int Width, int Height, char* fname, unsigned char* pixels) 
{
    FILE *fp;
    const int maxVal=255;

    printf("Saving image %s: %d x %d\n", fname, Width, Height);
    fp = fopen(fname,"wb");
    if (!fp) {
        printf("Unable to open file '%s'\n", fname);
        return;
    }
    fprintf(fp, "P6\n");
    fprintf(fp, "%d %d\n", Width, Height);
    fprintf(fp, "%d\n", maxVal);

    for(int j = 0; j < Height; j++) {
        fwrite(&pixels[j*Width*3], 3, Width, fp);
    }

    fclose(fp);
}

void saveFile()
{
    // Convert color components from floats to unsigned chars.
    // TODO: clamp values if out of range.
    unsigned char* buf = new unsigned char[g_width * g_height * 3];
    for (int y = 0; y < g_height; y++)
        for (int x = 0; x < g_width; x++)
            for (int i = 0; i < 3; i++)
				if((((float*)g_colors[y*g_width+x])[i] * 255.9f)<255)
					buf[y*g_width*3+x*3+i] = (unsigned char)(((float*)g_colors[y*g_width+x])[i] * 255.9f);
				else
					buf[y*g_width*3+x*3+i] = (unsigned char)((float*)255); 
    // TODO: change file name based on input file name.
    savePPM(g_width, g_height, g_file, buf); 
    delete[] buf;
}


// -------------------------------------------------------------------
// Main

int main(int argc, char* argv[])
{
		if (argc < 2)
		{
			cout << "Usage: raytrace.exe <input_file.txt>" << endl;
			exit(1);
		}   
        //If not used, name then empty spheres and lights
        for(int i = 0; i < MAX_SPHERES; i++)
                sphereArray[i].name = "EMPTY";
        for(int i = 0; i < MAX_LIGHTS; i++)
                LightArray[i].name = "EMPTY";

        strcpy(g_file, argv[1]);
        for(int i = 0; i < 9999; i++)
                if(g_file[i] == 't' && g_file[i+1] == 'x' && g_file[i+2] == 't')
                {
                        g_file[i] = 'p';
                        g_file[i+1] = 'p';
                        g_file[i+2] = 'm';
                }
		loadFile(argv[1]);

		render();
		saveFile();
        return 0;
}
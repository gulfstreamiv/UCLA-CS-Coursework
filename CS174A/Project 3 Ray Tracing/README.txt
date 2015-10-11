CS174A Assignment 3
Bolun Hu
UID:104056403

[5/5 points] Parsing of input files: Success on all tests

[5/5 points] Coding Style (i.e., well designed, clean, commented code): Well designed and commented

[10/10 points] Ability to cast a ray and display the spheres properly: Success on the tests.

[9/10 points] Local illumination: 
Success on all the tests, except for the special case when part of sphere is behind the image plane. I succeeded to add the ambient color for that case, but didn't figure out the situation when the light is behind the image plane and lights up part of sphere behind the image plane. 
P.S. For the specular lighting, I used blinnPhong model, mostly because when using the original Phong for specular, my edge of the sphere seems to be a bit blurred, and I didn't know the reason. When I changed the specular part of equations matching blinnPhong model, everything works well. I think there should be no problem on that since blinnPhong is somewhat more accurate thatn Phong right? Correct me if I'm wrong though... :)

[8/10 points] Shadows and Reflection : success on shadows. As for reflection, I succeeded creating the first layer of the reflection color, as for the second inner layer of reflection, I didn't figure it out. How can you achieve that second layer? I think it's not practical in real life...
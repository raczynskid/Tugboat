# Motion Trails
A simple implementation of a motion trail renderer (also known as ribbon trails), for Godot 3.1. Supports texturing and start/end colors for fading in/out.

## Instructions
1. Unzip the contents into a new folder. This folder contains a demo project, and if it is not needed, the `MotionTrail` subfolder can be copied directly into an existing/new project.
2. Simply drag and drop the `MotionTrail.tscn` scene onto a parent scene (such as an object in motion), and you should be all set!

![Demonstration](https://raw.githubusercontent.com/dbp8890/motion-trails/master/trailrenderer.gif)

## Parameters
- **Trail Enabled**: If checked, the script will calculate points for the trail. You would only want to disable it by script, to let the trail end smoothly and avoid the usage of 'visible' Spatial's parameter.
- **From Width**: The width of the FIRST point of the trail relative to its X-axis. The trail can be rotated as necessary if, for example, the trail's width needs to be vertically aligned with the parent.
- **To Width**: The width of the LAST point of the trail relative to its X-axis. The trail can be rotated as necessary if, for example, the trail's width needs to be vertically aligned with the parent.
- **Scale Acceleration**: How fast width should scale. Smaller values means faster scaling at the beginning of the trail. 1.0 for no acceleration in scaling.
- **Motion Delta**: How far the parent object needs to move in order for a new point to be created in the trail. Generally, lower values are smoother, but at a cost of higher vertices needed.
- **Lifespan**: The lifespan of each point in the trail, which determines how long each point lasts before it is removed.
- **Scale Texture**: If enabled, tiles the texture along the length of the trail. Otherwise, the texture is stretched along the trail.
- **Start Color/End Color**: The colors for the start/end of the trail, which are interpolated along each point; useful for fading in/out. Note that in order for this to work, the material must use vertex colors for albedo (a default material is already attached that does this).

## Additional Notes
Hope you liked this! I hope that this helped in some way, and I had fun implementing it. The trails can effectively be thought of as a particle system, and it would be interesting if ribbon trails could perhaps be integrated with the engine's particle system at some point.

## License
MIT License

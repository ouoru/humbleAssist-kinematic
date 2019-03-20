# Humble Assist
- The humble assist is a Sit <-> Stand (STS) Assist for Seniors. This is a common technology due to muscle loss as the body ages, where the elderly lack core and lower body strength to safely sit and/or stand.
- This technology is commonly seen in hospitals and nursing homes, which require assistance from the nurse for the mechanism to be safe. These lifts lift 100% of the body load, over a long period of time (20 seconds +)
- Our team noticed that in many cultures (we have a diverse team!), grandparents are NOT sent to nursing homes, but prefer to live at home with the family. As a result, they throw themselves onto chairs / couches, and ask for family members to help them up. This commonly leads to bone fractures.

## Our Product
- Safe
- Self-operated
- Familiar
- Mobile & Accessible
- Cheap

## Kinematic Analysis
- Kinematic Analysis was done in various steps

### Gathering Data
- Data was gathered through side-view videos of our controlled tests. We did not have the luxury of certain technology, and had to estimate the joints of a body to end up with an accurate animation
- Data is stored in the "rawData" folder as an excel file, where it can easily be read from MATLAB. The data shows the joint & the angle of the joint.
- We used 8 segments to more accurately portray the human body. Most STS analysis will only use 3 segments, however, our project relies more heavily on the human arm, so we found it necessary to include.

### Curving Data
- Simple Machine Learning equations were used to find equations that would best fit the overall movement. This allowed us to transition from 10 data points to 100,000 data points. If you look in the index file, you will see that our final config was at 100,000 steps. (index.m line 3)
- We took a discretized approach to solve Forces. This was heavily influenced by school concepts, for Calculus related courses. This works with a small delta time, which is why it was necessary to reduce 4-6 seconds into 100,000 steps.

### Design Constraint
- Data is useful, but we needed to find an appropriate design constraint so that our data would be useful. In this way, we would be able to "measure" the relative success.
- We decided to calculate reduction of Knee Torque, as recommended to us by a PHD student. Our testing showed a 37% reduction in Knee Torque.

### Discretization
- Joint positions were calculated for each step.
- We used open source data on human limbs for values such as mass, center of mass, and length.
- This allowed to calculate all kinematic values, such as position, velocity, and acceleration.
- Finished! Data was used to make animations, and plenty of other graphs. All the functionalities are available in the index.m file, which made it fairly easy to use.

## Experience
- MATLAB experience with complex data
- Building tools with modular functionality
- Simple Machine Learning concepts
- 

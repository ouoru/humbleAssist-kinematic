Kprox_shank = 0.529;
Kprox_thigh = 0.54;

Rprox_shank = 0.434;
Rprox_thigh = 0.433;

Kcg_shank = sqrt( Kprox_shank^2 - Rprox_shank^2 );
Kcg_thigh = sqrt( Kprox_thigh^2 - Rprox_thigh^2 );

shank_length = segmentData(2,1) * height;
thigh_length = segmentData(3,1) * height;

shank_mass = segmentData(2,2);
thigh_mass = segmentData(3,2);

kcg_shank = Kcg_shank * shank_length;
kcg_thigh = Kcg_thigh * thigh_length;

rprox_shank = (1 - segmentData(2,3)) *  shank_length;
rprox_thigh = (1 - segmentData(3,3)) * thigh_length;

Iprox_shank = shank_mass * kcg_shank^2 + shank_mass * rprox_shank^2;
Iprox_thigh = thigh_mass * kcg_thigh^2 + thigh_mass * rprox_thigh^2;
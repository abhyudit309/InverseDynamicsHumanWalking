%%% full inverse dynamics analysis
function vars = torquesHumanoid3D(q,qdot,qddot,GRF,r)
%%%
global L rc m g misc MI
%%%
L1 = L(1);
L2 = L(2);
L3 = L(3);
r1 = rc(1);
r2 = rc(2);
r3 = rc(3);
m1 = m(1);
m2 = m(2);
m3 = m(3);
m4 = m(4);
m5 = m(5);
m6 = m(6);
m7 = m(7);
Ixx2 = MI(1);
Iyy2 = MI(2);
Izz2 = MI(3);
Ixx3 = MI(4);
Iyy3 = MI(5);
Izz3 = MI(6);
Ixx4 = MI(7);
Iyy4 = MI(8);
Izz4 = MI(9);
%%%
xtrunk = q(1);
ytrunk = q(2);
ztrunk = q(3);
tht1 = q(4);
tht2 = q(5);
tht3 = q(6);
tht4 = q(7);
tht5 = q(8);
tht6 = q(9);
tht7 = q(10);
tht8 = q(11);
tht9 = q(12);
tht10 = q(13);
tht11 = q(14);
tht12 = q(15);
tht13 = q(16);
vxtrunk = qdot(1);
vytrunk = qdot(2);
vztrunk = qdot(3);
eps1 = qdot(4);
eps2 = qdot(5);
eps3 = qdot(6);
eps4 = qdot(7);
eps5 = qdot(8);
eps6 = qdot(9);
eps7 = qdot(10);
eps8 = qdot(11);
eps9 = qdot(12);
eps10 = qdot(13);
eps11 = qdot(14);
eps12 = qdot(15);
eps13 = qdot(16);
axtrunk = qddot(1);
aytrunk = qddot(2);
aztrunk = qddot(3);
eta1 = qddot(4);
eta2 = qddot(5);
eta3 = qddot(6);
eta4 = qddot(7);
eta5 = qddot(8);
eta6 = qddot(9);
eta7 = qddot(10);
eta8 = qddot(11);
eta9 = qddot(12);
eta10 = qddot(13);
eta11 = qddot(14);
eta12 = qddot(15);
eta13 = qddot(16);
a = misc(1);
b = misc(2);
GRFx = GRF(1);
GRFy = GRF(2);
GRFz = GRF(3);
%%%
% DH parameters for the humanoid
phi1 = pi/2;
phi2 = pi/2;
phi3 = pi/2;
phi4 = tht1;
beta1 = pi/2;
beta2 = pi/2;
beta3 = pi/2;
beta4 = 0;
d1 = ztrunk;
d2 = xtrunk;
d3 = ytrunk;
d4 = b;
a1 = 0;
a2 = 0;
a3 = 0;
a4 = a;
% right limb
phi5r = tht2;
phi6r = tht3;
phi7r = tht4;
phi8r = tht5;
phi9r = tht6;
phi10r = tht7;
beta5r = -pi/2;
beta6r = -pi/2;
beta7r = -pi/2;
beta8r = 0;
beta9r = -pi/2;
beta10r = pi/2;
d5r = 0;
d6r = 0;
d7r = L1;
d8r = 0;
d9r = 0;
d10r = 0;
a5r = 0;
a6r = 0;
a7r = 0;
a8r = L2;
a9r = 0;
a10r = L3;
% Transformation matrices
T01 = TransMat(phi1,beta1,d1,a1);
T12 = TransMat(phi2,beta2,d2,a2);
T23 = TransMat(phi3,beta3,d3,a3);
% right limb
T34r = TransMat(phi4,beta4,d4,a4);
T45r = TransMat(phi5r,beta5r,d5r,a5r);
T56r = TransMat(phi6r,beta6r,d6r,a6r);
T67r = TransMat(phi7r,beta7r,d7r,a7r);
T78r = TransMat(phi8r,beta8r,d8r,a8r);
T89r = TransMat(phi9r,beta9r,d9r,a9r);
T910r = TransMat(phi10r,beta10r,d10r,a10r);
T04r = T01*T12*T23*T34r;
T05r = T04r*T45r;
T06r = T05r*T56r;
T07r = T06r*T67r;
T08r = T07r*T78r;
T09r = T08r*T89r;
T010r = T09r*T910r;
% Rotation Matrices only right side
R01 = T01(1:3,1:3);
R12 = T12(1:3,1:3);
R23 = T23(1:3,1:3);
R34r = T34r(1:3,1:3);
R45r = T45r(1:3,1:3);
R56r = T56r(1:3,1:3);
R67r = T67r(1:3,1:3);
R78r = T78r(1:3,1:3);
R89r = T89r(1:3,1:3);
R910r = T910r(1:3,1:3);
R010r = T010r(1:3,1:3);
R09r = T09r(1:3,1:3);
R08r = T08r(1:3,1:3);
R07r = T07r(1:3,1:3);
R06r = T06r(1:3,1:3);
R10 = transpose(R01);
R21 = transpose(R12);
R32 = transpose(R23);
R43r = transpose(R34r);
R54r = transpose(R45r);
R65r = transpose(R56r);
R76r = transpose(R67r);
R87r = transpose(R78r);
R98r = transpose(R89r);
R109r = transpose(R910r);
R100r = transpose(R010r);
R90r = transpose(R09r);
R80r = transpose(R08r);
R70r = transpose(R07r);
R60r = transpose(R06r);
% angular velocities - all quantities calculated thereafter are wrt frame i attached to link i
omg1 = [0;0;0];
omg2 = [0;0;0];
omg3 = [0;0;0];
omg4 = R43r*(omg3 + [0;0;eps1]);
omg5 = R54r*(omg4 + [0;0;eps2]);
omg6 = R65r*(omg5 + [0;0;eps3]);
omg7 = R76r*(omg6 + [0;0;eps4]);
omg8 = R87r*(omg7 + [0;0;eps5]);
omg9 = R98r*(omg8 + [0;0;eps6]);
omg10 = R109r*(omg9 + [0;0;eps7]);
% angular accelerations
alp1 = [0;0;0];
alp2 = [0;0;0];
alp3 = [0;0;0];
alp4 = R43r*(alp3 + cross(omg3,[0;0;eps1]) + [0;0;eta1]);
alp5 = R54r*(alp4 + cross(omg4,[0;0;eps2]) + [0;0;eta2]);
alp6 = R65r*(alp5 + cross(omg5,[0;0;eps3]) + [0;0;eta3]);
alp7 = R76r*(alp6 + cross(omg6,[0;0;eps4]) + [0;0;eta4]);
alp8 = R87r*(alp7 + cross(omg7,[0;0;eps5]) + [0;0;eta5]);
alp9 = R98r*(alp8 + cross(omg8,[0;0;eps6]) + [0;0;eta6]);
alp10 = R109r*(alp9 + cross(omg9,[0;0;eps7]) + [0;0;eta7]);
% accelerations
ac1 = R10*([0;0;aztrunk]);
ac2 = R21*(ac1 + [0;0;axtrunk]);
ac3 = R32*(ac2 + [0;0;aytrunk]);
%
r45 = [a;0;b];
r56 = [0;0;0];
r67 = [0;0;0];
r78 = [0;-L1;0];
r89 = [L2;0;0];
r910 = [0;0;0];
r1011 = [L3;0;0];
ae4 = R43r*ac3 + cross(alp4, r45) + cross(omg4, cross(omg4, r45));
ae5 = R54r*ae4 + cross(alp5, r56) + cross(omg5, cross(omg5, r56));
ae6 = R65r*ae5 + cross(alp6, r67) + cross(omg6, cross(omg6, r67));
ae7 = R76r*ae6 + cross(alp7, r78) + cross(omg7, cross(omg7, r78));
ae8 = R87r*ae7 + cross(alp8, r89) + cross(omg8, cross(omg8, r89));
ae9 = R98r*ae8 + cross(alp9, r910) + cross(omg9, cross(omg9, r910));
ae10 = R109r*ae9 + cross(alp10, r1011) + cross(omg10, cross(omg10, r1011));
%
r4c4 = [0;0;0];
r5c5 = [0;0;0];
r6c6 = [0;0;0];
r7c7 = [0;-r1;0];
r8c8 = [r2;0;0];
r9c9 = [0;0;0];
r10c10 = [r3;0;0];
ac4 = R43r*ac3 + cross(alp4, r4c4) + cross(omg4, cross(omg4, r4c4));
ac5 = R54r*ae4 + cross(alp5, r5c5) + cross(omg5, cross(omg5, r5c5));
ac6 = R65r*ae5 + cross(alp6, r6c6) + cross(omg6, cross(omg6, r6c6));
ac7 = R76r*ae6 + cross(alp7, r7c7) + cross(omg7, cross(omg7, r7c7));
ac8 = R87r*ae7 + cross(alp8, r8c8) + cross(omg8, cross(omg8, r8c8));
ac9 = R98r*ae8 + cross(alp9, r9c9) + cross(omg9, cross(omg9, r9c9));
ac10 = R109r*ae9 + cross(alp10, r10c10) + cross(omg10, cross(omg10, r10c10));
% forces
% m1 is mass of the trunk
Fex = [GRFx;GRFy;GRFz];
G = [0;-g;0];
f10 = R100r*Fex + m4*ac10 - m4*R100r*G;
f9 = R910r*f10;
f8 = R89r*f9 + m3*ac8 - m3*R80r*G;
f7 = R78r*f8 + m2*ac7 - m2*R70r*G;
f6 = R67r*f7;
f5 = R56r*f6;
% torques - r denotes the location of the CoP
r6c5 = [0;0;0];
r7c6 = [0;0;0];
r8c7 = [0;L1 - r1;0];
r9c8 = [-L2 + r2;0;0];
r10c9 = [0;0;0];
r11c10 = [r;0;0];
I2 = [Ixx2,0,0;0,Iyy2,0;0,0,Izz2];
I3 = [Ixx3,0,0;0,Iyy3,0;0,0,Izz3];
I4 = [Ixx4,0,0;0,Iyy4,0;0,0,Izz4];
tau10 = I4*alp10 + cross(omg10,I4*omg10) + cross(r10c10,f10) - cross(r11c10,R100r*Fex);
tau9 = R910r*tau10 + cross(r9c9, f9) - cross(r10c9, R910r*f10);
tau8 = I3*alp8 + cross(omg8,I3*omg8) + R89r*tau9 + cross(r8c8,f8) - cross(r9c8,R89r*f9);
tau7 = I2*alp7 + cross(omg7,I2*omg7) + R78r*tau8 + cross(r7c7,f7) - cross(r8c7,R78r*f8);
tau6 = R67r*tau7 + cross(r6c6,f6) - cross(r7c6,R67r*f7);
tau5 = R56r*tau6 + cross(r5c5,f5) - cross(r6c5,R56r*f6);
%
T5 = R45r(3,:)*tau5;
T6 = R56r(3,:)*tau6;
T7 = R67r(3,:)*tau7;
T8 = R78r(3,:)*tau8;
T9 = R89r(3,:)*tau9;
T10 = R910r(3,:)*tau10;
%
vars = [T5 T6 T7 T8 T9 T10];
end
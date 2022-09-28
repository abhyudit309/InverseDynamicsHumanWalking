%%% compute joint torques for 3D case - only thigh and shank
function torques = torques3D_I(q,qdot,qddot,GRF)
%%%
global L r m MI g
L1 = L(1);
L2 = L(2);
r1 = r(1);
r2 = r(2);
m1 = m(1);
m2 = m(2);
Ixx1 = MI(1);
Iyy1 = MI(2);
Izz1 = MI(3);
Ixx2 = MI(4);
Iyy2 = MI(5);
Izz2 = MI(6);
xhip = q(1);
yhip = q(2);
zhip = q(3);
tht1 = q(4);
tht2 = q(5);
tht3 = q(6);
tht4 = q(7);
vxhip = qdot(1);
vyhip = qdot(2);
vzhip = qdot(3);
eps1 = qdot(4);
eps2 = qdot(5);
eps3 = qdot(6);
eps4 = qdot(7);
axhip = qddot(1);
ayhip = qddot(2);
azhip = qddot(3);
eta1 = qddot(4);
eta2 = qddot(5);
eta3 = qddot(6);
eta4 = qddot(7);
GRFx = GRF(1);
GRFy = GRF(2);
GRFz = GRF(3);

T4=(-1).*eta3.*Iyy1.*cos(tht2)+eta1.*Iyy1.*cos(tht2).^2+ayhip.*m2.* ...
  r2.*cos(tht1).*cos(tht2).*cos(tht3).*cos(tht4)+g.*m2.*r2.*cos( ...
  tht1).*cos(tht2).*cos(tht3).*cos(tht4)+(-2).*eps1.*eps2.*L1.*m2.* ...
  r2.*cos(tht2).^2.*cos(tht3).*cos(tht4)+(-1).*eta3.*Iyy2.*cos(tht2) ...
  .*cos(tht4).^2+(-1).*eta3.*m2.*r2.^2.*cos(tht2).*cos(tht4).^2+ ...
  eta1.*Iyy2.*cos(tht2).^2.*cos(tht4).^2+eta1.*m2.*r2.^2.*cos(tht2) ...
  .^2.*cos(tht4).^2+(-1).*axhip.*m2.*r2.*cos(tht2).*cos(tht3).*cos( ...
  tht4).*sin(tht1)+(-1).*eps1.*eps2.*Iyy1.*cos(tht2).*sin(tht2)+ ...
  eps2.*eps3.*Ixx1.*cos(tht3).^2.*sin(tht2)+eps2.*eps3.*Iyy1.*cos( ...
  tht3).^2.*sin(tht2)+(-1).*eps2.*eps3.*Izz1.*cos(tht3).^2.*sin( ...
  tht2)+(-1).*ayhip.*L1.*m2.*cos(tht1).*cos(tht3).^2.*sin(tht2)+(-1) ...
  .*g.*L1.*m2.*cos(tht1).*cos(tht3).^2.*sin(tht2)+(-1).*ayhip.*m1.* ...
  r1.*cos(tht1).*cos(tht3).^2.*sin(tht2)+(-1).*g.*m1.*r1.*cos(tht1) ...
  .*cos(tht3).^2.*sin(tht2)+(-1).*eps1.*eps2.*Iyy1.*cos(tht2).*cos( ...
  tht3).^2.*sin(tht2)+eta3.*L1.*m2.*r2.*cos(tht3).*cos(tht4).*sin( ...
  tht2)+(-1).*eps1.*eps2.*Iyy2.*cos(tht2).*cos(tht4).^2.*sin(tht2)+( ...
  -1).*eps1.*eps2.*m2.*r2.^2.*cos(tht2).*cos(tht4).^2.*sin(tht2)+ ...
  eps3.*eps4.*Ixx2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+(-1).*eps3.* ...
  eps4.*Iyy2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+eps3.*eps4.*Izz2.* ...
  cos(tht3).*cos(tht4).^2.*sin(tht2)+eps2.*eps3.*Ixx2.*cos(tht3) ...
  .^2.*cos(tht4).^2.*sin(tht2)+eps2.*eps3.*Iyy2.*cos(tht3).^2.*cos( ...
  tht4).^2.*sin(tht2)+(-1).*eps2.*eps3.*Izz2.*cos(tht3).^2.*cos( ...
  tht4).^2.*sin(tht2)+(-1).*eps1.*eps2.*Iyy2.*cos(tht2).*cos(tht3) ...
  .^2.*cos(tht4).^2.*sin(tht2)+(-1).*eps1.*eps2.*m2.*r2.^2.*cos( ...
  tht2).*cos(tht3).^2.*cos(tht4).^2.*sin(tht2)+axhip.*L1.*m2.*cos( ...
  tht3).^2.*sin(tht1).*sin(tht2)+axhip.*m1.*r1.*cos(tht3).^2.*sin( ...
  tht1).*sin(tht2)+eta1.*Ixx1.*cos(tht3).^2.*sin(tht2).^2+eta1.* ...
  L1.^2.*m2.*cos(tht3).^2.*sin(tht2).^2+eta1.*m1.*r1.^2.*cos(tht3) ...
  .^2.*sin(tht2).^2+eps1.*eps2.*L1.*m2.*r2.*cos(tht3).*cos(tht4).* ...
  sin(tht2).^2+(-2).*eps1.*eps4.*L1.*m2.*r2.*cos(tht3).^2.*cos(tht4) ...
  .*sin(tht2).^2+eps1.*eps2.*L1.*m2.*r2.*cos(tht3).^3.*cos(tht4).* ...
  sin(tht2).^2+eta1.*Ixx2.*cos(tht3).^2.*cos(tht4).^2.*sin(tht2).^2+ ...
  eps1.*eps2.*Ixx1.*cos(tht3).^2.*sin(2.*tht2)+eps1.*eps2.*L1.^2.* ...
  m2.*cos(tht3).^2.*sin(2.*tht2)+eps1.*eps2.*m1.*r1.^2.*cos(tht3) ...
  .^2.*sin(2.*tht2)+(-1).*eta1.*L1.*m2.*r2.*cos(tht3).*cos(tht4).* ...
  sin(2.*tht2)+(-1).*eps1.*eps4.*Ixx2.*cos(tht3).*cos(tht4).^2.*sin( ...
  2.*tht2)+eps1.*eps4.*Iyy2.*cos(tht3).*cos(tht4).^2.*sin(2.*tht2)+ ...
  eps1.*eps4.*m2.*r2.^2.*cos(tht3).*cos(tht4).^2.*sin(2.*tht2)+ ...
  eps1.*eps2.*Ixx2.*cos(tht3).^2.*cos(tht4).^2.*sin(2.*tht2)+ ...
  eps2.^2.*Ixx1.*cos(tht2).*cos(tht3).*sin(tht3)+(-1).*eps2.^2.* ...
  Izz1.*cos(tht2).*cos(tht3).*sin(tht3)+(-1).*eta2.*L1.*m2.*r2.*cos( ...
  tht2).*cos(tht4).*sin(tht3)+axhip.*m2.*r2.*cos(tht1).*cos(tht2) ...
  .^2.*cos(tht4).*sin(tht3)+(-1).*eps2.*eps4.*Ixx2.*cos(tht2).*cos( ...
  tht4).^2.*sin(tht3)+eps2.*eps4.*Iyy2.*cos(tht2).*cos(tht4).^2.* ...
  sin(tht3)+eps2.*eps4.*Izz2.*cos(tht2).*cos(tht4).^2.*sin(tht3)+2.* ...
  eps2.*eps4.*m2.*r2.^2.*cos(tht2).*cos(tht4).^2.*sin(tht3)+ ...
  eps2.^2.*Ixx2.*cos(tht2).*cos(tht3).*cos(tht4).^2.*sin(tht3)+(-1) ...
  .*eps2.^2.*Izz2.*cos(tht2).*cos(tht3).*cos(tht4).^2.*sin(tht3)+( ...
  -1).*eps2.^2.*m2.*r2.^2.*cos(tht2).*cos(tht3).*cos(tht4).^2.*sin( ...
  tht3)+ayhip.*m2.*r2.*cos(tht2).^2.*cos(tht4).*sin(tht1).*sin(tht3) ...
  +g.*m2.*r2.*cos(tht2).^2.*cos(tht4).*sin(tht1).*sin(tht3)+eta4.* ...
  Izz2.*sin(tht2).*sin(tht3)+eta4.*m2.*r2.^2.*sin(tht2).*sin(tht3)+ ...
  eta2.*Ixx1.*cos(tht3).*sin(tht2).*sin(tht3)+(-1).*eta2.*Izz1.*cos( ...
  tht3).*sin(tht2).*sin(tht3)+(-1).*eta2.*Izz2.*cos(tht3).*sin(tht2) ...
  .*sin(tht3)+eta2.*L1.^2.*m2.*cos(tht3).*sin(tht2).*sin(tht3)+(-1) ...
  .*eta2.*m2.*r2.^2.*cos(tht3).*sin(tht2).*sin(tht3)+(-1).*eps4.^2.* ...
  L1.*m2.*r2.*cos(tht4).*sin(tht2).*sin(tht3)+eps1.^2.*L1.*m2.*r2.* ...
  cos(tht2).^2.*cos(tht4).*sin(tht2).*sin(tht3)+eps2.^2.*L1.*m2.* ...
  r2.*cos(tht3).^2.*cos(tht4).*sin(tht2).*sin(tht3)+eta2.*Ixx2.*cos( ...
  tht3).*cos(tht4).^2.*sin(tht2).*sin(tht3)+(-1).*eta2.*L1.^2.*m2.* ...
  cos(tht3).*cos(tht4).^2.*sin(tht2).*sin(tht3)+(-1).*eps3.^2.*L1.* ...
  m2.*r2.*cos(tht4).^3.*sin(tht2).*sin(tht3)+(-1).*eps1.^2.*L1.*m2.* ...
  r2.*cos(tht2).^2.*cos(tht4).^3.*sin(tht2).*sin(tht3)+eps1.*eps3.* ...
  Izz2.*cos(tht3).*sin(tht2).^2.*sin(tht3)+GRFz.*L1.*cos(tht3).*sin( ...
  tht2).^2.*sin(tht3)+azhip.*L1.*m2.*cos(tht3).*sin(tht2).^2.*sin( ...
  tht3)+eps1.*eps3.*m2.*r2.^2.*cos(tht3).*sin(tht2).^2.*sin(tht3)+( ...
  -1).*eps1.^2.*L1.^2.*m2.*cos(tht2).*cos(tht3).*sin(tht2).^2.*sin( ...
  tht3)+axhip.*m2.*r2.*cos(tht1).*cos(tht4).*sin(tht2).^2.*sin(tht3) ...
  +eps1.*eps3.*Izz2.*cos(tht3).*cos(tht4).^2.*sin(tht2).^2.*sin( ...
  tht3)+(-1).*GRFz.*L1.*cos(tht3).*cos(tht4).^2.*sin(tht2).^2.*sin( ...
  tht3)+(-1).*azhip.*L1.*m2.*cos(tht3).*cos(tht4).^2.*sin(tht2).^2.* ...
  sin(tht3)+eps1.*eps3.*m2.*r2.^2.*cos(tht3).*cos(tht4).^2.*sin( ...
  tht2).^2.*sin(tht3)+eps1.^2.*L1.^2.*m2.*cos(tht2).*cos(tht3).*cos( ...
  tht4).^2.*sin(tht2).^2.*sin(tht3)+ayhip.*m2.*r2.*cos(tht4).*sin( ...
  tht1).*sin(tht2).^2.*sin(tht3)+g.*m2.*r2.*cos(tht4).*sin(tht1).* ...
  sin(tht2).^2.*sin(tht3)+eps1.*eps3.*L1.*m2.*r2.*cos(tht4).^3.*sin( ...
  2.*tht2).*sin(tht3)+(-1).*eps2.*eps3.*Ixx1.*sin(tht2).*sin(tht3) ...
  .^2+eps2.*eps3.*Iyy1.*sin(tht2).*sin(tht3).^2+eps2.*eps3.*Izz1.* ...
  sin(tht2).*sin(tht3).^2+eps2.*eps3.*Izz2.*sin(tht2).*sin(tht3).^2+ ...
  eps2.*eps3.*m2.*r2.^2.*sin(tht2).*sin(tht3).^2+(-1).*ayhip.*m1.* ...
  r1.*cos(tht1).*sin(tht2).*sin(tht3).^2+(-1).*g.*m1.*r1.*cos(tht1) ...
  .*sin(tht2).*sin(tht3).^2+(-1).*eps1.*eps2.*Iyy1.*cos(tht2).*sin( ...
  tht2).*sin(tht3).^2+eps1.*eps2.*Izz2.*cos(tht2).*sin(tht2).*sin( ...
  tht3).^2+eps1.*eps2.*m2.*r2.^2.*cos(tht2).*sin(tht2).*sin(tht3) ...
  .^2+(-1).*eps2.*eps3.*Ixx2.*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+ ...
  eps2.*eps3.*Iyy2.*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+eps2.* ...
  eps3.*m2.*r2.^2.*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+(-1).* ...
  ayhip.*L1.*m2.*cos(tht1).*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+( ...
  -1).*g.*L1.*m2.*cos(tht1).*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+( ...
  -1).*eps1.*eps2.*Iyy2.*cos(tht2).*cos(tht4).^2.*sin(tht2).*sin( ...
  tht3).^2+eps1.*eps2.*Izz2.*cos(tht2).*cos(tht4).^2.*sin(tht2).* ...
  sin(tht3).^2+axhip.*m1.*r1.*sin(tht1).*sin(tht2).*sin(tht3).^2+ ...
  axhip.*L1.*m2.*cos(tht4).^2.*sin(tht1).*sin(tht2).*sin(tht3).^2+ ...
  eta1.*Izz1.*sin(tht2).^2.*sin(tht3).^2+eta1.*Izz2.*sin(tht2).^2.* ...
  sin(tht3).^2+eta1.*m1.*r1.^2.*sin(tht2).^2.*sin(tht3).^2+eta1.* ...
  m2.*r2.^2.*sin(tht2).^2.*sin(tht3).^2+(-2).*eps1.*eps4.*L1.*m2.* ...
  r2.*cos(tht4).*sin(tht2).^2.*sin(tht3).^2+eps1.*eps2.*L1.*m2.*r2.* ...
  cos(tht3).*cos(tht4).*sin(tht2).^2.*sin(tht3).^2+eta1.*L1.^2.*m2.* ...
  cos(tht4).^2.*sin(tht2).^2.*sin(tht3).^2+eps1.*eps2.*Izz1.*sin(2.* ...
  tht2).*sin(tht3).^2+eps1.*eps2.*m1.*r1.^2.*sin(2.*tht2).*sin(tht3) ...
  .^2+eps1.*eps2.*L1.^2.*m2.*cos(tht4).^2.*sin(2.*tht2).*sin(tht3) ...
  .^2+eps2.^2.*L1.*m2.*r2.*cos(tht4).*sin(tht2).*sin(tht3).^3+(-1).* ...
  eps1.*eps3.*Ixx1.*sin(tht2).^2.*sin(2.*tht3)+eps1.*eps3.*Izz1.* ...
  sin(tht2).^2.*sin(2.*tht3)+(-1).*eps1.*eps3.*Ixx2.*cos(tht4).^2.* ...
  sin(tht2).^2.*sin(2.*tht3)+(-1/4).*axhip.*L1.*m2.*cos(tht1).*sin( ...
  2.*tht2).*sin(2.*tht3)+(1/4).*axhip.*L1.*m2.*cos(tht1).*cos(tht4) ...
  .^2.*sin(2.*tht2).*sin(2.*tht3)+(-1/4).*ayhip.*L1.*m2.*sin(tht1).* ...
  sin(2.*tht2).*sin(2.*tht3)+(-1/4).*g.*L1.*m2.*sin(tht1).*sin(2.* ...
  tht2).*sin(2.*tht3)+(1/4).*ayhip.*L1.*m2.*cos(tht4).^2.*sin(tht1) ...
  .*sin(2.*tht2).*sin(2.*tht3)+(1/4).*g.*L1.*m2.*cos(tht4).^2.*sin( ...
  tht1).*sin(2.*tht2).*sin(2.*tht3)+(-2).*eps3.*eps4.*L1.*m2.*r2.* ...
  cos(tht3).*sin(tht2).*sin(tht4)+ayhip.*m2.*r2.*cos(tht1).*cos( ...
  tht3).^2.*sin(tht2).*sin(tht4)+g.*m2.*r2.*cos(tht1).*cos(tht3) ...
  .^2.*sin(tht2).*sin(tht4)+eta3.*Ixx2.*cos(tht3).*cos(tht4).*sin( ...
  tht2).*sin(tht4)+(-1).*eta3.*Iyy2.*cos(tht3).*cos(tht4).*sin(tht2) ...
  .*sin(tht4)+(-1).*eta3.*m2.*r2.^2.*cos(tht3).*cos(tht4).*sin(tht2) ...
  .*sin(tht4)+(-1).*axhip.*m2.*r2.*cos(tht3).^2.*sin(tht1).*sin( ...
  tht2).*sin(tht4)+(-2).*eta1.*L1.*m2.*r2.*cos(tht3).^2.*sin(tht2) ...
  .^2.*sin(tht4)+eps1.*eps2.*Ixx2.*cos(tht3).*cos(tht4).*sin(tht2) ...
  .^2.*sin(tht4)+(-1).*eps1.*eps2.*Iyy2.*cos(tht3).*cos(tht4).*sin( ...
  tht2).^2.*sin(tht4)+(-1).*eps1.*eps2.*m2.*r2.^2.*cos(tht3).*cos( ...
  tht4).*sin(tht2).^2.*sin(tht4)+eps1.*eps2.*Ixx2.*cos(tht3).^3.* ...
  cos(tht4).*sin(tht2).^2.*sin(tht4)+(-1).*eps1.*eps2.*Iyy2.*cos( ...
  tht3).^3.*cos(tht4).*sin(tht2).^2.*sin(tht4)+(-1).*eps1.*eps2.* ...
  m2.*r2.^2.*cos(tht3).^3.*cos(tht4).*sin(tht2).^2.*sin(tht4)+eps1.* ...
  eps4.*L1.*m2.*r2.*cos(tht3).*sin(2.*tht2).*sin(tht4)+(-2).*eps1.* ...
  eps2.*L1.*m2.*r2.*cos(tht3).^2.*sin(2.*tht2).*sin(tht4)+(-1).* ...
  eta2.*Ixx2.*cos(tht2).*cos(tht4).*sin(tht3).*sin(tht4)+eta2.* ...
  Iyy2.*cos(tht2).*cos(tht4).*sin(tht3).*sin(tht4)+eta2.*m2.*r2.^2.* ...
  cos(tht2).*cos(tht4).*sin(tht3).*sin(tht4)+(-1).*eta4.*L1.*m2.* ...
  r2.*sin(tht2).*sin(tht3).*sin(tht4)+(-1).*eps3.^2.*Ixx2.*cos(tht4) ...
  .*sin(tht2).*sin(tht3).*sin(tht4)+eps3.^2.*Iyy2.*cos(tht4).*sin( ...
  tht2).*sin(tht3).*sin(tht4)+eps3.^2.*m2.*r2.^2.*cos(tht4).*sin( ...
  tht2).*sin(tht3).*sin(tht4)+eps2.^2.*Ixx2.*cos(tht3).^2.*cos(tht4) ...
  .*sin(tht2).*sin(tht3).*sin(tht4)+(-1).*eps2.^2.*Iyy2.*cos(tht3) ...
  .^2.*cos(tht4).*sin(tht2).*sin(tht3).*sin(tht4)+(-1).*eps2.^2.* ...
  m2.*r2.^2.*cos(tht3).^2.*cos(tht4).*sin(tht2).*sin(tht3).*sin( ...
  tht4)+(-1).*eps1.*eps3.*L1.*m2.*r2.*cos(tht3).*sin(tht2).^2.*sin( ...
  tht3).*sin(tht4)+eps1.^2.*L1.*m2.*r2.*cos(tht2).*cos(tht3).*sin( ...
  tht2).^2.*sin(tht3).*sin(tht4)+eps1.*eps3.*L1.*m2.*r2.*cos(tht3).* ...
  cos(tht4).^2.*sin(tht2).^2.*sin(tht3).*sin(tht4)+(-1).*eps1.^2.* ...
  L1.*m2.*r2.*cos(tht2).*cos(tht3).*cos(tht4).^2.*sin(tht2).^2.*sin( ...
  tht3).*sin(tht4)+(-1).*eps2.*eps3.*L1.*m2.*r2.*sin(tht2).*sin( ...
  tht3).^2.*sin(tht4)+ayhip.*m2.*r2.*cos(tht1).*sin(tht2).*sin(tht3) ...
  .^2.*sin(tht4)+g.*m2.*r2.*cos(tht1).*sin(tht2).*sin(tht3).^2.*sin( ...
  tht4)+(-3).*eps1.*eps2.*L1.*m2.*r2.*cos(tht2).*sin(tht2).*sin( ...
  tht3).^2.*sin(tht4)+eps2.*eps3.*L1.*m2.*r2.*cos(tht4).^2.*sin( ...
  tht2).*sin(tht3).^2.*sin(tht4)+(-1).*eps1.*eps2.*L1.*m2.*r2.*cos( ...
  tht2).*cos(tht4).^2.*sin(tht2).*sin(tht3).^2.*sin(tht4)+(-1).* ...
  axhip.*m2.*r2.*sin(tht1).*sin(tht2).*sin(tht3).^2.*sin(tht4)+(-2) ...
  .*eta1.*L1.*m2.*r2.*sin(tht2).^2.*sin(tht3).^2.*sin(tht4)+eps1.* ...
  eps2.*Ixx2.*cos(tht3).*cos(tht4).*sin(tht2).^2.*sin(tht3).^2.*sin( ...
  tht4)+(-1).*eps1.*eps2.*Iyy2.*cos(tht3).*cos(tht4).*sin(tht2).^2.* ...
  sin(tht3).^2.*sin(tht4)+(-1).*eps1.*eps2.*m2.*r2.^2.*cos(tht3).* ...
  cos(tht4).*sin(tht2).^2.*sin(tht3).^2.*sin(tht4)+eps2.^2.*Ixx2.* ...
  cos(tht4).*sin(tht2).*sin(tht3).^3.*sin(tht4)+(-1).*eps2.^2.* ...
  Iyy2.*cos(tht4).*sin(tht2).*sin(tht3).^3.*sin(tht4)+(-1).* ...
  eps2.^2.*m2.*r2.^2.*cos(tht4).*sin(tht2).*sin(tht3).^3.*sin(tht4)+ ...
  (-1).*eta3.*Ixx2.*cos(tht2).*sin(tht4).^2+eta1.*Ixx2.*cos(tht2) ...
  .^2.*sin(tht4).^2+(-1).*eps1.*eps2.*Ixx2.*cos(tht2).*sin(tht2).* ...
  sin(tht4).^2+(-1).*eps3.*eps4.*Ixx2.*cos(tht3).*sin(tht2).*sin( ...
  tht4).^2+eps3.*eps4.*Iyy2.*cos(tht3).*sin(tht2).*sin(tht4).^2+ ...
  eps3.*eps4.*Izz2.*cos(tht3).*sin(tht2).*sin(tht4).^2+2.*eps3.* ...
  eps4.*m2.*r2.^2.*cos(tht3).*sin(tht2).*sin(tht4).^2+eps2.*eps3.* ...
  Ixx2.*cos(tht3).^2.*sin(tht2).*sin(tht4).^2+eps2.*eps3.*Iyy2.*cos( ...
  tht3).^2.*sin(tht2).*sin(tht4).^2+(-1).*eps2.*eps3.*Izz2.*cos( ...
  tht3).^2.*sin(tht2).*sin(tht4).^2+(-1).*eps1.*eps2.*Ixx2.*cos( ...
  tht2).*cos(tht3).^2.*sin(tht2).*sin(tht4).^2+eta1.*Iyy2.*cos(tht3) ...
  .^2.*sin(tht2).^2.*sin(tht4).^2+eta1.*m2.*r2.^2.*cos(tht3).^2.* ...
  sin(tht2).^2.*sin(tht4).^2+eps1.*eps4.*Ixx2.*cos(tht3).*sin(2.* ...
  tht2).*sin(tht4).^2+(-1).*eps1.*eps4.*Iyy2.*cos(tht3).*sin(2.* ...
  tht2).*sin(tht4).^2+(-1).*eps1.*eps4.*m2.*r2.^2.*cos(tht3).*sin( ...
  2.*tht2).*sin(tht4).^2+eps1.*eps2.*Iyy2.*cos(tht3).^2.*sin(2.* ...
  tht2).*sin(tht4).^2+eps1.*eps2.*m2.*r2.^2.*cos(tht3).^2.*sin(2.* ...
  tht2).*sin(tht4).^2+eps2.*eps4.*Ixx2.*cos(tht2).*sin(tht3).*sin( ...
  tht4).^2+(-1).*eps2.*eps4.*Iyy2.*cos(tht2).*sin(tht3).*sin(tht4) ...
  .^2+eps2.*eps4.*Izz2.*cos(tht2).*sin(tht3).*sin(tht4).^2+eps2.^2.* ...
  Iyy2.*cos(tht2).*cos(tht3).*sin(tht3).*sin(tht4).^2+(-1).* ...
  eps2.^2.*Izz2.*cos(tht2).*cos(tht3).*sin(tht3).*sin(tht4).^2+ ...
  eta2.*Iyy2.*cos(tht3).*sin(tht2).*sin(tht3).*sin(tht4).^2+(-1).* ...
  eta2.*L1.^2.*m2.*cos(tht3).*sin(tht2).*sin(tht3).*sin(tht4).^2+ ...
  eta2.*m2.*r2.^2.*cos(tht3).*sin(tht2).*sin(tht3).*sin(tht4).^2+( ...
  -1).*eps3.^2.*L1.*m2.*r2.*cos(tht4).*sin(tht2).*sin(tht3).*sin( ...
  tht4).^2+(-1).*eps1.^2.*L1.*m2.*r2.*cos(tht2).^2.*cos(tht4).*sin( ...
  tht2).*sin(tht3).*sin(tht4).^2+eps1.*eps3.*Izz2.*cos(tht3).*sin( ...
  tht2).^2.*sin(tht3).*sin(tht4).^2+(-1).*GRFz.*L1.*cos(tht3).*sin( ...
  tht2).^2.*sin(tht3).*sin(tht4).^2+(-1).*azhip.*L1.*m2.*cos(tht3).* ...
  sin(tht2).^2.*sin(tht3).*sin(tht4).^2+(-1).*eps1.*eps3.*m2.* ...
  r2.^2.*cos(tht3).*sin(tht2).^2.*sin(tht3).*sin(tht4).^2+eps1.^2.* ...
  L1.^2.*m2.*cos(tht2).*cos(tht3).*sin(tht2).^2.*sin(tht3).*sin( ...
  tht4).^2+eps1.*eps3.*L1.*m2.*r2.*cos(tht4).*sin(2.*tht2).*sin( ...
  tht3).*sin(tht4).^2+eps2.*eps3.*Ixx2.*sin(tht2).*sin(tht3).^2.* ...
  sin(tht4).^2+(-1).*eps2.*eps3.*Iyy2.*sin(tht2).*sin(tht3).^2.*sin( ...
  tht4).^2+(-1).*eps2.*eps3.*m2.*r2.^2.*sin(tht2).*sin(tht3).^2.* ...
  sin(tht4).^2+(-1).*ayhip.*L1.*m2.*cos(tht1).*sin(tht2).*sin(tht3) ...
  .^2.*sin(tht4).^2+(-1).*g.*L1.*m2.*cos(tht1).*sin(tht2).*sin(tht3) ...
  .^2.*sin(tht4).^2+(-1).*eps1.*eps2.*Ixx2.*cos(tht2).*sin(tht2).* ...
  sin(tht3).^2.*sin(tht4).^2+eps1.*eps2.*Izz2.*cos(tht2).*sin(tht2) ...
  .*sin(tht3).^2.*sin(tht4).^2+eps1.*eps2.*m2.*r2.^2.*cos(tht2).* ...
  sin(tht2).*sin(tht3).^2.*sin(tht4).^2+axhip.*L1.*m2.*sin(tht1).* ...
  sin(tht2).*sin(tht3).^2.*sin(tht4).^2+eta1.*L1.^2.*m2.*sin(tht2) ...
  .^2.*sin(tht3).^2.*sin(tht4).^2+eps1.*eps2.*L1.^2.*m2.*sin(2.* ...
  tht2).*sin(tht3).^2.*sin(tht4).^2+(-1).*eps1.*eps3.*Iyy2.*sin( ...
  tht2).^2.*sin(2.*tht3).*sin(tht4).^2+(1/4).*axhip.*L1.*m2.*cos( ...
  tht1).*sin(2.*tht2).*sin(2.*tht3).*sin(tht4).^2+(1/4).*ayhip.*L1.* ...
  m2.*sin(tht1).*sin(2.*tht2).*sin(2.*tht3).*sin(tht4).^2+(1/4).*g.* ...
  L1.*m2.*sin(tht1).*sin(2.*tht2).*sin(2.*tht3).*sin(tht4).^2+eps1.* ...
  eps3.*L1.*m2.*r2.*cos(tht3).*sin(tht2).^2.*sin(tht3).*sin(tht4) ...
  .^3+(-1).*eps1.^2.*L1.*m2.*r2.*cos(tht2).*cos(tht3).*sin(tht2) ...
  .^2.*sin(tht3).*sin(tht4).^3+eps2.*eps3.*L1.*m2.*r2.*sin(tht2).* ...
  sin(tht3).^2.*sin(tht4).^3+(-1).*eps1.*eps2.*L1.*m2.*r2.*cos(tht2) ...
  .*sin(tht2).*sin(tht3).^2.*sin(tht4).^3+GRFx.*(L1.*sin(tht1).*sin( ...
  tht2)+(-1).*L2.*(cos(tht2).*cos(tht3).*cos(tht4).*sin(tht1)+(-1).* ...
  cos(tht1).*cos(tht4).*sin(tht3)+sin(tht1).*sin(tht2).*sin(tht4)))+ ...
  GRFy.*((-1).*L1.*cos(tht1).*sin(tht2)+L2.*(cos(tht4).*sin(tht1).* ...
  sin(tht3)+cos(tht1).*(cos(tht2).*cos(tht3).*cos(tht4)+sin(tht2).* ...
  sin(tht4))))+(-1).*eps3.*eps4.*Ixx2.*cos(tht2).*sin(2.*tht4)+ ...
  eps3.*eps4.*Iyy2.*cos(tht2).*sin(2.*tht4)+eps3.*eps4.*m2.*r2.^2.* ...
  cos(tht2).*sin(2.*tht4)+eps1.*eps4.*Ixx2.*cos(tht2).^2.*sin(2.* ...
  tht4)+(-1).*eps1.*eps4.*Iyy2.*cos(tht2).^2.*sin(2.*tht4)+(-1).* ...
  eps1.*eps4.*m2.*r2.^2.*cos(tht2).^2.*sin(2.*tht4)+(-1).*eps1.* ...
  eps2.*Ixx2.*cos(tht2).^2.*cos(tht3).*sin(2.*tht4)+eps1.*eps2.* ...
  Iyy2.*cos(tht2).^2.*cos(tht3).*sin(2.*tht4)+eps1.*eps2.*m2.* ...
  r2.^2.*cos(tht2).^2.*cos(tht3).*sin(2.*tht4)+(-1).*eps1.*eps4.* ...
  Ixx2.*cos(tht3).^2.*sin(tht2).^2.*sin(2.*tht4)+eps1.*eps4.*Iyy2.* ...
  cos(tht3).^2.*sin(tht2).^2.*sin(2.*tht4)+eps1.*eps4.*m2.*r2.^2.* ...
  cos(tht3).^2.*sin(tht2).^2.*sin(2.*tht4)+(-1/2).*eta1.*Ixx2.*cos( ...
  tht3).*sin(2.*tht2).*sin(2.*tht4)+(1/2).*eta1.*Iyy2.*cos(tht3).* ...
  sin(2.*tht2).*sin(2.*tht4)+(1/2).*eta1.*m2.*r2.^2.*cos(tht3).*sin( ...
  2.*tht2).*sin(2.*tht4)+(1/2).*eps1.*eps3.*Ixx2.*sin(2.*tht2).*sin( ...
  tht3).*sin(2.*tht4)+(-1/2).*eps1.*eps3.*Iyy2.*sin(2.*tht2).*sin( ...
  tht3).*sin(2.*tht4)+(-1/2).*eps1.*eps3.*m2.*r2.^2.*sin(2.*tht2).* ...
  sin(tht3).*sin(2.*tht4)+(-1/2).*eps2.*eps4.*Ixx2.*sin(tht2).*sin( ...
  2.*tht3).*sin(2.*tht4)+(1/2).*eps2.*eps4.*Iyy2.*sin(tht2).*sin(2.* ...
  tht3).*sin(2.*tht4)+(1/2).*eps2.*eps4.*m2.*r2.^2.*sin(tht2).*sin( ...
  2.*tht3).*sin(2.*tht4);

T5=(1/4).*(2.*eta2.*Ixx1+eta2.*Ixx2+eta2.*Iyy2+2.*eta2.*Izz1+2.* ...
  eta2.*Izz2+4.*eta2.*L1.^2.*m2+4.*eta2.*m1.*r1.^2+3.*eta2.*m2.* ...
  r2.^2+(-4).*axhip.*L1.*m2.*cos(tht1).*cos(tht2)+(-4).*axhip.*m1.* ...
  r1.*cos(tht1).*cos(tht2)+(-4).*eta4.*Izz2.*cos(tht3)+(-4).*eta4.* ...
  m2.*r2.^2.*cos(tht3)+(-2).*eta2.*Ixx1.*cos(tht3).^2+(-1).*eta2.* ...
  Ixx2.*cos(tht3).^2+(-1).*eta2.*Iyy2.*cos(tht3).^2+2.*eta2.*Izz1.* ...
  cos(tht3).^2+2.*eta2.*Izz2.*cos(tht3).^2+eta2.*m2.*r2.^2.*cos( ...
  tht3).^2+(-8).*eps2.*eps4.*L1.*m2.*r2.*cos(tht4)+4.*eps3.^2.*L1.* ...
  m2.*r2.*cos(tht3).*cos(tht4)+4.*eps4.^2.*L1.*m2.*r2.*cos(tht3).* ...
  cos(tht4)+(-4).*GRFz.*L2.*cos(tht2).*cos(tht3).*cos(tht4)+(-4).* ...
  azhip.*m2.*r2.*cos(tht2).*cos(tht3).*cos(tht4)+(-8).*eps1.*eps3.* ...
  L1.*m2.*r2.*cos(tht2).*cos(tht3).*cos(tht4)+4.*eps1.^2.*L1.*m2.* ...
  r2.*cos(tht2).^2.*cos(tht3).*cos(tht4)+eta2.*Ixx2.*cos(tht4).^2+( ...
  -1).*eta2.*Iyy2.*cos(tht4).^2+(-1).*eta2.*m2.*r2.^2.*cos(tht4).^2+ ...
  (-1).*eta2.*Ixx2.*cos(tht3).^2.*cos(tht4).^2+eta2.*Iyy2.*cos(tht3) ...
  .^2.*cos(tht4).^2+eta2.*m2.*r2.^2.*cos(tht3).^2.*cos(tht4).^2+(-4) ...
  .*ayhip.*L1.*m2.*cos(tht2).*sin(tht1)+(-4).*g.*L1.*m2.*cos(tht2).* ...
  sin(tht1)+(-4).*ayhip.*m1.*r1.*cos(tht2).*sin(tht1)+(-4).*g.*m1.* ...
  r1.*cos(tht2).*sin(tht1)+(-2).*eps1.*eps3.*Ixx2.*sin(tht2)+(-4).* ...
  eps1.*eps3.*Iyy1.*sin(tht2)+(-2).*eps1.*eps3.*Iyy2.*sin(tht2)+4.* ...
  GRFz.*L1.*sin(tht2)+4.*azhip.*L1.*m2.*sin(tht2)+4.*azhip.*m1.*r1.* ...
  sin(tht2)+(-2).*eps1.*eps3.*m2.*r2.^2.*sin(tht2)+eps1.^2.*Ixx2.* ...
  cos(tht2).*sin(tht2)+eps1.^2.*Iyy2.*cos(tht2).*sin(tht2)+(-1).* ...
  eps1.^2.*m2.*r2.^2.*cos(tht2).*sin(tht2)+4.*eps1.*eps3.*Ixx1.*cos( ...
  tht3).^2.*sin(tht2)+2.*eps1.*eps3.*Ixx2.*cos(tht3).^2.*sin(tht2)+ ...
  2.*eps1.*eps3.*Iyy2.*cos(tht3).^2.*sin(tht2)+(-4).*eps1.*eps3.* ...
  Izz1.*cos(tht3).^2.*sin(tht2)+(-4).*eps1.*eps3.*Izz2.*cos(tht3) ...
  .^2.*sin(tht2)+(-2).*eps1.*eps3.*m2.*r2.^2.*cos(tht3).^2.*sin( ...
  tht2)+(-1).*eps1.^2.*Ixx2.*cos(tht2).*cos(tht3).^2.*sin(tht2)+(-1) ...
  .*eps1.^2.*Iyy2.*cos(tht2).*cos(tht3).^2.*sin(tht2)+eps1.^2.*m2.* ...
  r2.^2.*cos(tht2).*cos(tht3).^2.*sin(tht2)+(-4).*axhip.*m2.*r2.* ...
  cos(tht1).*cos(tht3).*cos(tht4).*sin(tht2)+2.*eps1.*eps3.*Ixx2.* ...
  cos(tht4).^2.*sin(tht2)+(-2).*eps1.*eps3.*Iyy2.*cos(tht4).^2.*sin( ...
  tht2)+(-2).*eps1.*eps3.*m2.*r2.^2.*cos(tht4).^2.*sin(tht2)+(-3).* ...
  eps1.^2.*Ixx2.*cos(tht2).*cos(tht4).^2.*sin(tht2)+3.*eps1.^2.* ...
  Iyy2.*cos(tht2).*cos(tht4).^2.*sin(tht2)+3.*eps1.^2.*m2.*r2.^2.* ...
  cos(tht2).*cos(tht4).^2.*sin(tht2)+2.*eps1.*eps3.*Ixx2.*cos(tht3) ...
  .^2.*cos(tht4).^2.*sin(tht2)+(-2).*eps1.*eps3.*Iyy2.*cos(tht3) ...
  .^2.*cos(tht4).^2.*sin(tht2)+(-2).*eps1.*eps3.*m2.*r2.^2.*cos( ...
  tht3).^2.*cos(tht4).^2.*sin(tht2)+(-1).*eps1.^2.*Ixx2.*cos(tht2).* ...
  cos(tht3).^2.*cos(tht4).^2.*sin(tht2)+eps1.^2.*Iyy2.*cos(tht2).* ...
  cos(tht3).^2.*cos(tht4).^2.*sin(tht2)+eps1.^2.*m2.*r2.^2.*cos( ...
  tht2).*cos(tht3).^2.*cos(tht4).^2.*sin(tht2)+(-4).*ayhip.*m2.*r2.* ...
  cos(tht3).*cos(tht4).*sin(tht1).*sin(tht2)+(-4).*g.*m2.*r2.*cos( ...
  tht3).*cos(tht4).*sin(tht1).*sin(tht2)+(-4).*eps1.^2.*L1.*m2.*r2.* ...
  cos(tht3).*cos(tht4).*sin(tht2).^2+(-1).*eps1.^2.*Ixx1.*sin(2.* ...
  tht2)+2.*eps1.^2.*Iyy1.*sin(2.*tht2)+(-1).*eps1.^2.*Izz1.*sin(2.* ...
  tht2)+(-1).*eps1.^2.*Izz2.*sin(2.*tht2)+(-2).*eps1.^2.*L1.^2.*m2.* ...
  sin(2.*tht2)+(-2).*eps1.^2.*m1.*r1.^2.*sin(2.*tht2)+(-1).* ...
  eps1.^2.*Ixx1.*cos(tht3).^2.*sin(2.*tht2)+eps1.^2.*Izz1.*cos(tht3) ...
  .^2.*sin(2.*tht2)+eps1.^2.*Izz2.*cos(tht3).^2.*sin(2.*tht2)+4.* ...
  eps3.*eps4.*Izz2.*sin(tht3)+4.*eps3.*eps4.*m2.*r2.^2.*sin(tht3)+( ...
  -4).*eps1.*eps4.*Izz2.*cos(tht2).*sin(tht3)+(-4).*eps1.*eps4.*m2.* ...
  r2.^2.*cos(tht2).*sin(tht3)+4.*eta3.*L1.*m2.*r2.*cos(tht4).*sin( ...
  tht3)+(-4).*eta1.*L1.*m2.*r2.*cos(tht2).*cos(tht4).*sin(tht3)+4.* ...
  eps3.*eps4.*Ixx2.*cos(tht4).^2.*sin(tht3)+(-4).*eps3.*eps4.*Iyy2.* ...
  cos(tht4).^2.*sin(tht3)+(-4).*eps3.*eps4.*m2.*r2.^2.*cos(tht4) ...
  .^2.*sin(tht3)+(-4).*eps1.*eps4.*Ixx2.*cos(tht2).*cos(tht4).^2.* ...
  sin(tht3)+4.*eps1.*eps4.*Iyy2.*cos(tht2).*cos(tht4).^2.*sin(tht3)+ ...
  4.*eps1.*eps4.*m2.*r2.^2.*cos(tht2).*cos(tht4).^2.*sin(tht3)+2.* ...
  eta2.*Ixx1.*sin(tht3).^2+eta2.*Ixx2.*sin(tht3).^2+eta2.*Iyy2.*sin( ...
  tht3).^2+(-2).*eta2.*Izz1.*sin(tht3).^2+(-2).*eta2.*Izz2.*sin( ...
  tht3).^2+(-1).*eta2.*m2.*r2.^2.*sin(tht3).^2+eta2.*Ixx2.*cos(tht4) ...
  .^2.*sin(tht3).^2+(-1).*eta2.*Iyy2.*cos(tht4).^2.*sin(tht3).^2+( ...
  -1).*eta2.*m2.*r2.^2.*cos(tht4).^2.*sin(tht3).^2+(-4).*eps1.* ...
  eps3.*Ixx1.*sin(tht2).*sin(tht3).^2+(-2).*eps1.*eps3.*Ixx2.*sin( ...
  tht2).*sin(tht3).^2+(-2).*eps1.*eps3.*Iyy2.*sin(tht2).*sin(tht3) ...
  .^2+4.*eps1.*eps3.*Izz1.*sin(tht2).*sin(tht3).^2+4.*eps1.*eps3.* ...
  Izz2.*sin(tht2).*sin(tht3).^2+2.*eps1.*eps3.*m2.*r2.^2.*sin(tht2) ...
  .*sin(tht3).^2+eps1.^2.*Ixx2.*cos(tht2).*sin(tht2).*sin(tht3).^2+ ...
  eps1.^2.*Iyy2.*cos(tht2).*sin(tht2).*sin(tht3).^2+(-1).*eps1.^2.* ...
  m2.*r2.^2.*cos(tht2).*sin(tht2).*sin(tht3).^2+(-2).*eps1.*eps3.* ...
  Ixx2.*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+2.*eps1.*eps3.*Iyy2.* ...
  cos(tht4).^2.*sin(tht2).*sin(tht3).^2+2.*eps1.*eps3.*m2.*r2.^2.* ...
  cos(tht4).^2.*sin(tht2).*sin(tht3).^2+eps1.^2.*Ixx2.*cos(tht2).* ...
  cos(tht4).^2.*sin(tht2).*sin(tht3).^2+(-1).*eps1.^2.*Iyy2.*cos( ...
  tht2).*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+(-1).*eps1.^2.*m2.* ...
  r2.^2.*cos(tht2).*cos(tht4).^2.*sin(tht2).*sin(tht3).^2+eps1.^2.* ...
  Ixx1.*sin(2.*tht2).*sin(tht3).^2+(-1).*eps1.^2.*Izz1.*sin(2.*tht2) ...
  .*sin(tht3).^2+(-1).*eps1.^2.*Izz2.*sin(2.*tht2).*sin(tht3).^2+4.* ...
  eps2.*eps3.*Ixx1.*sin(2.*tht3)+2.*eps2.*eps3.*Ixx2.*sin(2.*tht3)+ ...
  2.*eps2.*eps3.*Iyy2.*sin(2.*tht3)+(-4).*eps2.*eps3.*Izz1.*sin(2.* ...
  tht3)+(-4).*eps2.*eps3.*Izz2.*sin(2.*tht3)+(-2).*eps2.*eps3.*m2.* ...
  r2.^2.*sin(2.*tht3)+2.*eps2.*eps3.*Ixx2.*cos(tht4).^2.*sin(2.* ...
  tht3)+(-2).*eps2.*eps3.*Iyy2.*cos(tht4).^2.*sin(2.*tht3)+(-2).* ...
  eps2.*eps3.*m2.*r2.^2.*cos(tht4).^2.*sin(2.*tht3)+2.*eta1.*Ixx1.* ...
  sin(tht2).*sin(2.*tht3)+eta1.*Ixx2.*sin(tht2).*sin(2.*tht3)+eta1.* ...
  Iyy2.*sin(tht2).*sin(2.*tht3)+(-2).*eta1.*Izz1.*sin(tht2).*sin(2.* ...
  tht3)+(-2).*eta1.*Izz2.*sin(tht2).*sin(2.*tht3)+(-1).*eta1.*m2.* ...
  r2.^2.*sin(tht2).*sin(2.*tht3)+eta1.*Ixx2.*cos(tht4).^2.*sin(tht2) ...
  .*sin(2.*tht3)+(-1).*eta1.*Iyy2.*cos(tht4).^2.*sin(tht2).*sin(2.* ...
  tht3)+(-1).*eta1.*m2.*r2.^2.*cos(tht4).^2.*sin(tht2).*sin(2.*tht3) ...
  +(-8).*eta2.*L1.*m2.*r2.*sin(tht4)+4.*axhip.*m2.*r2.*cos(tht1).* ...
  cos(tht2).*sin(tht4)+4.*eta4.*L1.*m2.*r2.*cos(tht3).*sin(tht4)+4.* ...
  ayhip.*m2.*r2.*cos(tht2).*sin(tht1).*sin(tht4)+4.*g.*m2.*r2.*cos( ...
  tht2).*sin(tht1).*sin(tht4)+(-4).*GRFz.*L2.*sin(tht2).*sin(tht4)+( ...
  -4).*azhip.*m2.*r2.*sin(tht2).*sin(tht4)+4.*eps1.^2.*L1.*m2.*r2.* ...
  sin(2.*tht2).*sin(tht4)+(-8).*eps3.*eps4.*L1.*m2.*r2.*sin(tht3).* ...
  sin(tht4)+8.*eps1.*eps4.*L1.*m2.*r2.*cos(tht2).*sin(tht3).*sin( ...
  tht4)+(-1).*eta2.*Ixx2.*sin(tht4).^2+eta2.*Iyy2.*sin(tht4).^2+ ...
  eta2.*m2.*r2.^2.*sin(tht4).^2+eta2.*Ixx2.*cos(tht3).^2.*sin(tht4) ...
  .^2+(-1).*eta2.*Iyy2.*cos(tht3).^2.*sin(tht4).^2+(-1).*eta2.*m2.* ...
  r2.^2.*cos(tht3).^2.*sin(tht4).^2+(-2).*eps1.*eps3.*Ixx2.*sin( ...
  tht2).*sin(tht4).^2+2.*eps1.*eps3.*Iyy2.*sin(tht2).*sin(tht4).^2+ ...
  2.*eps1.*eps3.*m2.*r2.^2.*sin(tht2).*sin(tht4).^2+3.*eps1.^2.* ...
  Ixx2.*cos(tht2).*sin(tht2).*sin(tht4).^2+(-3).*eps1.^2.*Iyy2.*cos( ...
  tht2).*sin(tht2).*sin(tht4).^2+(-3).*eps1.^2.*m2.*r2.^2.*cos(tht2) ...
  .*sin(tht2).*sin(tht4).^2+(-2).*eps1.*eps3.*Ixx2.*cos(tht3).^2.* ...
  sin(tht2).*sin(tht4).^2+2.*eps1.*eps3.*Iyy2.*cos(tht3).^2.*sin( ...
  tht2).*sin(tht4).^2+2.*eps1.*eps3.*m2.*r2.^2.*cos(tht3).^2.*sin( ...
  tht2).*sin(tht4).^2+eps1.^2.*Ixx2.*cos(tht2).*cos(tht3).^2.*sin( ...
  tht2).*sin(tht4).^2+(-1).*eps1.^2.*Iyy2.*cos(tht2).*cos(tht3).^2.* ...
  sin(tht2).*sin(tht4).^2+(-1).*eps1.^2.*m2.*r2.^2.*cos(tht2).*cos( ...
  tht3).^2.*sin(tht2).*sin(tht4).^2+(-4).*eps3.*eps4.*Ixx2.*sin( ...
  tht3).*sin(tht4).^2+4.*eps3.*eps4.*Iyy2.*sin(tht3).*sin(tht4).^2+ ...
  4.*eps3.*eps4.*m2.*r2.^2.*sin(tht3).*sin(tht4).^2+4.*eps1.*eps4.* ...
  Ixx2.*cos(tht2).*sin(tht3).*sin(tht4).^2+(-4).*eps1.*eps4.*Iyy2.* ...
  cos(tht2).*sin(tht3).*sin(tht4).^2+(-4).*eps1.*eps4.*m2.*r2.^2.* ...
  cos(tht2).*sin(tht3).*sin(tht4).^2+(-1).*eta2.*Ixx2.*sin(tht3) ...
  .^2.*sin(tht4).^2+eta2.*Iyy2.*sin(tht3).^2.*sin(tht4).^2+eta2.* ...
  m2.*r2.^2.*sin(tht3).^2.*sin(tht4).^2+2.*eps1.*eps3.*Ixx2.*sin( ...
  tht2).*sin(tht3).^2.*sin(tht4).^2+(-2).*eps1.*eps3.*Iyy2.*sin( ...
  tht2).*sin(tht3).^2.*sin(tht4).^2+(-2).*eps1.*eps3.*m2.*r2.^2.* ...
  sin(tht2).*sin(tht3).^2.*sin(tht4).^2+(-1).*eps1.^2.*Ixx2.*cos( ...
  tht2).*sin(tht2).*sin(tht3).^2.*sin(tht4).^2+eps1.^2.*Iyy2.*cos( ...
  tht2).*sin(tht2).*sin(tht3).^2.*sin(tht4).^2+eps1.^2.*m2.*r2.^2.* ...
  cos(tht2).*sin(tht2).*sin(tht3).^2.*sin(tht4).^2+(-2).*eps2.* ...
  eps3.*Ixx2.*sin(2.*tht3).*sin(tht4).^2+2.*eps2.*eps3.*Iyy2.*sin( ...
  2.*tht3).*sin(tht4).^2+2.*eps2.*eps3.*m2.*r2.^2.*sin(2.*tht3).* ...
  sin(tht4).^2+(-1).*eta1.*Ixx2.*sin(tht2).*sin(2.*tht3).*sin(tht4) ...
  .^2+eta1.*Iyy2.*sin(tht2).*sin(2.*tht3).*sin(tht4).^2+eta1.*m2.* ...
  r2.^2.*sin(tht2).*sin(2.*tht3).*sin(tht4).^2+(-4).*GRFx.*cos(tht1) ...
  .*(L1.*cos(tht2)+L2.*(cos(tht3).*cos(tht4).*sin(tht2)+(-1).*cos( ...
  tht2).*sin(tht4)))+(-4).*GRFy.*sin(tht1).*(L1.*cos(tht2)+L2.*(cos( ...
  tht3).*cos(tht4).*sin(tht2)+(-1).*cos(tht2).*sin(tht4)))+(-2).* ...
  eps2.*eps4.*Ixx2.*sin(2.*tht4)+2.*eps2.*eps4.*Iyy2.*sin(2.*tht4)+ ...
  2.*eps2.*eps4.*m2.*r2.^2.*sin(2.*tht4)+2.*eps3.^2.*Ixx2.*cos(tht3) ...
  .*sin(2.*tht4)+(-2).*eps3.^2.*Iyy2.*cos(tht3).*sin(2.*tht4)+(-2).* ...
  eps3.^2.*m2.*r2.^2.*cos(tht3).*sin(2.*tht4)+(-4).*eps1.*eps3.* ...
  Ixx2.*cos(tht2).*cos(tht3).*sin(2.*tht4)+4.*eps1.*eps3.*Iyy2.*cos( ...
  tht2).*cos(tht3).*sin(2.*tht4)+4.*eps1.*eps3.*m2.*r2.^2.*cos(tht2) ...
  .*cos(tht3).*sin(2.*tht4)+2.*eps1.^2.*Ixx2.*cos(tht2).^2.*cos( ...
  tht3).*sin(2.*tht4)+(-2).*eps1.^2.*Iyy2.*cos(tht2).^2.*cos(tht3).* ...
  sin(2.*tht4)+(-2).*eps1.^2.*m2.*r2.^2.*cos(tht2).^2.*cos(tht3).* ...
  sin(2.*tht4)+2.*eps2.*eps4.*Ixx2.*cos(tht3).^2.*sin(2.*tht4)+(-2) ...
  .*eps2.*eps4.*Iyy2.*cos(tht3).^2.*sin(2.*tht4)+(-2).*eps2.*eps4.* ...
  m2.*r2.^2.*cos(tht3).^2.*sin(2.*tht4)+(-2).*eps1.^2.*Ixx2.*cos( ...
  tht3).*sin(tht2).^2.*sin(2.*tht4)+2.*eps1.^2.*Iyy2.*cos(tht3).* ...
  sin(tht2).^2.*sin(2.*tht4)+2.*eps1.^2.*m2.*r2.^2.*cos(tht3).*sin( ...
  tht2).^2.*sin(2.*tht4)+2.*eta3.*Ixx2.*sin(tht3).*sin(2.*tht4)+(-2) ...
  .*eta3.*Iyy2.*sin(tht3).*sin(2.*tht4)+(-2).*eta3.*m2.*r2.^2.*sin( ...
  tht3).*sin(2.*tht4)+(-2).*eta1.*Ixx2.*cos(tht2).*sin(tht3).*sin( ...
  2.*tht4)+2.*eta1.*Iyy2.*cos(tht2).*sin(tht3).*sin(2.*tht4)+2.* ...
  eta1.*m2.*r2.^2.*cos(tht2).*sin(tht3).*sin(2.*tht4)+(-2).*eps2.* ...
  eps4.*Ixx2.*sin(tht3).^2.*sin(2.*tht4)+2.*eps2.*eps4.*Iyy2.*sin( ...
  tht3).^2.*sin(2.*tht4)+2.*eps2.*eps4.*m2.*r2.^2.*sin(tht3).^2.* ...
  sin(2.*tht4)+(-2).*eps1.*eps4.*Ixx2.*sin(tht2).*sin(2.*tht3).*sin( ...
  2.*tht4)+2.*eps1.*eps4.*Iyy2.*sin(tht2).*sin(2.*tht3).*sin(2.* ...
  tht4)+2.*eps1.*eps4.*m2.*r2.^2.*sin(tht2).*sin(2.*tht3).*sin(2.* ...
  tht4));

T6=eta3.*Iyy1+(-1).*eta1.*Iyy1.*cos(tht2)+(-1).*ayhip.*m2.*r2.*cos( ...
  tht1).*cos(tht3).*cos(tht4)+(-1).*g.*m2.*r2.*cos(tht1).*cos(tht3) ...
  .*cos(tht4)+2.*eps1.*eps2.*L1.*m2.*r2.*cos(tht2).*cos(tht3).*cos( ...
  tht4)+eta3.*Iyy2.*cos(tht4).^2+eta3.*m2.*r2.^2.*cos(tht4).^2+(-1) ...
  .*eta1.*Iyy2.*cos(tht2).*cos(tht4).^2+(-1).*eta1.*m2.*r2.^2.*cos( ...
  tht2).*cos(tht4).^2+axhip.*m2.*r2.*cos(tht3).*cos(tht4).*sin(tht1) ...
  +eps1.*eps2.*Iyy1.*sin(tht2)+(-1).*eps1.*eps2.*Ixx1.*cos(tht3) ...
  .^2.*sin(tht2)+eps1.*eps2.*Izz1.*cos(tht3).^2.*sin(tht2)+eta1.* ...
  L1.*m2.*r2.*cos(tht3).*cos(tht4).*sin(tht2)+eps1.*eps2.*Iyy2.*cos( ...
  tht4).^2.*sin(tht2)+eps1.*eps2.*m2.*r2.^2.*cos(tht4).^2.*sin(tht2) ...
  +eps1.*eps4.*Ixx2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+(-1).*eps1.* ...
  eps4.*Iyy2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+(-1).*eps1.*eps4.* ...
  Izz2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+(-2).*eps1.*eps4.*m2.* ...
  r2.^2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+(-1).*eps1.*eps2.*Ixx2.* ...
  cos(tht3).^2.*cos(tht4).^2.*sin(tht2)+eps1.*eps2.*Izz2.*cos(tht3) ...
  .^2.*cos(tht4).^2.*sin(tht2)+eps1.*eps2.*m2.*r2.^2.*cos(tht3).^2.* ...
  cos(tht4).^2.*sin(tht2)+(-1).*eps2.^2.*Ixx1.*cos(tht3).*sin(tht3)+ ...
  eps2.^2.*Izz1.*cos(tht3).*sin(tht3)+eta2.*L1.*m2.*r2.*cos(tht4).* ...
  sin(tht3)+(-1).*axhip.*m2.*r2.*cos(tht1).*cos(tht2).*cos(tht4).* ...
  sin(tht3)+eps2.*eps4.*Ixx2.*cos(tht4).^2.*sin(tht3)+(-1).*eps2.* ...
  eps4.*Iyy2.*cos(tht4).^2.*sin(tht3)+(-1).*eps2.*eps4.*Izz2.*cos( ...
  tht4).^2.*sin(tht3)+(-2).*eps2.*eps4.*m2.*r2.^2.*cos(tht4).^2.* ...
  sin(tht3)+(-1).*eps2.^2.*Ixx2.*cos(tht3).*cos(tht4).^2.*sin(tht3)+ ...
  eps2.^2.*Izz2.*cos(tht3).*cos(tht4).^2.*sin(tht3)+eps2.^2.*m2.* ...
  r2.^2.*cos(tht3).*cos(tht4).^2.*sin(tht3)+(-1).*ayhip.*m2.*r2.* ...
  cos(tht2).*cos(tht4).*sin(tht1).*sin(tht3)+(-1).*g.*m2.*r2.*cos( ...
  tht2).*cos(tht4).*sin(tht1).*sin(tht3)+GRFz.*L2.*cos(tht4).*sin( ...
  tht2).*sin(tht3)+azhip.*m2.*r2.*cos(tht4).*sin(tht2).*sin(tht3)+( ...
  -1).*eps1.^2.*L1.*m2.*r2.*cos(tht2).*cos(tht4).*sin(tht2).*sin( ...
  tht3)+eps1.^2.*Ixx1.*cos(tht3).*sin(tht2).^2.*sin(tht3)+(-1).* ...
  eps1.^2.*Izz1.*cos(tht3).*sin(tht2).^2.*sin(tht3)+eps1.^2.*Ixx2.* ...
  cos(tht3).*cos(tht4).^2.*sin(tht2).^2.*sin(tht3)+(-1).*eps1.^2.* ...
  Izz2.*cos(tht3).*cos(tht4).^2.*sin(tht2).^2.*sin(tht3)+(-1).* ...
  eps1.^2.*m2.*r2.^2.*cos(tht3).*cos(tht4).^2.*sin(tht2).^2.*sin( ...
  tht3)+eps1.*eps2.*Ixx1.*sin(tht2).*sin(tht3).^2+(-1).*eps1.*eps2.* ...
  Izz1.*sin(tht2).*sin(tht3).^2+eps1.*eps2.*Ixx2.*cos(tht4).^2.*sin( ...
  tht2).*sin(tht3).^2+(-1).*eps1.*eps2.*Izz2.*cos(tht4).^2.*sin( ...
  tht2).*sin(tht3).^2+(-1).*eps1.*eps2.*m2.*r2.^2.*cos(tht4).^2.* ...
  sin(tht2).*sin(tht3).^2+GRFx.*L2.*cos(tht4).*(cos(tht3).*sin(tht1) ...
  +(-1).*cos(tht1).*cos(tht2).*sin(tht3))+(-1).*GRFy.*L2.*cos(tht4) ...
  .*(cos(tht1).*cos(tht3)+cos(tht2).*sin(tht1).*sin(tht3))+eta1.* ...
  Ixx2.*cos(tht3).*cos(tht4).*sin(tht2).*sin(tht4)+(-1).*eta1.* ...
  Iyy2.*cos(tht3).*cos(tht4).*sin(tht2).*sin(tht4)+(-1).*eta1.*m2.* ...
  r2.^2.*cos(tht3).*cos(tht4).*sin(tht2).*sin(tht4)+eta2.*Ixx2.*cos( ...
  tht4).*sin(tht3).*sin(tht4)+(-1).*eta2.*Iyy2.*cos(tht4).*sin(tht3) ...
  .*sin(tht4)+(-1).*eta2.*m2.*r2.^2.*cos(tht4).*sin(tht3).*sin(tht4) ...
  +eta3.*Ixx2.*sin(tht4).^2+(-1).*eta1.*Ixx2.*cos(tht2).*sin(tht4) ...
  .^2+eps1.*eps2.*Ixx2.*sin(tht2).*sin(tht4).^2+(-1).*eps1.*eps4.* ...
  Ixx2.*cos(tht3).*sin(tht2).*sin(tht4).^2+eps1.*eps4.*Iyy2.*cos( ...
  tht3).*sin(tht2).*sin(tht4).^2+(-1).*eps1.*eps4.*Izz2.*cos(tht3).* ...
  sin(tht2).*sin(tht4).^2+(-1).*eps1.*eps2.*Iyy2.*cos(tht3).^2.*sin( ...
  tht2).*sin(tht4).^2+eps1.*eps2.*Izz2.*cos(tht3).^2.*sin(tht2).* ...
  sin(tht4).^2+(-1).*eps2.*eps4.*Ixx2.*sin(tht3).*sin(tht4).^2+ ...
  eps2.*eps4.*Iyy2.*sin(tht3).*sin(tht4).^2+(-1).*eps2.*eps4.*Izz2.* ...
  sin(tht3).*sin(tht4).^2+(-1).*eps2.^2.*Iyy2.*cos(tht3).*sin(tht3) ...
  .*sin(tht4).^2+eps2.^2.*Izz2.*cos(tht3).*sin(tht3).*sin(tht4).^2+ ...
  eps1.^2.*Iyy2.*cos(tht3).*sin(tht2).^2.*sin(tht3).*sin(tht4).^2+( ...
  -1).*eps1.^2.*Izz2.*cos(tht3).*sin(tht2).^2.*sin(tht3).*sin(tht4) ...
  .^2+eps1.*eps2.*Iyy2.*sin(tht2).*sin(tht3).^2.*sin(tht4).^2+(-1).* ...
  eps1.*eps2.*Izz2.*sin(tht2).*sin(tht3).^2.*sin(tht4).^2+eps3.* ...
  eps4.*Ixx2.*sin(2.*tht4)+(-1).*eps3.*eps4.*Iyy2.*sin(2.*tht4)+(-1) ...
  .*eps3.*eps4.*m2.*r2.^2.*sin(2.*tht4)+(-1).*eps1.*eps4.*Ixx2.*cos( ...
  tht2).*sin(2.*tht4)+eps1.*eps4.*Iyy2.*cos(tht2).*sin(2.*tht4)+ ...
  eps1.*eps4.*m2.*r2.^2.*cos(tht2).*sin(2.*tht4)+eps1.*eps2.*Ixx2.* ...
  cos(tht2).*cos(tht3).*sin(2.*tht4)+(-1).*eps1.*eps2.*Iyy2.*cos( ...
  tht2).*cos(tht3).*sin(2.*tht4)+(-1).*eps1.*eps2.*m2.*r2.^2.*cos( ...
  tht2).*cos(tht3).*sin(2.*tht4)+(-1/4).*eps1.^2.*Ixx2.*sin(2.*tht2) ...
  .*sin(tht3).*sin(2.*tht4)+(1/4).*eps1.^2.*Iyy2.*sin(2.*tht2).*sin( ...
  tht3).*sin(2.*tht4)+(1/4).*eps1.^2.*m2.*r2.^2.*sin(2.*tht2).*sin( ...
  tht3).*sin(2.*tht4);

T7=eta4.*Izz2+eta4.*m2.*r2.^2+(-1).*eta2.*Izz2.*cos(tht3)+(-1).* ...
  eta2.*m2.*r2.^2.*cos(tht3)+GRFz.*L2.*cos(tht2).*cos(tht4)+azhip.* ...
  m2.*r2.*cos(tht2).*cos(tht4)+eps2.^2.*L1.*m2.*r2.*cos(tht3).^2.* ...
  cos(tht4)+eps1.*eps3.*Izz2.*cos(tht3).*sin(tht2)+eps1.*eps3.*m2.* ...
  r2.^2.*cos(tht3).*sin(tht2)+axhip.*m2.*r2.*cos(tht1).*cos(tht4).* ...
  sin(tht2)+(-1).*eps1.*eps3.*Ixx2.*cos(tht3).*cos(tht4).^2.*sin( ...
  tht2)+eps1.*eps3.*Iyy2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+eps1.* ...
  eps3.*m2.*r2.^2.*cos(tht3).*cos(tht4).^2.*sin(tht2)+eps1.^2.* ...
  Ixx2.*cos(tht2).*cos(tht3).*cos(tht4).^2.*sin(tht2)+(-1).* ...
  eps1.^2.*Iyy2.*cos(tht2).*cos(tht3).*cos(tht4).^2.*sin(tht2)+(-1) ...
  .*eps1.^2.*m2.*r2.^2.*cos(tht2).*cos(tht3).*cos(tht4).^2.*sin( ...
  tht2)+ayhip.*m2.*r2.*cos(tht4).*sin(tht1).*sin(tht2)+g.*m2.*r2.* ...
  cos(tht4).*sin(tht1).*sin(tht2)+eps1.^2.*L1.*m2.*r2.*cos(tht3) ...
  .^2.*cos(tht4).*sin(tht2).^2+eps2.*eps3.*Izz2.*sin(tht3)+eps2.* ...
  eps3.*m2.*r2.^2.*sin(tht3)+eps1.*eps2.*Izz2.*cos(tht2).*sin(tht3)+ ...
  eps1.*eps2.*m2.*r2.^2.*cos(tht2).*sin(tht3)+(-1).*eps2.*eps3.* ...
  Ixx2.*cos(tht4).^2.*sin(tht3)+eps2.*eps3.*Iyy2.*cos(tht4).^2.*sin( ...
  tht3)+eps2.*eps3.*m2.*r2.^2.*cos(tht4).^2.*sin(tht3)+eps1.*eps2.* ...
  Ixx2.*cos(tht2).*cos(tht4).^2.*sin(tht3)+(-1).*eps1.*eps2.*Iyy2.* ...
  cos(tht2).*cos(tht4).^2.*sin(tht3)+(-1).*eps1.*eps2.*m2.*r2.^2.* ...
  cos(tht2).*cos(tht4).^2.*sin(tht3)+eta1.*Izz2.*sin(tht2).*sin( ...
  tht3)+eta1.*m2.*r2.^2.*sin(tht2).*sin(tht3)+eps2.^2.*L1.*m2.*r2.* ...
  cos(tht4).*sin(tht3).^2+eps1.^2.*L1.*m2.*r2.*cos(tht4).*sin(tht2) ...
  .^2.*sin(tht3).^2+eta2.*L1.*m2.*r2.*cos(tht3).*sin(tht4)+(-1).* ...
  axhip.*m2.*r2.*cos(tht1).*cos(tht2).*cos(tht3).*sin(tht4)+(-1).* ...
  eps3.^2.*Ixx2.*cos(tht4).*sin(tht4)+eps3.^2.*Iyy2.*cos(tht4).*sin( ...
  tht4)+eps3.^2.*m2.*r2.^2.*cos(tht4).*sin(tht4)+(-1).*eps1.^2.* ...
  Ixx2.*cos(tht2).^2.*cos(tht4).*sin(tht4)+eps1.^2.*Iyy2.*cos(tht2) ...
  .^2.*cos(tht4).*sin(tht4)+eps1.^2.*m2.*r2.^2.*cos(tht2).^2.*cos( ...
  tht4).*sin(tht4)+(-1).*ayhip.*m2.*r2.*cos(tht2).*cos(tht3).*sin( ...
  tht1).*sin(tht4)+(-1).*g.*m2.*r2.*cos(tht2).*cos(tht3).*sin(tht1) ...
  .*sin(tht4)+GRFz.*L2.*cos(tht3).*sin(tht2).*sin(tht4)+azhip.*m2.* ...
  r2.*cos(tht3).*sin(tht2).*sin(tht4)+(-1).*eps1.^2.*L1.*m2.*r2.* ...
  cos(tht2).*cos(tht3).*sin(tht2).*sin(tht4)+eps1.^2.*Ixx2.*cos( ...
  tht3).^2.*cos(tht4).*sin(tht2).^2.*sin(tht4)+(-1).*eps1.^2.*Iyy2.* ...
  cos(tht3).^2.*cos(tht4).*sin(tht2).^2.*sin(tht4)+(-1).*eps1.^2.* ...
  m2.*r2.^2.*cos(tht3).^2.*cos(tht4).*sin(tht2).^2.*sin(tht4)+ ...
  ayhip.*m2.*r2.*cos(tht1).*sin(tht3).*sin(tht4)+g.*m2.*r2.*cos( ...
  tht1).*sin(tht3).*sin(tht4)+(-2).*eps1.*eps2.*L1.*m2.*r2.*cos( ...
  tht2).*sin(tht3).*sin(tht4)+(-1).*axhip.*m2.*r2.*sin(tht1).*sin( ...
  tht3).*sin(tht4)+(-1).*eta1.*L1.*m2.*r2.*sin(tht2).*sin(tht3).* ...
  sin(tht4)+eps2.^2.*Ixx2.*cos(tht4).*sin(tht3).^2.*sin(tht4)+(-1).* ...
  eps2.^2.*Iyy2.*cos(tht4).*sin(tht3).^2.*sin(tht4)+(-1).*eps2.^2.* ...
  m2.*r2.^2.*cos(tht4).*sin(tht3).^2.*sin(tht4)+eps1.*eps3.*Ixx2.* ...
  cos(tht3).*sin(tht2).*sin(tht4).^2+(-1).*eps1.*eps3.*Iyy2.*cos( ...
  tht3).*sin(tht2).*sin(tht4).^2+(-1).*eps1.*eps3.*m2.*r2.^2.*cos( ...
  tht3).*sin(tht2).*sin(tht4).^2+(-1).*eps1.^2.*Ixx2.*cos(tht2).* ...
  cos(tht3).*sin(tht2).*sin(tht4).^2+eps1.^2.*Iyy2.*cos(tht2).*cos( ...
  tht3).*sin(tht2).*sin(tht4).^2+eps1.^2.*m2.*r2.^2.*cos(tht2).*cos( ...
  tht3).*sin(tht2).*sin(tht4).^2+eps2.*eps3.*Ixx2.*sin(tht3).*sin( ...
  tht4).^2+(-1).*eps2.*eps3.*Iyy2.*sin(tht3).*sin(tht4).^2+(-1).* ...
  eps2.*eps3.*m2.*r2.^2.*sin(tht3).*sin(tht4).^2+(-1).*eps1.*eps2.* ...
  Ixx2.*cos(tht2).*sin(tht3).*sin(tht4).^2+eps1.*eps2.*Iyy2.*cos( ...
  tht2).*sin(tht3).*sin(tht4).^2+eps1.*eps2.*m2.*r2.^2.*cos(tht2).* ...
  sin(tht3).*sin(tht4).^2+GRFy.*L2.*(cos(tht4).*sin(tht1).*sin(tht2) ...
  +((-1).*cos(tht2).*cos(tht3).*sin(tht1)+cos(tht1).*sin(tht3)).* ...
  sin(tht4))+GRFx.*L2.*((-1).*sin(tht1).*sin(tht3).*sin(tht4)+cos( ...
  tht1).*(cos(tht4).*sin(tht2)+(-1).*cos(tht2).*cos(tht3).*sin(tht4) ...
  ))+eps1.*eps3.*Ixx2.*cos(tht2).*sin(2.*tht4)+(-1).*eps1.*eps3.* ...
  Iyy2.*cos(tht2).*sin(2.*tht4)+(-1).*eps1.*eps3.*m2.*r2.^2.*cos( ...
  tht2).*sin(2.*tht4)+(1/2).*eps1.*eps2.*Ixx2.*sin(tht2).*sin(2.* ...
  tht3).*sin(2.*tht4)+(-1/2).*eps1.*eps2.*Iyy2.*sin(tht2).*sin(2.* ...
  tht3).*sin(2.*tht4)+(-1/2).*eps1.*eps2.*m2.*r2.^2.*sin(tht2).*sin( ...
  2.*tht3).*sin(2.*tht4);

torques = [T4 T5 T6 T7];

end
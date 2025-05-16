%% EXAMPLE: Differential drive vehicle following waypoints using the 
% Pure Pursuit algorithm
%
% Copyright 2018-2019 The MathWorks, Inc.

%% Define Vehicle
R = 0.5;                % Wheel radius [m]
L = 0.18;                % Wheelbase [m]
dd = DifferentialDrive(R,L);

%% Simulation parameters
sampleTime = 0.1;               % Sample time [s]   tiempo de muestreo(s)
tVec = 0:sampleTime:45;         % Time array   Vector de tiempo para 45 segundos

% en este contexto representa el estado del robot móvil en el plano 2D, y se define como un vector de tres componentes:
initPose = [12;6;180];             % Initial pose (x y theta)   Posición inicial
pose = zeros(3,numel(tVec));    % Pose matrix    matriz que guarda la pose a lo largo del tiempo
pose(:,1) = initPose;           %se guarda la pose inicial.

% Define waypoints puntos s seguir por el robot. 
waypoints = [12,6; 11,6; 10,7; 9,8; 8,12; 8,11; 7,11; 6,11; 7,10; 7,9; 8,9; 5,12; 5,11; 4,10; 4,9; 5,10; 3,10; 3,9; 2,9; 1,9; 1,8; 3,6; 6,6; 7,5; 10,7; 11,6; 6,5; 6,4; 6,2; 7,1; 10,2; 10,2]; %definidos por el profesor. 


% Create visualizer    interfaz vidual 2d para mostrar el movimiento del
% robot y los waypoints. 
viz = Visualizer2D;
viz.hasWaypoints = true;

%% Pure Pursuit Controller
controller = controllerPurePursuit;
controller.Waypoints = waypoints;
controller.LookaheadDistance = 1;
controller.DesiredLinearVelocity = 1.5;
controller.MaxAngularVelocity = 60;

%% Simulation loop
close all
r = rateControl(1/sampleTime);
for idx = 2:numel(tVec) 
    % Ejecutar el controlador Pure Pursuit y obtener velocidades deseadas (lineal y angular)
    [vRef,wRef] = controller(pose(:,idx-1));
    % Convertir las velocidades deseadas en velocidades de rueda izquierda y derecha
    [wL,wR] = inverseKinematics(dd,vRef,wRef)
 
    
    % la cinemática directa para obtener las velocidades del cuerpo del robot
    [v,w] = forwardKinematics(dd,wL,wR);% v = velocidad lineal, w = velocidad angular
    velB = [v;0;w]; % Vector de velocidad en el marco del cuerpo [vx;vy;w]
    vel = bodyToWorld(velB,pose(:,idx-1));  % Convertir a velocidades en el marco del mundo
    
    %  Actualizar la pose usando integración hacia adelante (Euler)
    pose(:,idx) = pose(:,idx-1) + vel*sampleTime; 
    
    % Update visualization
    viz(pose(:,idx),waypoints) %Axctualizar visualización con la nueva pose.
    waitfor(r);
    
end
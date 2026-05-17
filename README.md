# 📍 Seguimiento de Waypoints — Lazo Abierto vs Lazo Cerrado (MATLAB)

Comparativa de estrategias de control para navegación de un robot diferencial siguiendo waypoints en MATLAB. El proyecto analiza y contrasta el comportamiento del robot bajo **control en lazo abierto** y **control en lazo cerrado con Pure Pursuit**, explorando distintas configuraciones de waypoints y parámetros del controlador.

---

## 🧠 ¿Qué hace este proyecto?

El proyecto implementa y compara dos enfoques de control de trayectorias:

**Lazo abierto (`seguimiento_lazo_abierto.m`):**
- El robot sigue comandos de velocidad predefinidos sin retroalimentación
- No corrige errores de posición durante la ejecución
- Sirve como referencia para evaluar la necesidad del control en lazo cerrado

**Lazo cerrado con Pure Pursuit (`seguimiento_way_point_12.m` y variantes):**
- El controlador Pure Pursuit calcula en cada paso la velocidad angular necesaria para alcanzar el siguiente waypoint
- Corrige errores de posición continuamente mediante retroalimentación
- Se probaron múltiples conjuntos de waypoints y parámetros de lookahead para analizar el comportamiento del sistema

---

## 📁 Estructura del repositorio

```
├── seguimiento_lazo_abierto.m          # Simulación lazo abierto
├── seguimiento_lazo_abierto.mat        # Datos de simulación lazo abierto
├── seguimiento_lazo_abierto_bueno.mlx  # Live Script: lazo abierto optimizado
├── seguimiento_lazo_cerrado.mlx        # Live Script: lazo cerrado
├── seguimiento_lazo_cerrado_puntos.mlx # Live Script: lazo cerrado con análisis de puntos
├── seguimiento_lazocerrado.mlx         # Live Script: variante lazo cerrado
├── Seguimeinto_lazo_cerrado.mat        # Datos de simulación lazo cerrado
├── seguimiento_way_point_12.m          # Pure Pursuit — configuración base
├── seguimiento_way_point_12_1.m        # Variante 1: waypoints distintos
├── seguimiento_way_point_12_2.m        # Variante 2: ajuste de parámetros
├── seguimeinto_way_point_12_2.m        # Variante 2b
├── seguimiento_way_point_12_3.m        # Variante 3
├── seguimiento_way_point_12_4.m        # Variante 4
├── seguimeinto_way_point_12_5.m        # Variante 5: configuración final
└── README.md
```

---

## ⚙️ Parámetros del robot y controlador

### Robot diferencial
| Parámetro | Lazo abierto | Lazo cerrado |
|---|---|---|
| Radio de rueda (R) | 0.1 m | 0.1 m |
| Distancia entre ruedas (L) | 0.5 m | 0.5 m |

### Controlador Pure Pursuit (lazo cerrado)
| Parámetro | Valor |
|---|---|
| Lookahead distance | 1.0 m |
| Velocidad lineal deseada | 1.5 m/s |
| Velocidad angular máxima | 60 rad/s |
| Tiempo de muestreo | 0.1 s |
| Tiempo de simulación | 60 s |

---

## 🔄 Conjuntos de waypoints probados

```matlab
% Waypoints base
waypoints = [2,5; -5,3; -5,2; 2,-5; 5,2; -3,2; -4,-4; 4,-3];

% Variante 1
waypoints = [4,4; -10,8; 8,1; -7,-4; 0,-5; -3,0; 2,-5; 0,0];

% Variante 2
waypoints = [-3,4; 3,3; 1,-3; -1,-1; 1,4; -3,-4; 2,-1];
```

---

## 🚀 Cómo ejecutar

### Requisitos
- MATLAB R2019b o posterior
- Robotics System Toolbox

### Scripts `.m` (básicos)
```matlab
% Abrir MATLAB y navegar al directorio del proyecto
run('seguimiento_way_point_12.m')       % Lazo cerrado - configuración base
run('seguimiento_lazo_abierto.m')       % Lazo abierto
```

### Live Scripts `.mlx` (recomendado — incluyen análisis)
Abrir directamente en MATLAB haciendo doble clic sobre el archivo `.mlx`. Incluyen visualizaciones y notas de análisis integradas.

---

## 📊 Comparativa de resultados

| Característica | Lazo Abierto | Lazo Cerrado (Pure Pursuit) |
|---|---|---|
| Corrección de errores | ❌ No | ✅ Sí |
| Robustez ante perturbaciones | ❌ Baja | ✅ Alta |
| Precisión en waypoints | ❌ Baja | ✅ Alta |
| Complejidad de implementación | ✅ Simple | ⚠️ Media |

---

## 🛠️ Tech Stack

| Componente | Tecnología |
|---|---|
| Lenguaje | MATLAB |
| Toolbox | Robotics System Toolbox |
| Algoritmo de control | Pure Pursuit |
| Modelo de robot | DifferentialDrive |
| Formato de análisis | Live Scripts (.mlx) |

---

## 📚 Lo que aprendí

- Diferencias prácticas entre control en lazo abierto y lazo cerrado en robótica móvil
- Efecto de los parámetros del controlador (lookahead distance, velocidad deseada) en el seguimiento de trayectorias
- Uso de MATLAB Live Scripts para documentar y analizar simulaciones de forma interactiva
- Impacto de la distribución de waypoints en la estabilidad y suavidad del movimiento del robot

---

## 🔗 Proyecto relacionado

Este repo es parte de una serie de ejercicios de planeación de trayectorias. Ver también:
- [Evaluación 9 — Pure Pursuit con trayectoria compleja](https://github.com/EmmaLA22/Evaluaci-n-9-Planeaci-n-de-Trayectorias-)

---

## 👨‍💻 Autor

**Emmanuel Lechuga Arreola**  
Ing. Robótica y Sistemas Digitales — Tecnológico de Monterrey  
[LinkedIn](https://www.linkedin.com/in/emmanuel-lechuga-arreola-7189892bb/) · [GitHub](https://github.com/EmmaLA22)

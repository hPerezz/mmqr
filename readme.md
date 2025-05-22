# MMQ - Multiple Model Quadratic Functions

A MATLAB/Octave toolbox for recursive parameter estimation and system identification. This repository implements various least squares estimation methods, from basic to advanced recursive algorithms with exponential forgetting.

## Features
- Basic Least Squares Estimation (MMQ)
- Weighted Least Squares (MMQP)
- Recursive Least Squares (MMQR)
- Recursive Least Squares with Exponential Forgetting (MMQRE)
- Built-in validation and regression tools
- Suitable for real-time parameter estimation
- Compatible with both MATLAB and Octave

## Functions Overview

### 1. MMQ (Multiple Model Quadratic)
The basic least squares estimator.

```matlab
[Theta] = MMQ(PHI, Y)
```
- `PHI`: Regressor matrix
- `Y`: Output vector
- Returns: Estimated parameters `Theta`

### 2. MMQP (Multiple Model Quadratic with Weighting)
A weighted version of the least squares estimator.

```matlab
[Theta] = MMQP(PHI, Y)
```
- `PHI`: Regressor matrix
- `Y`: Output vector
- Returns: Estimated parameters `Theta`
- Features: Implements a weighting scheme (0.6) for datasets with less than 60 samples

### 3. MMQR (Multiple Model Quadratic Recursive)
A recursive least squares estimator.

```matlab
[THETA, Pk] = MMQR(P, Phi, Theta, y)
```
- `P`: Covariance matrix
- `Phi`: Current regressor vector
- `Theta`: Current parameter estimate
- `y`: Current output measurement
- Returns: 
  - Updated parameters `THETA`
  - Updated covariance matrix `Pk`

### 4. MMQRE (Multiple Model Quadratic Recursive with Exponential Forgetting)
An extended version of MMQR with exponential forgetting factor.

```matlab
[THETA, Pk] = MMQRE(P, Phi, Theta, y, L)
```
- `P`: Covariance matrix
- `Phi`: Current regressor vector
- `Theta`: Current parameter estimate
- `y`: Current output measurement
- `L`: Forgetting factor (lambda)
- Returns:
  - Updated parameters `THETA`
  - Updated covariance matrix `Pk`

## Usage Examples

### Basic Least Squares (MMQ)
```matlab
% Example data
PHI = [1 2; 3 4; 5 6];  % Regressor matrix
Y = [1; 2; 3];          % Output vector

% Estimate parameters
Theta = MMQ(PHI, Y);
```

### Recursive Estimation (MMQR)
```matlab
% Initial setup
P = eye(2);             % Initial covariance matrix
Theta = zeros(2,1);     % Initial parameter estimate

% For each new measurement
for k = 1:N
    phi = [x1(k); x2(k)];  % Current regressor vector
    y = y(k);              % Current measurement
    
    % Update parameters
    [Theta, P] = MMQR(P, phi, Theta, y);
end
```

### Recursive Estimation with Forgetting (MMQRE)
```matlab
% Initial setup
P = eye(2);             % Initial covariance matrix
Theta = zeros(2,1);     % Initial parameter estimate
lambda = 0.95;          % Forgetting factor

% For each new measurement
for k = 1:N
    phi = [x1(k); x2(k)];  % Current regressor vector
    y = y(k);              % Current measurement
    
    % Update parameters with forgetting
    [Theta, P] = MMQRE(P, phi, Theta, y, lambda);
end
```

## Notes
- The MMQP function automatically applies a weighting factor of 0.6 for datasets with less than 60 samples
- For MMQRE, the choice of the forgetting factor (lambda) is important and should be tuned based on:
  - Data velocity
  - Amount of data
  - System dynamics
- Typical values for lambda range between 0.95 and 0.99

## Author
Henrique Perez Gomes da Silva
hperez@unifei.edu.br
Maid with ❤️ in UNIFEI - Federal de Itajubá :)

# Optimal Control Examples

## Introduction

This repository contains a collection of examples and implementations related to optimal control theory. Optimal control is a mathematical framework for determining a control policy that will achieve a desired outcome in the best possible manner. This repository covers various methods and techniques used in optimal control, including stabilization, tracking, Model Predictive Control (MPC), bang-bang control, and dynamic programming with Bellman's principle.

## Project Structure

The project is organized into the following sections:

1. **Stabilization Examples**
    - Demonstrates methods for stabilizing dynamic systems.
    - Includes examples of linear and nonlinear systems.
    - Utilizes feedback control laws to achieve stabilization.

2. **Tracking Examples**
    - Focuses on designing controllers that can follow a desired trajectory.
    - Examples include linear quadratic tracking and nonlinear tracking methods.
    - Highlights the importance of minimizing the tracking error.

3. **Model Predictive Control (MPC)**
    - Introduction to MPC, a powerful method used for controlling constrained systems.
    - Examples demonstrate how to formulate and solve MPC problems.
    - Includes applications in both linear and nonlinear systems.
    - Illustrates how MPC can handle multi-variable control problems.

4. **Bang-Bang Control**
    - Explores bang-bang control, an optimal control method for systems with binary (on/off) control inputs.
    - Examples show the application of bang-bang control in various scenarios.
    - Discusses the principles behind switching strategies to achieve optimal performance.

5. **Dynamic Programming and Bellman's Principle**
    - Introduction to dynamic programming as a method for solving optimization problems over time.
    - Explains Bellman's principle of optimality.
    - Includes examples that apply dynamic programming to various control problems.
    - Demonstrates the use of value iteration and policy iteration methods.

## Important Points

- **Libraries and Tools Used**:
  - `Matlab`
  - `Matlab simulink`
    
- **Examples and Implementations**:
  - **Stabilization**:
    - Linear Quadratic Regulator (LQR)
    - State feedback control for nonlinear systems
  - **Tracking**:
    - LQR tracking
    - Nonlinear tracking control using feedback linearization
  - **MPC**:
    - Formulating the MPC problem
    - Examples with constraints on states and inputs
  - **Bang-Bang Control**:
    - Optimal control for systems with binary inputs
    - Switching time optimization
  - **Dynamic Programming**:
    - Application of Bellman's equation in optimal control

## Getting Started

To run the examples in this repository, ensure you have the required libraries installed. 

## Conclusion
This repository serves as a comprehensive resource for understanding and implementing various optimal control techniques. Whether you are looking to stabilize a dynamic system, design a tracking controller, apply MPC, explore bang-bang control, or utilize dynamic programming, you will find relevant examples and code to assist you in your endeavors.

## License

this project has an open source licence

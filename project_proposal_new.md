# MATLAB HS12 - Research Plan       
 >   *	Group Name: Forest Fire Foxes (now that's creative!)
 >   *  Group participants names: Nishant Dogra, Michael Wild
 >   *  Project Title: Self-Organized Criticality and Phase Transitions in a Forest Fire Model

## General Introduction

In various fields like physics, biology as well as social sciences, a lot of systems have both temporal as well as spatial degrees of freedom. The usual strategy to understand such systems (also called as spatially extended dynamical systems) is reduce the problem to a few important degrees of freedom. Sometimes, the dynamics of such a system can be very well explained by a few collective degrees of freedom. This dimensional reduction is termed as "Self Organization".
On the other hand, there is another set of dynamical sytems where the individual degree of freedom keep itself more or less in a stable balance and it is not possible to describe such a system by a few collective degrees of freedom. The key point in such systems is that the interdependence of various degrees of freedom make such systems very susceptible to noise. That's why, these sytems can be called as "Critical".

Self Organized Criticality (SOC) is the study of Cooperative critical phenomenon (which is a combination of above 2 ideas). A Self Organized Critical state is characterized by the following 2 properties:
(1) The system evolves to the state without detailed specification of the intial conditions (self organized). It implies that critical state is an attractor of the dynamics.
(2) The critical state is robust with respect to variations of parameters and the presence of quenched randomness.

The behaviour of systems at the self organized critical points is characterized by a number of critical exponents. In simple terms, the dynamics of a critical state has a specific temporal fingerprint: the power spectrum scales as inverse of frequency.  Another signature of criticality is spatial self symmetry (e.g. self similar fractal structures)

One of the simple examples of an SOC is a simple model for the spreading of fire in a forest. Interstingly, the initial forest fire model proposed for SOC was later proved to be non-SOC when simulations were performed on large size systems. Later on, another model which included another rule into the time evolution of the system was verified to be an SOC. This model has been studied for its appliactions to spreading of real forest fires, epidemics etc. 



## The Model

The forest fire is modelled  as a probabilistic cellular automaton defined on a  d-dimensional hypercubic lattice. In the beginning, each site is occupied by either a tree or a burning tree or it is empty.. The state of the system is parallely updated by the following rules: 
(i) A burning tree becomes an empty site. 
(ii) A green tree becomes a burning tree if at least one of its nearest neighbors is burning. 
(iii) At an empty site a tree grows with probability p.
(iv) A tree without a burning nearest neighbor becomes a burning tree during one time step with probability f (lightening parameter).

In order to find out when is the model an SOC, various properties like cluster size distribution, cluster radius (radius of a forest cluster is the square root of the mean quadratic distance of the cluster members from their center of mass) will be calculated as a function of cluster size (cluster size is defined as the number of trees in a cluster) for various values of the ratio f/p. 

We will check the robustness of the SOC by choosing different initial conditions and different boundary conditions (absorbing as well as periodic). We will also study how the critical exponents depend on the dimensionality of the lattice as well as on the size of lattice.



## Fundamental Questions

What are the characteristics (quantitative) of a Self Organized Critical state?
Why Forest Fire model manifest SOC?
What are the various phases seen in a Forest Fire model besides the Self Organized Critical phase?
What are the parameters characterizing the phase transition in the Forest Fire Model?
How does the SOC of the Forest Fire model depend on the dimensionality of the Lattice?
Is the SOC in Forest Fire model a finite size effect?
How to simulate SOC in Matlab?



## Expected Results

We expect the Forest Fire model to manifest SOC when certain conditions are specified. 
We expect the Forest Fire model to manifest SOC depending upon the rules of temporal evolution of the system.



## References

[1] Self-organied criticality; Per Bak, Chao Tang, and Kurt Wiesenfeld; Phys. Rev. A, Vol 38, No 1, July 1988
[2] Self-Organized Critical Forest-Fire Model; B. Drossel and F. Schwabl; Phys. Rev. Lett., Vol 69, No 11, Sep 1992
[3] Phase transitions in a forest-fire model; S. Clar, K. Schenk, and F. Schwabl; Phys. Rev. E, Vol 55, No 3, March 1997
[4] Self-organized critical forest-fire model on large scales; Klaus Schenk Barbara Drossel and Franz Schwabl; Phys. Rev E, Vol 65, No 026135, Jan 2002



## Research Methods

Cellular Automata:- a discrete model consisting of a regular grid with a finite number of cells in a finite number of dimensions, where the cells have a finite number of possible states and the evolution of states is based on a set of well defined rules.

Monte Carlo Renormalization Group Method:- It is a method to calculate the important scales of a system. [Reference: Monte Carlo Renormalization Group; Robert H. Swendsen; Phys. Rev. Lett. 42, 859–861 (1979)]
# LiveTwin Pump Soft Sensor with MATLAB Simulink and SIMATIC Target

Running a simulation model on an Industrial Edge Device using the Siemens app LiveTwin.

- [LiveTwin Pump Soft Sensor with MATLAB Simulink and SIMATIC Target](#livetwin-pump-soft-sensor-with-matlab-simulink-and-simatic-target)
  - [Description](#description)
    - [Overview](#overview)
    - [General Task](#general-task)
  - [Requirements](#requirements)
    - [Prerequisites](#prerequisites)
    - [Used components](#used-components)
  - [Installation and Usage](#installation-and-usage)
  - [Documentation](#documentation)
  - [Contribution](#contribution)
  - [License and Legal Information](#license-and-legal-information)

## Description

### Overview

In many industrial use-cases, information about internal states of a system is often required, but necessitates the purchase and integration of hardware sensors. Some states may not be directly measurable at all.

One approach to solve this issue is by mathematically modelling the system, using real input data for the simulation, and observing the internal states of this virtual counterpart. In this example, a Simulink model of a centrifugal pump has been provided in order to estimate the flow rate based on the pump rotational speed.


### General Task

This example shows how to use the Industrial Edge App LiveTwin to implement a soft (virtual) sensor for a centrifugal pump based on a MATLAB Simulink model.

Using the SIMATIC Target software module, we can directly upload this model from Simulink to the LiveTwin app running on an Industrial Edge Device. Alternatively, the provided .zip file can also be uploaded into LiveTwin without having a local installation of MATLAB or SIMATIC Target.

The simulation parameters can then be configured and the simulation run in LiveTwin. A PLC program provides changing input values of the pump rotational speed. The estimated flow rate is then written back into the PLC, where the results can be used to take action.


![architecture](/docs/graphics/architecture.png)

## Requirements

### Prerequisites

* Access to an Industrial Edge Management System (IEM)
* Onboarded Industrial Edge Device (IED)
* Installed apps on IED (see below)
* PLC with the provided program connected to the IED
* **(optional)** Installed MATLAB Simulink and Simatic Target V5.0 with network access to the IED

### Used components

* Industrial Edge Device V1.7.0-18
* LiveTwin V2.1.16
* S7 Connector V1.7.0-27
* Common Connector Configurator V1.7.0-18
* IE Databus V 1.7.0
* IE Databus Configurator V 1.7.2
* TIA Portal V17
* PLC: CPU 1212C FW V4.4
* **(optional)** MATLAB Simulink R2022a
* **(optional)** Simscape Fluids (Trial License is sufficient)
* **(optional)** SIMATIC Target V5.0

## Installation and Usage

You can find the installation and usage instructions in the [documentation](docs/Documentation.md).

## Documentation

You can find further documentation and help in the following links:

* [Industrial Edge Hub](https://iehub.eu1.edge.siemens.cloud/#/documentation)
* [Industrial Edge Forum](https://www.siemens.com/industrial-edge-forum)
* [Industrial Edge landing page](https://new.siemens.com/global/en/products/automation/topic-areas/industrial-edge/simatic-edge.html)
* [Industrial Edge GitHub page](https://github.com/industrial-edge)

## Contribution

Thank you for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section.
Additionally everybody is free to propose any changes to this repository using Pull Requests.

If you are interested in contributing via Pull Request, please check the [Contribution License Agreement](Siemens_CLA_1.1.pdf) and forward a signed copy to [industrialedge.industry@siemens.com](mailto:industrialedge.industry@siemens.com?subject=CLA%20Agreement%20Industrial-Edge).

## License and Legal Information

Please read the [Legal information](LICENSE.txt).


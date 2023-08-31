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

![architecture](/docs/graphics/architecture.png)

This example shows how to use the Industrial Edge App LiveTwin to implement a soft (also software or virtual) sensor for a centrifugal pump based on a MATLAB Simulink model.

The model consists of hydraulic elements such as the pump itself and the intake and outlet pipes. The main input into the model is the pump rotational speed, based on which the output flowrate and pumped volume are calculated in various units. The remaining two inputs are meant for comparison with real world data and are not used in this example.

![model](/docs/graphics/model.png)

Using the SIMATIC Target software module, we can directly upload this model from Simulink to the LiveTwin app running on an Industrial Edge Device. Alternatively, the provided .zip file can also be uploaded into LiveTwin without having a local installation of MATLAB or SIMATIC Target.

The simulation parameters can then be configured and the simulation run in LiveTwin. A PLC program provides changing input values of the pump rotational speed. The estimated flow rate is then written back into the PLC, where the results can be used to take action.

In case no PLC is available, running the LiveTwin model in Flow Creator mode is possible. A [flow](src/livetwin_pump_flow.json) is available to provide the model with reasonable input values.


## Requirements

### Prerequisites

* Access to an Industrial Edge Management System (IEM)
* Onboarded Industrial Edge Device (IED)
* Installed apps on IED (see below)
* **(optional)** PLC with the provided program connected to the IED
* **(optional)** Installed MATLAB Simulink and Simatic Target V5.0 with network access to the IED

### Used components

* Industrial Edge Device V1.7.0-18
* LiveTwin V2.1.16
* S7 Connector V1.7.0-27
* Common Connector Configurator V1.7.0-18
* IE Databus V 1.7.0
* IE Databus Configurator V 1.7.2
* **(optional)** Flow Creator V 1.3.9
* **(optional)** TIA Portal V17
* **(optional)** PLC: CPU 1212C FW V4.4
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

If you haven't previously signed the [Siemens Contributor License Agreement](https://cla-assistant.io/industrial-edge/) (CLA), the system will automatically prompt you to do so when you submit your Pull Request. This can be conveniently done through the CLA Assistant's online platform. Once the CLA is signed, your Pull Request will automatically be cleared and made ready for merging if all other test stages succeed.

## License and Legal Information

Please read the [Legal information](LICENSE.txt).


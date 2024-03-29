- [Installation](#installation)
  - [Environment Setup](#environment-setup)
    - [Edge Device](#edge-device)
    - [PLC Program](#plc-program)
    - [Databus Configuration](#databus-configuration)
    - [S7 Connector Configuration](#s7-connector-configuration)
  - [Model Import in LiveTwin](#model-import-in-livetwin)
    - [SIMATIC Target and Simulink](#simatic-target-and-simulink)
    - [Exported .zip File](#exported-zip-file)
  - [Model Configuration in LiveTwin](#model-configuration-in-livetwin)
- [Usage](#usage)
  - [Running the Model in LiveTwin](#running-the-model-in-livetwin)
- [Input Generation in Flow Creator](#input-generation-in-flow-creator)
  

# Installation

## Environment Setup

### Edge Device

The following apps must be installed on your IED in order to complete this guide:

![ied01](/docs/graphics/ied_01.png)

### PLC Program

Download the provided [TIA Portal V17 project](/src/pump_soft_sensor_plc.zap17) into your PLC. It was originally compiled for a CPU 1212C FW V4.4, so you may need to adjust the device settings if you're using a different device. In case no PLC or simulation is available, you can use [Flow Creator](#input-generation-in-flow-creator). Once running, the Data Block `GlobalDB_LiveTwin [DB62]` contains two variables of data type `Real`: `pump_speed` is the value that will be used as input for the simulation, and `flow_rate_l_min` is the calculated flow rate in `l/min` that will be written back to the PLC from LiveTwin.

### Databus Configuration

Configure a user in the Databus configurator and give this user permission to publish and subscribe to the topic `ie/#`. This is where the data will be exchanged between the S7 Connector and LiveTwin.

![databus01](/docs/graphics/databus_01.png)

### S7 Connector Configuration

Next, we need to configure the two data points in the S7 Connector. Start by configuring the Databus credentials (created in the previous step) in the upper left corner.

![s701](/docs/graphics/s7_01.png)
![s702](/docs/graphics/s7_02.png)

Add a new data source. With the provided TIA Portal program, an S7+ connection should be configured as follows (substitute the PLC IP address for your own):

![s703](/docs/graphics/s7_03.png)

The following two data points are used in this example. Note the Name, Address, Data Type, Acquisition Cycle, and Access Mode (Read or Read & Write).

![s704](/docs/graphics/s7_04.png)

## Model Import in LiveTwin

This guide shows two different ways to import the [Simulink model](/src/pump_soft_sensor.slx) into LiveTwin. The first option is to use SIMATIC Target and export the model directly from a running Simulink instance to a running LiveTwin instance. The other way is to export the model as a [.zip](/src/pump_soft_sensor.zip) file and later upload it in the LiveTwin WebUI (the procedure used to generate the [provided file](/src/pump_soft_sensor.zip) is described in [this guide](https://github.com/industrial-edge/livetwin-earthquake-detection/blob/main/docs/export_simulink_model.md)).

### SIMATIC Target and Simulink

If you want to try out the model in Simulink, you'll need to initialize the parameters by running the provided [.m file](/src/pump_soft_sensor_params.m) in Matlab.

![simulink00](/docs/graphics/simulink_00.png)

Open the Simulink model and go to the Settings page.

![simulink01](/docs/graphics/simulink_01.png)

In the Code Generation tab, select the SIMATIC Target based on Simulink Coder as your target.

![simulink02](/docs/graphics/simulink_02.png)

In the SIMATIC Target options, choose LiveTwin for Industrial Edge and enter your Edge Device IP (with `/livetwin`), username, and password. Then, connect to the LiveTwin application.

![simulink03](/docs/graphics/simulink_03.png)

In the Engineering Integration tab, configure your LiveTwin Template and Project accordingly. Cyclic time can be adjusted later in the app as well.

![simulink04](/docs/graphics/simulink_04.png)

In the Accessibility tab, activate the checkbox.

![simulink05](/docs/graphics/simulink_05.png)

To upload your model to LiveTwin, go to the Simulink Coder App in Simulink and click Generate Code. In LiveTwin, the model will be uploaded as a template and a project based on this template will be created.

![simulink06](/docs/graphics/simulink_06.png)

### Exported .zip File

In case you don't have access to or don't want to use Matlab Simulink and SIMATIC Target, you can simply upload the provided [.zip](/src/pump_soft_sensor.zip) file in the LiveTwin WebUI. Start by creating a new template like in the screenshot:

![zip01](/docs/graphics/livetwin_zip_00.png)

![zip01](/docs/graphics/livetwin_zip_01.png)

The model will be uploaded to LiveTwin.

![zip02](/docs/graphics/livetwin_zip_02.png)

Create a new project based on your template according to the screenshot:

![zip03](/docs/graphics/livetwin_zip_03.png)

## Model Configuration in LiveTwin

Once a LiveTwin project has been created, you will have to configure the connections. Start by going to the Instance Settings.

![livetwin00](/docs/graphics/livetwin_settings_00.png)

In the Server Settings tab, configure your Databus credentials. The output topic is not strictly necessary.

![livetwin01](/docs/graphics/livetwin_settings_01.png)

In the Inputs/Outputs window, configure first the `pump_speed` input with the data source and variable name you used in the S7 Connector:

![livetwin02](/docs/graphics/livetwin_settings_02.png)

And then go to the next page and configure the `flowrate_lmin` (lowercase "L" for "liters") output:

![livetwin03](/docs/graphics/livetwin_settings_03.png)

Make sure that the Tag Names given here match the names of the variables that were configured in the S7 Connector.

To obtain sensible results, you can adjust the model parameters `pressure_pipe_length` and `pressure_pipe_outlet_height`, for example as follows:

![livetwin04](/docs/graphics/livetwin_settings_04.png)

Apply the changes. The model is now configured and ready to run.

# Usage

## Running the Model in LiveTwin

Start your model instance:

![livetwin05](/docs/graphics/livetwin_settings_05.png)

in the Monitoring window (left menu), open the chart for your running instance:

![livetwin06](/docs/graphics/livetwin_settings_06.png)

Select the relevant variables to monitor:

![livetwin07](/docs/graphics/livetwin_settings_07.png)

Start Update in the upper right of the monitoring window. You should now see the input and output variables with changing values.

![livetwin08](/docs/graphics/livetwin_settings_08.png)

In TIA Portal, you can go online on the PLC and observe that the result `flow_rate_l_min` has been written back to the PLC from LiveTwin.

![livetwin09](/docs/graphics/livetwin_settings_09.png)

The flow rate has thus been indirectly measured based on a Simulink model and the measured pump speed, removing the need for a hardware sensor.

# Input Generation in Flow Creator

In case you have no PLC available, you can also run the LiveTwin model in Flow Creator mode and provide inputs within Flow Creator directly. You can use the [provided flow](/src/livetwin_pump_flow.json) to simulate input values.

In order to use Flow Creator, you have to select Flow Creator as the model type during project creation:

![fc01](/docs/graphics/livetwin_fc_01.png)

Import the provided flow and edit the LiveTwin node:

![fc01](/docs/graphics/livetwin_fc_02.png)

Select the model project you have created in LiveTwin:

![fc01](/docs/graphics/livetwin_fc_03.png)

Use the button to start or stop the instance:

![fc01](/docs/graphics/livetwin_fc_04.png)

You can then view the running model in the Monitoring tab of LiveTwin as usual, or observe the outputs in the "Output" debug node in Flow Creator.
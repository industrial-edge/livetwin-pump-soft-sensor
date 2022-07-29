- [Installation](#installation)
  - [PLC Connection](#plc-connection)
    - [PLC Program](#plc-program)
    - [Databus Configuration](#databus-configuration)
    - [S7 Connector Configuration](#s7-connector-configuration)
  - [Model Import in LiveTwin](#model-import-in-livetwin)
    - [SIMATIC Target and Simulink](#simatic-target-and-simulink)
    - [Exported .zip File](#exported-zip-file)
  - [Model Configuration in LiveTwin](#model-configuration-in-livetwin)
- [Usage](#usage)
  - [Running the Model in LiveTwin](#running-the-model-in-livetwin)
  

# Installation

## PLC Connection

### PLC Program

Download the provided [TIA Portal V17 project](src/LiveTwin_Pump.zap17) into your PLC. Once running, the Data Block "GlobalDB_LiveTwin [DB62]" contains two variables: `pump_speed` is the value that will be used as input for the simulation, and `flow_rate_l_min` is the calculated flow rate in l/min that will be written back to the PLC from LiveTwin.

### Databus Configuration



### S7 Connector Configuration

blabla

## Model Import in LiveTwin

blabla

### SIMATIC Target and Simulink

![simulink01](/docs/graphics/simulink_01.png)
![simulink02](/docs/graphics/simulink_02.png)
![simulink03](/docs/graphics/simulink_03.png)
![simulink04](/docs/graphics/simulink_04.png)
![simulink05](/docs/graphics/simulink_05.png)

### Exported .zip File

blabla

## Model Configuration in LiveTwin

![livetwin01](/docs/graphics/livetwin_settings_01.png)
![livetwin02](/docs/graphics/livetwin_settings_02.png)
![livetwin03](/docs/graphics/livetwin_settings_03.png)
![livetwin04](/docs/graphics/livetwin_settings_04.png)

# Usage

## Running the Model in LiveTwin

![livetwin05](/docs/graphics/livetwin_settings_05.png)
![livetwin06](/docs/graphics/livetwin_settings_06.png)
![livetwin07](/docs/graphics/livetwin_settings_07.png)
![livetwin08](/docs/graphics/livetwin_settings_08.png)
![livetwin09](/docs/graphics/livetwin_settings_09.png)

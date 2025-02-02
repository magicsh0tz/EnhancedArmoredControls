#include "script_component.hpp"

#define MACRO_ADD_ACTIONS \
    class Eventhandlers: DefaultEventHandlers { \
        class VAR(addActions) { \
            postInit = QUOTE([(_this select 0)] call FUNC(addActions);); \
        }; \
    };

class CfgPatches {
    class NAME {
        units[]={};
        weapons[]={};
        requiredVersion=0.1;
        requiredAddons[]={};
    };
};

class CfgFunctions {
    #include "CfgFunctions.hpp"
};

class DefaultEventHandlers;
class CfgVehicles {
    class Car_F;
    class Wheeled_APC_F: Car_F {
        MACRO_ADD_ACTIONS
    };

    class Tank;
    class Tank_F: Tank {
        MACRO_ADD_ACTIONS
    };
};

class Extended_PreInit_EventHandlers {
    class VAR(preInit) {
        init = QUOTE([] call COMPILE_SCRIPT(XEH_preInit.sqf););
    };
};

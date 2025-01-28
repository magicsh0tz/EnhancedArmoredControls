#include "script_component.hpp"

#define MACRO_ADD_ACTIONS \
    class DefaultEventhandlers; \
    class Eventhandlers: DefaultEventhandlers { \
        class VAR(addActions) { \
            PostInit = QUOTE(_this call FUNC(addActions)); \
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

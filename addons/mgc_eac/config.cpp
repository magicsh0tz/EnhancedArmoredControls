#include "script_component.hpp"

#define MACRO_ADD_ACTIONS \
	class UserActions { \
		class VAR(takeControls) { \
			displayName = "Take controls"; \
			displayNameDefault = ""; \
			priority = 10; \
			radius = 10; \
			position = ""; \
			showWindow = 0; \
			hideOnUse = 1; \
			onlyForPlayer = 0; \
			shortcut = ""; \
			condition = QUOTE([ARR_2(([] call FUNC(getPlayer)),this)] call FUNC(canTakeControls)); \
			statement = QUOTE([ARR_2(([] call FUNC(getPlayer)),this)] call FUNC(takeControls);); \
		}; \
		\
		class VAR(releaseControls) { \
			displayName = "Release controls"; \
			displayNameDefault = ""; \
			priority = 10; \
			radius = 10; \
			position = ""; \
			showWindow = 0; \
			hideOnUse = 1; \
			onlyForPlayer = 0; \
			shortcut = ""; \
			condition = QUOTE([ARR_2(([] call FUNC(getPlayer)),this)] call FUNC(canReleaseControls)); \
			statement = QUOTE([ARR_2(([] call FUNC(getPlayer)),this)] call FUNC(releaseControls);); \
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

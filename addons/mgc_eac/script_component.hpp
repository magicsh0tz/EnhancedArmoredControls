#define NAME mgc_eac

#define QUOTE(var1) #var1
#define FUNC(var1) ##NAME##_fnc_##var1
#define QFUNC(var1) QUOTE(FUNC(var1))
#define VAR(var1) ##NAME##_##var1
#define QVAR(var1) QUOTE(VAR(var1))

#define ARR_2(var1,var2) var1,var2
#define PATH(var1) \##NAME##\var1
#define QPATH(var1) QUOTE(PATH(var1))
#define COMPILE_SCRIPT(var1) (compileScript ['PATH(var1)'])

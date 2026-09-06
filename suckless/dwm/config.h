static const unsigned int borderpx  = 1;      
static const unsigned int snap      = 32;    
static const int showbar            = 1;    
static const int topbar             = 1;   

static const char *fonts[]          = { "Terminess Nerd Font Mono:size=23" };
static const char dmenufont[]       = "Terminess Nerd Font Mono:size=21";

static const char col_black[]       = "#000000";
static const char col_dark_gray[]   = "#222222";
static const char col_dim_gray[]    = "#666666";
static const char col_pure_white[]  = "#ffffff"; 

static const char *colors[][3]      = {
    /* fg              bg         border   */
    [SchemeNorm] = { col_pure_white,   col_black, col_dark_gray },
    [SchemeSel]  = { col_pure_white, col_black, col_pure_white },
};

static const char *tags[] = { "i", "ii", "iii", "iv", "v" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};


static const float mfact     = 0.55; 
static const int nmaster     = 1;   
static const int resizehints = 1;  
static const int lockfullscreen = 1;
static const int refreshrate = 60; 

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile }, 
	{ "><>",      NULL },  
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/bash", "-c", cmd, NULL } }

static char dmenumon[2] = "0";
static const char *dmenucmd[] = {
    "rofi"
    "-show drun"
};
static const char *volmute[] = { "/home/mrijann/.config/scripts/volume.sh", "--toggle", NULL };
static const char *voldec[]  = { "/home/mrijann/.config/scripts/volume.sh", "--dec",    NULL };
static const char *volinc[]  = { "/home/mrijann/.config/scripts/volume.sh", "--inc",    NULL };
static const char *termcmd[]  = { "/usr/local/bin/st", NULL };

static const Key keys[] = {
    // launcher, tui, apps
	{ MODKEY,                       XK_space,  spawn,          SHCMD("rofi -show drun") },
    { MODKEY|ShiftMask,             XK_e,      spawn,          SHCMD("thunar") },
    { MODKEY,                       XK_e,      spawn,          SHCMD("/usr/local/bin/st -e yazi") },
    { MODKEY,                       XK_b,      spawn,          SHCMD("~/.local/share/appimages/helium.AppImage") },
    { MODKEY,                       XK_Delete, spawn,          SHCMD("/usr/local/bin/slock") },
    { MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
    
    // scripts
    { MODKEY,                       XK_c,       spawn,          SHCMD("~/.config/scripts/config.sh")},
    { MODKEY,                       XK_n,       spawn,          SHCMD("~/.config/scripts/nightlight.sh")},
    { MODKEY,                       XK_r,       spawn,          SHCMD("~/.config/scripts/reload.sh")},
    { MODKEY,                       XK_Print,   spawn,          SHCMD("import -window root screenshot.png")},
    { 0,                            XK_F1,     spawn,          {.v = volmute } },
	{ 0,                            XK_F2,     spawn,          {.v = voldec } },
	{ 0,                            XK_F3,     spawn,          {.v = volinc } },
    { 0,                            XK_F9,     spawn,           SHCMD("~/.config/scripts/autoclick.sh")},

    { MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_f,      togglefullscr,  {0} },
    { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_w,      killclient,     {0} },
	{ MODKEY,                       XK_z,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

///* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin *///
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};


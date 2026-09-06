const unsigned int interval = 1000;
static const char unknown_str[] = "n/a";
#define MAXLEN 2048

static const struct arg args[] = {
    /* function     format              argument */
    { wifi_essid,   " | %s ",       "wlp1s0" },
    { wifi_perc,    "(%s%%) | ",        "wlp1s0" },
    { battery_perc, "%s%% | ",          "BATT" },
    { datetime,     "%s ",             "%I:%M %p" },
};

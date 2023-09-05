# usefull_scripts_for_webserver

to add another web app to caddy add another "handle" block in caddy.json:

```
{
    "handle": [
            {
                "handler": "subroute",
                "routes":[
                    {
                        "handle": [
                            {
                                "handler":"reverse_proxy",
                                "upstreams": [
                                    {
                                        "dial":"localhost:CHANGE_PORT"
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
    ],
    "match":[
        {
            "host":[
                "CHANGE_DOMAIN.iw4sz.pl"
            ]
        }
    ],
    "terminal": true
}
```

as an another element of an array called "routes" in the caddy.json
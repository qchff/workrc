var DIRECT = "DIRECT";
var VPS_SOCK = "SOCKS5 127.0.0.1:8888; SOCKS 127.0.0.1:8888;"

var GFW_LIST = {
    "google.com" : true,
    "googlecode.com" : true,
    "facebook.com" : true,
    "false" : false
};

/* main */
function FindProxyForURL(url, host) {
    /* hao123 proxy */
    
    /* gfw proxy */
    if (gfwPorxyRet = gfwProxy(url, host)) {
        return gfwPorxyRet;
    }

    /* direct */
    return DIRECT;
}

function host2domain(host) {
    var dotpos = host.lastIndexOf(".");
    if (dotpos === -1)
        return host;
    // Find the second last dot
    dotpos = host.lastIndexOf(".", dotpos - 1);
    if (dotpos === -1)
        return host;
    return host.substring(dotpos + 1);
};

function gfwProxy(url, host) {
    if (GFW_LIST[host2domain(host)]) {
        return VPS_SOCK;
    }
    return false;
}

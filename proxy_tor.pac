/**
 * Proxy Auto-Config
 *
 * https://en.wikipedia.org/wiki/Proxy_auto-config
 * https://en.wikipedia.org/wiki/Web_Proxy_Auto-Discovery_Protocol
 * https://web.archive.org/web/20070307124216/http://wp.netscape.com/eng/mozilla/2.0/relnotes/demo/proxy-live.html
 * http://findproxyforurl.com/
 */

/**
 * PAC
 *
 * @param string url
 * @param string host
 *
 * @returns {string}
 */
function FindProxyForURL(url, host) {
    // ByPass Internal Network
    if (isPlainHostName(host) ||
        shExpMatch(host, '*.local') ||
        shExpMatch(host, '*.localhost') ||
        shExpMatch(host, '*.dev') ||
        shExpMatch(host, '*.app') ||
        // isInNet(dnsResolve(host), '10.0.0.0', '255.0.0.0') ||
        isInNet(dnsResolve(host), '172.16.0.0', '255.240.0.0') ||
        isInNet(dnsResolve(host), '192.168.0.0', '255.255.0.0') ||
        isInNet(dnsResolve(host), '173.37.0.0', '255.255.0.0') ||
        isInNet(dnsResolve(host), '127.0.0.0', '255.255.255.0')) {
        return 'DIRECT';
    }

    // Force throu TOR
    if (dnsDomainIs(host, 'twitter.com') ||
        dnsDomainIs(host, '.facebook.com')) {
        return 'SOCKS5 127.0.0.1:9150; DIRECT';
    }

    // If the host requested can be resolved by DNS, then be happy
    // if (isResolvable(host)) {
    //     return 'DIRECT';
    // }

    // All other Traffic: 1st Try throu TOR, then Direct
    return 'DIRECT; SOCKS5 127.0.0.1:9150; DIRECT';
}

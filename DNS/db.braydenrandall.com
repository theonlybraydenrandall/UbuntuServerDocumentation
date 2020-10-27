;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	braydenrandall.com. root.braydenrandall.com. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	braydenrandall.com.
ns      IN      A       192.168.83.130
@	IN	A	192.168.83.130
test    IN      A       10.0.0.1
*       IN      CNAME   braydenrandall.com.

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D6833066D
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974242; cv=none; b=ElQfNWWO2L7gjcqIp6q2VvCS69H9jRtVi8Zl7M5ux0zJlwdu8HI9bzVlExl4I5exCNKAmKDvu7+Ncna0/CIWK1a5CgmKrDhUp7Y8ptWTkomMyHy3UcV5xcoUIX8DObKDlo0Mfl0z+rNCssfQ7kHY6pprweUvzCdNg+zdAgcoFDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974242; c=relaxed/simple;
	bh=GB2zSiCiH2B2MkSpdmM8X1Yz2rkioSL551rkMUaheIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6qL0o/cTnzkigMxLwS1tKQKnoLkrSXkGIXQxOh6OjPtj1wa8KS8BkUfeFLxWw7pFM8j9OE8Wkiosihj4wsfF7sTCzoZ9+x4aBzKgv2Guwxk1ff6NB/Rk4tAmFUapgLmT8S+J5IrXiiDc/3Z6BQgQmXYKEg+YbMAE+X9L3trgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dmaJ5jtd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7nj+Fh3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dmaJ5jtd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7nj+Fh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777974237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=;
	b=dmaJ5jtdLJSdH9PZjrm+u5GTvfAiIM5WnJ5pZV7AxMxDAp13oCSR8MJ4clZAMBaG11nIxF
	V8XMZmIbxNu7zOPnMlIOHDZK7ycUwLxFzLNaCnf7FSzL37NXYkdnocz5I9Li2F5gCgDaou
	iKWnxA73AGYgd16jh6XY0Wxns1UJyno=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-KgQh9UlZPCaLHGJdG07utQ-1; Tue, 05 May 2026 05:43:55 -0400
X-MC-Unique: KgQh9UlZPCaLHGJdG07utQ-1
X-Mimecast-MFC-AGG-ID: KgQh9UlZPCaLHGJdG07utQ_1777974235
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488d1b5bca0so26466625e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777974235; x=1778579035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=;
        b=S7nj+Fh3WCbGbI0DGXVJBqzGHwNtS3l9uWyAD6/JKz4Op6jyDPm1PVe7AXoOAdnlh3
         ukZ0StxGuTc7dLkPVXbgyma7max8RaL+L3rAPsNvBD9aCoP/RFHUB1IC5qfzlnOPY/Bq
         XzqQ5go/kBcqS/s6+4qBpBF9hpMWELlacBZXratPi65r6AA5f65JOLtIJWk+jrQYW++S
         MCvWY8eOjHdG2ga/7V0xqBmkQXpPGTevYQA/ckyOcX7hfEWz3Yh3KOti0PpCG4j5Od65
         twv6GyQ1m+slWop2HqHTyoy3AsgVWrh/Ctqu1qnupV6+BJkLhvkFG0AiFXW1geW0Lx3C
         3aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974235; x=1778579035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=;
        b=ZQNtw1xAOH3iOQH5oaFlfw0nwBN3ffUuoz7Ks72Qyq/qISLbZmF7u2vz3hGahXB5XJ
         X722kt4f13iu4QyLJPp+xRzd4fqMqfsvLKhfkjgyJoqlynx/TpVfrtBdjv7iIHcWY7/I
         7wfD6/DwLyXT4WNZjXyrV6/rm1W0v8S8GrdafCvO33v6+YcmyRUqsZQDGV6JHEzdVbPz
         zO0C4h6/AvZcm3VaD+lHKKqa6JEjenNTtfVWO+GRfmy/dU5bW4+cJ9v3GGejoIczMXyQ
         SmZW7ijla3J0yjVkGZkaM6AXZK0OKWMgd49Zx82DyTujw7eV48GuNpOJbn6lNPC+eykQ
         MUJw==
X-Forwarded-Encrypted: i=1; AFNElJ9+SrJ+Onzs5eDoPctThK5+VNrkt50EfJo1RBUt4frhtyc5QIU/6odAWn/KEDvl8J16pntQCnbicALi@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVYN71J+V6kW7QLA4lFjrVXlZHvTLZaQuplxm9t0BV+HTcpSV
	hZdyo9geU5Jlrar/WneyBTShoGV9//JNg3eU57hJKqhbHlH0y2DHECxnh/7JMvYe6QqD6UMT/yt
	W+J/aKegpLADH48TWENjBMWl5OSSQde/GjmjKfC7yGNU5CWXF+QQWsFcmJCQE+9M=
X-Gm-Gg: AeBDieuNUO8MSq7qu1HL0KriM8gGk1+m2PeRNyC1clUIrljtqLqHsM3PIHuUREWvIH0
	SHMyljv0M+f1b9lRhqb51gibskcWAVBn6rVy+8akH/5vldTdjcbNi+IQ0VKZ+km0Drqi+cpJJg0
	PvE+faNXwYRbBpJpxOV6Yj/QLNxQEuz9kz3eJUHsXesj8lUz42d/6q0FP0xtSlFlAUHl0UDQlVG
	7v71NL1Gaz4W5dhb6l/6Mqu96a0tBfFly5T8h2lCMXrPCBCies3JtUNfeqOmrUbmpunxfLNgEio
	Y5Sp3FLsn0Ic0/7xDTjKwX9y1/F/MCExVCmCoCu5nQ+/b7ZzXo+ZiFeX+kaRRl+qxOzYmJNFXTw
	OTBbps0GSZGTaasB2HGyZLtW/+ICxa5qP1DyGN0mngRXBIiv0hAvFvXkqNz8lq0yTFXU=
X-Received: by 2002:a05:600c:46d1:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a988ca441mr218126965e9.29.1777974234589;
        Tue, 05 May 2026 02:43:54 -0700 (PDT)
X-Received: by 2002:a05:600c:46d1:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a988ca441mr218126385e9.29.1777974234170;
        Tue, 05 May 2026 02:43:54 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm603894855e9.1.2026.05.05.02.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:43:53 -0700 (PDT)
Message-ID: <37382811-ba47-4432-9911-6c39acea4f86@redhat.com>
Date: Tue, 5 May 2026 11:43:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 15/15] net: dsa: netc: add support for ethtool
 private statistics
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
 frank.li@nxp.com, chleroy@kernel.org, horms@kernel.org, linux@armlinux.org.uk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-16-wei.fang@nxp.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260430024945.3413973-16-wei.fang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/26 4:49 AM, Wei Fang wrote:
> Implement the ethtool private statistics interface to expose additional
> port-level and MAC-level counters that are not covered by the standard
> IEEE 802.3 statistics. The pMAC counters are only reported when the port
> supports Frame Preemption (802.1Qbu/802.3br).
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/dsa/netc/netc_ethtool.c   | 107 ++++++++++++++++++++++++++
>  drivers/net/dsa/netc/netc_main.c      |   3 +
>  drivers/net/dsa/netc/netc_switch.h    |   9 +++
>  drivers/net/dsa/netc/netc_switch_hw.h |  58 ++++++++++++++
>  4 files changed, 177 insertions(+)
> 
> diff --git a/drivers/net/dsa/netc/netc_ethtool.c b/drivers/net/dsa/netc/netc_ethtool.c
> index ac8940b5a85c..8d04db534347 100644
> --- a/drivers/net/dsa/netc/netc_ethtool.c
> +++ b/drivers/net/dsa/netc/netc_ethtool.c
> @@ -19,6 +19,56 @@ static const struct ethtool_rmon_hist_range netc_rmon_ranges[] = {
>  	{ }
>  };
>  
> +static const struct netc_port_stat netc_port_counters[] = {
> +	{ NETC_PTGSLACR,	"port gate late arrival frames" },
> +	{ NETC_PSDFTCR,	"port SDF transmit frames" },
> +	{ NETC_PSDFDDCR,	"port SDF drop duplicate frames" },
> +	{ NETC_PRXDCR,		"port rx discard frames" },
> +	{ NETC_PRXDCRRR,	"port rx discard read-reset" },
> +	{ NETC_PRXDCRR0,	"port rx discard reason 0" },
> +	{ NETC_PRXDCRR1,	"port rx discard reason 1" },
> +	{ NETC_PTXDCR,		"port tx discard frames" },
> +	{ NETC_PTXDCRRR,	"port tx discard read-reset" },
> +	{ NETC_PTXDCRR0,	"port tx discard reason 0" },
> +	{ NETC_PTXDCRR1,	"port tx discard reason 1" },
> +	{ NETC_BPDCR,		"bridge port discard frames" },
> +	{ NETC_BPDCRRR,	"bridge port discard read-reset" },
> +	{ NETC_BPDCRR0,	"bridge port discard reason 0" },
> +	{ NETC_BPDCRR1,	"bridge port discard reason 1" },
> +};
> +
> +static const struct netc_port_stat netc_emac_counters[] = {
> +	{ NETC_PM_ROCT(0),	"eMAC rx octets" },
> +	{ NETC_PM_RVLAN(0),	"eMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(0),	"eMAC rx frame errors" },
> +	{ NETC_PM_RUCA(0),	"eMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(0),	"eMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(0),	"eMAC rx packets" },
> +	{ NETC_PM_TOCT(0),	"eMAC tx octets" },
> +	{ NETC_PM_TVLAN(0),	"eMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(0),	"eMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(0),	"eMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(0),	"eMAC tx packets" },
> +	{ NETC_PM_TUND(0),	"eMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(0),	"eMAC tx invalid octets" },
> +};
> +
> +static const struct netc_port_stat netc_pmac_counters[] = {
> +	{ NETC_PM_ROCT(1),	"pMAC rx octets" },
> +	{ NETC_PM_RVLAN(1),	"pMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(1),	"pMAC rx frame errors" },
> +	{ NETC_PM_RUCA(1),	"pMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(1),	"pMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(1),	"pMAC rx packets" },
> +	{ NETC_PM_TOCT(1),	"pMAC tx octets" },
> +	{ NETC_PM_TVLAN(1),	"pMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(1),	"pMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(1),	"pMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(1),	"pMAC tx packets" },
> +	{ NETC_PM_TUND(1),	"pMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(1),	"pMAC tx invalid octets" },
> +};

Sashiko says:

Are these standard MAC and interface statistics being duplicated in the
driver-private ethtool strings?
The networking subsystem guidelines indicate that statistics which have
a standard uAPI must not be duplicated in ethtool -S. Standard
interfaces like struct rtnl_link_stats64 or struct ethtool_eth_mac_stats
already exist for counters such as rx octets, rx packets, dropped
packets, and FCS errors.
Could these metrics be exposed through the standardized interfaces
rather than adding them to the private string sets?

Other comments are AFAICS false positives.

/P


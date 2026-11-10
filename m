Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274660;
	b=n2PdhKEIEzKAxYylyW4iplg2Y5zK0NLGznV6FGCSc/kyekjGIb9sZVcuB0EjblMn67k6
	 WvItJc0v0/OIWn7XKCPzMt6hLgEaBjOUsOGcddZahZgfofhxM2kSHsO7t9Ae3Mv+A6gKi
	 G22pD/goNv5iUgR/bpCUca8qKSREauPx/BkLYQmW7ZL0iXT+JqJaZzSLTHL3FtqjBNLE9
	 yhw1njKhLLoexua4ZsqMyviXWOhYqcxbKnF8RUWCvQPNKv66FRQa9E+E0NGFrVVI7/mi3
	 ICqbfnXP/ClCnIjN6f31jdrori+Uqg5aB/RHND9uImCNLuVdDuVgesAcpdLPjnANNtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3ifG6N3GjuE9TBQMDJaU7DFuzuDNphSyfQc7VRPrMxs=;
	b=fEwRAlkjl8wwckNlnNV0d2mamRpWippEZAmNsoOmwS6+oMq6WXo6Lg04RbQ2ycHHH+6L
	 zabj3pirWlZhdHSRbKZxrZRMT00n1pFAhiAR0JozQMMycQABdPhxWE0GBjL4EKhkqPoN+
	 oa9ZLHqw8ZSiYfIIaL53CTnpls3vLDsx1c2/eoTfmYy0oAq5HUOhNj55zXrI4Xbuabiap
	 sdsOOHAB8aOtewpTHTubIIGb0j2/LEGu9Yravl7q37c/wBZ3X5GnNvw+1BnU1w8nwd0iK
	 dbZZdBIIk47jK4I1ZQRdVrcRKieEHDHGgwxtaFYZ725FM960/Lfx/Rz0HXPHt98A4Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBlZeamq;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1505B606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1505B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBlZeamq
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso790885a91.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274659; x=1794879459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ifG6N3GjuE9TBQMDJaU7DFuzuDNphSyfQc7VRPrMxs=;
        b=hBlZeamqIG4O4UJIwhlyMcIZ9LtjScEAhmubW3e4YC1FQDGaHKqvO3ZSBRS06PbZLy
         +puWAUfVZSYwgQGtkdDcmVJcLGGkutb64jnoqDHkcP4IZaN2rh16vuD9IE/B5mm6uGoV
         E0sRV6w8SkBsQU84rXw17zAorJLHZXqx/PJNjE5RKtEQjPflNnuJgFiCquOvg8V0a5BG
         mrhJymnLWFCH6Wb+pVTbdLxFD3wiicAl6jFXAq3QW8akYRXBSoxfb8JRHgeHvZMlgmVe
         kO2BkIyKeU11vKH/4x+3HW54FF4WiS2DjxQQ6k1MnwxKnKvjMmW5Z7TLe4mTQKStQYiI
         gZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274659; x=1794879459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ifG6N3GjuE9TBQMDJaU7DFuzuDNphSyfQc7VRPrMxs=;
        b=2KzzzTpxNzRDg30RU2yDgtvhrVDhE/c3iYQy3vkhrVLP95UfPXuLpQ4401JK4+s+6d
         bsKEKfEhg2C9kZMOSyDNiUI8fo0ecqy16RhUoxCvZEHreTmjktbRWMs/st8NHFumtfZP
         12PgZqX4T4jtIk+QRskwczGs0AINjC+VJuUfHBa8WHVnPoumle2caw/kJgDDHjYQu+Hr
         RTKczv6eFpKGQxdTuL4dM/DSZ1XYqnCCFg230J4ZdbORypdxkJih9ohyboIGale7At0y
         uRaQn8TSBypnuWyB8nB2o5EdJMPP01vzcz38L4ifcBM4fNIdhuDUSYvQ5SGD5DtdGKeg
         N5eQ==
X-Forwarded-Encrypted: i=1; AL+hErEiLe14dVNGAGQw8MW7nvh8VG7s9Pj5yfG3oVn4tXBYi8kG7hrjSLX77jMRlXoe+B6jvlHvaxQXV+PN@vger.kernel.org
X-Gm-Message-State: APuU4Z/XdDUS/717NLVDNdIpS7T5JQqTYwq0cVuszLdvDXu2D3JdTHCo
	3W22OI+N2zlt8DoD9R66lxWm91YwCQZFEamlmnjI42PD0phUVZcnxlDe
X-Gm-Gg: AYBFou0RTRBQJRSYWmJBZN6hTvnJCIdstQ5NOHym04Dftu1TNqlLudyB+G6VLg7gL0M
	jshsVy8RdOAHw/GXLJdgchozW8AUpvRS9zh1AJg6rN8eRymm8MwXi1TG75e3vwIk7B7wKUNpkNt
	ye6jSFtrzDSsCaXjDfzIXoxl4l+j/DOz5qsbTIlGKEGjwKWeDhflO/xLKjCkzGasDzE3SULtVU+
	3xJulbxgDl+IWQHT6Rq3YMdfOTXfSFYSygjOe31YTZ9lPWr06PRdwDSDaEY1FoktbogNzdPOQlO
	8ZqYWdK1FUw4pT7Xq1L5BVhlo1qM1O8ytCq0aTIxAMTOWtzQlucEqsIpvtoROe11o6awcx27lVq
	rO4Q5oNj+DUKedERxI5KwdqSFX3i8IumMaJYo+EaCIEuBbxgJybhRtdOgQ4Boo/Unx5mZ/DFKZ/
	+XqNRlvZLk9DFmNrAwPgweQkBXnVuT4nnS4V9y97zKpEIOzKWYIa2jITqqsVYdyFfFN3/1eTJ64
	rkzq4cq2qbgm7ZAkgkUDDs57bBPIeM5Zcsak4o11updOjNlqgPn/wimWRDbNgbB6EGC3Qw7DHjM
	SjyKXKebQ3xCXEmYaeq/6AFWYgXjvh6CgWNZhSHTLKJj/5hyJKfZ7SGhymF0YyqDA8dEe/1PQCB
	HBypDayJR+Q==
X-Received: by 2002:a17:90b:2e49:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b166c92193mr1307280a91.16.1794274659234;
        Mon, 09 Nov 2026 17:37:39 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16792aabfsm1657287a91.12.2026.11.09.17.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:37:38 -0800 (PST)
Message-ID: <81e91f05-f172-4bbf-b5a6-76f2767ea82b@gmail.com>
Date: Tue, 10 Nov 2026 09:37:35 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
References: <20261109065606.62641-1-a0987203069@gmail.com>
 <20261109065606.62641-5-a0987203069@gmail.com>
 <sashiko-outbox-204535@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <sashiko-outbox-204535@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/2026 3:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] phy: nuvoton: missing MFD_SYSCON select and unchecked
>    regmap_read()
> --
>
> commit ce87e45e509dca5386021bb0dd4e3bb91e3935d8
> Author: Joey Lu <a0987203069@gmail.com>
>
> phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
>
> This commit extends the Nuvoton MA35D1 USB 2.0 PHY driver to support both
> PHY0 and PHY1, updates clock-stability polling in phy_init(), registers a
> read-only USB role switch for PHY0, and adds resistor calibration and
> over-current polarity device-tree properties.
>
>> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
>> index d02cae2db315a..1f37e860de507 100644
>> --- a/drivers/phy/nuvoton/Kconfig
>> +++ b/drivers/phy/nuvoton/Kconfig
>> @@ -6,6 +6,7 @@ config PHY_MA35_USB
>>   	tristate "Nuvoton MA35 USB2.0 PHY driver"
>>   	depends on ARCH_MA35 || COMPILE_TEST
>>   	depends on OF
>> +	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
>>   	select GENERIC_PHY
>>   	help
>>   	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
>> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> index 0b9976fb15c17..bc706356c4341 100644
>> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> [ ... ]
>
>> +static int ma35_usb_phy_init(struct phy *phy)
>> +{
>> +	struct ma35_phy_port *port = phy_get_drvdata(phy);
>> +	struct ma35_usb_phy *p = container_of(port - port->idx,
>> +					      struct ma35_usb_phy, port[0]);
>> +	unsigned int n = port->idx;
>>   	unsigned int val;
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(p_phy->clk);
>> -	if (ret < 0) {
>> -		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
>> -		return ret;
>> -	}
>> +	ret = clk_prepare_enable(p->clk);
>> +	if (ret)
>> +		return dev_err_probe(p->dev, ret, "failed to enable clock\n");
>>   
>> -	regmap_read(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, &val);
>> -	if (val & PHY0SUSPEND) {
>> -		/*
>> -		 * USB PHY0 is in operation mode already
>> -		 * make sure USB PHY 60 MHz UTMI Interface Clock ready
>> -		 */
>> -		ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
>> -						val & PHY0DEVCKSTB, 10, 1000);
>> -		if (ret == 0)
>> -			return 0;
>> -	}
>> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
>>   
>> -	/*
>> -	 * reset USB PHY0.
>> -	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
>> -	 */
>> -	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR | PHY0SUSPEND));
>> +	if ((val & USBPMISCR_PHY_SUSPEND(n)) &&
>> +	    !ma35_usb_phy_wait_ready(p, n, &val))
>> +		goto out;
> [ ... ]
>
>> +static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
>> +{
>> +	struct ma35_usb_phy *p = usb_role_switch_get_drvdata(sw);
>> +	u32 val;
>> +
>> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
>> +
>> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
>> +}
> [Severity: Medium]
> Can val be used uninitialized in ma35_usb_phy_init() and
> ma35_role_sw_get() when regmap_read() fails or is stubbed out?
>
> Neither PHY_MA35_USB nor ARCH_MA35 selects MFD_SYSCON, so PHY_MA35_USB can
> be built with CONFIG_MFD_SYSCON=n and CONFIG_REGMAP=n.  In that
> configuration, syscon_regmap_lookup_by_phandle() always fails with
> -ENOTSUPP, and the regmap_read() stub returns -EINVAL without writing val,
> causing the compiler to flag val as uninitialized in ma35_usb_phy_init()
> and ma35_role_sw_get().
>
> Selecting MFD_SYSCON in PHY_MA35_USB and checking the regmap_read() return
> value (or initializing val) would avoid both issues.
MFD_SYSCON: valid in part. Neither ARCH_MA35 nor PHY_MA35_USB selects
MFD_SYSCON, and with CONFIG_REGMAP=n the regmap_read() stub returns -EINVAL
without writing val, so the compiler can warn about val being uninitialized.
In practice the probe would already fail at 
syscon_regmap_lookup_by_phandle()
(-ENOTSUPP) and never reach those paths. The missing dependency is the real
problem, so in v9 I'll add "select MFD_SYSCON" to PHY_MA35_USB (it selects
REGMAP_MMIO as well). I'll keep regmap_read() unchecked as discussed with
Mani, since once syscon is guaranteed the reads are plain MMIO and do not
fail.

Joey

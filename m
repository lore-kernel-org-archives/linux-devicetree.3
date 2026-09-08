Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51313434998
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896416; cv=none; b=dhmlgncVPnXJtMDoKI1SZsRm6xjFvM0H4A7QZvQeoMQgHdntM9aTObmMyXCsMJ6zFZPlL5TfcknLrIbzvNBUEFvryAJQ04a+V/1Z+puspaglgzS7ErNbJU1TWeJpWAWotqLWGw4j3+Tj6MHoJFfezr3cUG6pow6ElCxYQOEyZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896416; c=relaxed/simple;
	bh=EsrGjrnP7IgSiDLJcakyY4ms71wqAvVcdyupbrs+ipo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVu/PJzsMQPieE8tdhJelccEaRZq0iSojp1+5aSgGutDHqPNk1s8i21DQBzAEOvfeiwHSoAA+HDx7dfGiFftzsKzJqiuqd+fDdwN/1n6+K2ouqG3qo0S7lj2ePMBda+z7U/kosUnVLCUfPFSBv3oR6qg3D1nnCT5xSdx3M+PovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEDHWMJM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEDHWMJM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484392e3d33so3597241f8f.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 12:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896412; x=1789501212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=TEDHWMJM9duaytD8JkqocezS6iP42AtBh5KBUdL6VJfMAo8G72zIpPgMijD++58Po0
         YwHwizi3QVSNbvl4pEaWbB6M+s9YZwMWDOxMFtEILOG/FKg4VCuHJvoiejsBGj/B8ELd
         M6MBENKrWZ/n8I8xUJVhLId7XCco84KBIIBd6Q3NUTtCaMHVeFeMf1doV9F52xOheVWd
         ZafumnTzVsVcJ//LRyR7yjnBPr1uq+kT7RtXKWt7YOL3NTbu2nSpJmOBbctZl8f7VUDn
         MHay7jF4KqXdYWKswO4Url/5cuki37cFsHDoyppV6YdOQGmyHB73PIIkwYzxyZ1J62Ib
         xNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896412; x=1789501212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=XGOrz+sPMoVbzOZBCGWpdX2HJjeAWKBq4lwWbf6JyacLw0+2+f1/0LWVSC6MarRJ3x
         96GwIcMlktmxcMboY3CRtY7M6r4AbC6uPSkTxWramjX9FLN/3/q+JBnAPYM/R7UU4AUe
         SYBXe82UZne2DP3kxcbsS7zbHukfeWuAuYor8nZOPs/pXrsxZhYXp0H1RW5bEjOWb7fe
         FyCCFrq/a1Jd34bsq8H7ryAokUXCPxjRv5Ry8mBQjYZBeoM3FUNi8BRP2uco71T3Shnb
         tfey+aRo1Op126L4Phsnm+bPjDtWC9hxOJD+VOw1dmidvNlVPG45GxnQTeFgR8QS/rF9
         92pA==
X-Forwarded-Encrypted: i=1; AKwUvByFuRgRia3cSuKdAckVH5x/VjntAUTy1Jtzhsupbqyzkwk+L30HNOHTfYCKZ3SpZAofNN3w9bWQt68t@vger.kernel.org
X-Gm-Message-State: AFuF++mezXbQLCcdMFTWEPQ3HTvU6/Sf2/uPkFwZbARXpHGafNSgvCz6
	apZEjSOSEyDS0WwrNNtBkFJ1lR4Eo18Bk+PSma3HxxE6KIYC5er29OYW
X-Gm-Gg: AYBFou2nd6JGxSRBzIP93FERzcftLV+6VkWNmTp/J6zdctKfy/LJIGmpiZR0MWAJmC6
	lwi2d2ZTVQWU0fM1fS7omMx8o8vplnlm17aBwFKIKLXB8AIzc3mX/TYmtfQ0PRXeDDgqf7TKrGj
	WU9+NP0KRJF+8ytcWKQS20RnEkTRM5b2RABlU27ZBBam3NMT/S+F35a/YH6qw1MGKVtCA3FvX0p
	E5di1C3Tp7L3RFUuCHoilcnR59PXtUA/6FABo0yjCU4OmqfosqM7bAnhu2lyW0JWr33b0ZqoFBA
	KbGRJ4Y8VJ+CNh3Oum8ONNhxxwe4Z4VklF/oA1LhCG58QTCaX72f4QH75WBXc4p25yEzCRQdIfb
	nme2DSMMAq4ksFpa72MAzpuxYdWfYBG31Galf/jDpq3119wVfl7bjlbJNa/kG6nw2EuhuVICNde
	rn4wcsR1+FghrSFYCwfxPd+HTbtdF7F+XVLls0WEYvPB9nX9Tbo16pumRlq9xJRd4LF3wMPMZBl
	7m7WUVeIG5CcdPPvG4Xbp3YMPI6tocqciKXJ6YBsaq77mirjdY+Tjog4rOUU2fHSfxBDlwGwBHz
	VIUBWq2l4x1r3VJORi0hvS6E
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr321721005e9.15.1788896412155;
        Tue, 08 Sep 2026 12:40:12 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm991795e9.4.2026.09.08.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:40:10 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:39:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Message-ID: <aqBhF5oS1A2W6dAa@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-2-arnd@kernel.org>

On Tue, Sep 08, 2026 at 05:27:51PM +0100, Arnd Bergmann wrote:
>  62 files changed, 19 insertions(+), 10501 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
> @@ -275,18 +275,10 @@ static int sa1100_rtc_probe(struct platform_device *pdev)
> -	if (IS_ENABLED(CONFIG_ARCH_SA1100) ||
> -	    of_device_is_compatible(pdev->dev.of_node, "mrvl,sa1100-rtc")) {
> -		info->rcnr = base + 0x04;
> -		info->rtsr = base + 0x10;
> -		info->rtar = base + 0x00;
> -		info->rttr = base + 0x08;
> -	} else {
> -		info->rcnr = base + 0x0;
> -		info->rtsr = base + 0x8;
> -		info->rtar = base + 0x4;
> -		info->rttr = base + 0xc;
> -	}
> +	info->rcnr = base + 0x0;
> +	info->rtsr = base + 0x8;
> +	info->rtar = base + 0x4;
> +	info->rttr = base + 0xc;

This drops the layout switch but keeps "mrvl,sa1100-rtc" in
sa1100_rtc_dt_ids[] and in bindings/rtc/sa1100-rtc.yaml, so a DT with
that compatible would now silently get the MMP register offsets instead
of the SA1100 ones.

> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> @@ -614,16 +614,16 @@ config S3C2410_WATCHDOG
>  	  be called s3c2410_wdt.
>  
>  config SA1100_WATCHDOG
> -	tristate "SA1100/PXA2xx watchdog"
> -	depends on ARCH_SA1100 || ARCH_PXA || COMPILE_TEST
> +	tristate "PXA2xx watchdog"
> +	depends on ARCH_PXA || COMPILE_TEST
>  	help
> -	  Watchdog timer embedded into SA11x0 and PXA2xx chips. This will
> -	  reboot your system when timeout is reached.
> +	  Watchdog timer embedded PXA2xx chips. This will reboot your
> +	  system when timeout is reached.
>  

"embedded into PXA2xx chips" is better.

The RTC_DRV_SA1100 help text a bit earlier in the patch also still says
"built into your SA11x0 or PXA2xx CPU".

Thanks,
Karl

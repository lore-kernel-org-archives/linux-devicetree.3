Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07AD4D7D39
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062768; cv=none; b=rWHc8Iilvtr/XtW6IE6f7Cy0nYzK55VQq4O8lw766P4tyg397oHqvARGJfvRSRDhmht5z4WAp5mzFa4SI6nSC9FlKUeHFk4mf0Gi1oxqZu0q5DdiznB1YguFBY3I8pzoideMKZsFtBNLnWV6qOhfBbGThOAkOJgC0lA87eRAf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062768; c=relaxed/simple;
	bh=VREGc/jXj0Z0SXjsh8IXf33tikwFMJzZfA+YaVWVO10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu3KTi7OPRhAAqSqH1a2GDcX1NVbs0g6oQmMqvrSRV6qYE116youLHhIpLu13zcVEaBZpeX1yrj818QCgq2PTqCIEgAmsSU/N+UkOZ7SnCVhYqT9mb9ZddrptyT6bv4iJlN++sA4bc2hxKnte/pxFgNtI1KMRC/5bxfyRGPYLW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYHJwrZ0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYHJwrZ0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b042c0759so3805520f8f.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062765; x=1792667565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=gYHJwrZ0sTEFvHLm33JMeU1sGznSZQ01c7GhBKC1gr/jfp36E/69TP8GMOJl3m66Ju
         xymDOJV5aSL3MZL5n89xwsx/bHyNCf1uO5rVAuZssBrdsR9jholTn3nWROwbe+maUtCA
         m9kHLky1wnyCQ7I/ww/wnQOInBoyf1lircn+eiUTGBPrKClzPRR0Vh7VpGY7ZZRhZ0R4
         xpvhtHOO8mm/jqDNDb224t5DVSzihv93fPfzZwhvJClwDEM3ieGra3jPSFndNfkyNLkK
         PyWRk4rnUEedsScS303QMBxRZfPsZPLxkpslvMHHRmW43D1Jj/+QWKcSPAWvTuw9OTZI
         NQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062765; x=1792667565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=HKwEWka2QcsMv4FJ+w0JbhiXpFisCpFzldDzKCL/n7PycySVNtTYElsxRh+bopEU8z
         N/lX6Ga0wHmC3IUd2UucCyd3F31SZHOCdG1CZVZ1RNkQ0ZSPFfZqca3HE0R5KLrhp2vS
         u351XfcSeNLFsQHZRPxa3c5a0ErV34Lc7KGFQLaK8D/8irPno0uRdN2ulGGMdypl4TB/
         hKw+owIjCldMG3XfSB2v9DQjB6etx6WWYPORWIvFAOL0zW2qbygmdFpg68fK7cQ3z1Fr
         CJBpePesiumOHM/JBp+kDcI9e528Up3xL857F5L0Z1V8uoZuP44wjoop2nw9a58CGovS
         ROOA==
X-Forwarded-Encrypted: i=1; AKwUvBx39+2zsSQRuMabHWAVM+hVX65cJIVa90VConzs4NAIAUrVWtw1t81BVbUgbFM44NtKxIFSsv+W5NIo@vger.kernel.org
X-Gm-Message-State: AFq9FYKxDnrhOgq4g3QbmetIqf8rnN+Vnw8TLFim5JuCq/9p35nY8HfC
	CWC6Wh9gZMegtKBn58NW/UVxLMIJ91AuPPU5mwb/ren3Ye/OsQxpcRar
X-Gm-Gg: AYBFou20twUK4ERflhMhamDPEFsbJr4wQJ1tcvQxpBRAubd163vB4/Ge//YlOzixB5D
	I0tgd1/UCXevW3J5kqRTm7YOuld8GVf39h9RdkVhY1Xh4aOq//PWymDy0qqA3bSoh574fY8tYXP
	lLjl2lw9gqLF8+FqjD6QRqSzGQJZTPdN5i6LCg3TXvTxONRIG9T+GGGauNM/IF4jDmpdrpTBe2H
	iS8BJoebNyAXPWdpTaRYUdZWYa+mdQHjXllKX0fT35V5sLlQHn7wybwHr9ApvHud19wV1swoCGo
	r9KZr/B05W9VkgomSB6UQVHSgimZH2/PHy9tnOEZbbEZY44vSVX3poGBnVB0+PuSRFqTGPzvZCB
	Wt3h16gVUvxkKG04Du5orTPTEwL0DVKobZ+xkchtMxrFmhL6y0mKzepOM3SMu0nZARJrPljtfP7
	yuYREZVrUFpIu+rShZLs2yDYMlFlqdJ8aByZCOqGaYPBIa5fQsSPuCj6sCmJ7xa5qtHep6zOJRY
	rW98qLNQ8dFrNPT+aMAkzLLoxVk+2UCrbux9YdqnA6B5Fny2jfR5i78KoCfEECL+/8IPTW2XYS2
	nUEqt7P+9YHLJs9nMXwBdBaMVg94
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id ffacd0b85a97d-48df14ed887mr6757337f8f.25.1792062764555;
        Thu, 15 Oct 2026 04:12:44 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm24262249f8f.49.2026.10.15.04.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:12:43 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:12:40 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atC1KAbaRwnrn-mR@Lord-Beerus.station>
References: <20261015081149.5919-1-stefano.r@variscite.com>
 <atCy2Li2wrPHhW8K@shlinux89>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCy2Li2wrPHhW8K@shlinux89>

On Thu, Oct 15, 2026 at 07:02:48PM +0800, Peng Fan wrote:
> On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
> >From: Stefano Radaelli <stefano.r@variscite.com>
> >
> >scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
> >following run-time warning is seen:
> >
> >gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> >
> >Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> >---
> > arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >index 3e590afa4fab..036afa0f6990 100644
> >--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >@@ -287,8 +287,8 @@ &i2c3 {
> > 	pinctrl-names = "default", "gpio";
> > 	pinctrl-0 = <&pinctrl_i2c3>;
> > 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> >-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
> >-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
> >+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 
> I think ODE should be configured for pinctrl_i2c3_gpio.
> 
> Regards
> Peng

Hi Peng,

I followed the same approach used in commit
2b1d5d054d29e08926f05cfa30e34d149644585e, as well as in the other i.MX
DTS files that use GPIO_OPEN_DRAIN for I2C bus recovery.

Even in imx8mn-evk.dtsi itself, I2C2 uses the same configuration,
with GPIO_OPEN_DRAIN specified in the GPIO properties and without
ODE enabled in the pinctrl.

Wouldn't introducing a different configuration for I2C3 create some
inconsistency and potentially cause confusion?

If enabling ODE in the pinctrl is the preferred approach, wouldn't it
make more sense to address this in a separate follow-up patch, updating
the existing I2C recovery pinctrl configurations consistently across the
affected DTS files?

What do you think?

Best Regards,
Stefano

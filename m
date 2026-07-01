Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281983EFD39
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895722; cv=none; b=eTE2BanXnA9mZrlmuPyLrxE6TNThfrxB9XPcPxKdP2ZT9BpMDkLb7hdnq9+JCr4MKLg5voSIlrV/+izkNLyDN6GJQmgLu+3aMtfNCkzxPYSc2lOOub58dHAmkXsDYwTSJBAECMn/51Z4aSkUr8z7qYbdWUHwfepCWPM7rYXX1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895722; c=relaxed/simple;
	bh=AJZkLvOfxW0de6r+CyQc5qTyXDoiqp2t4JSLGDtsAk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxTE8SyEvGzqiidb/V1cx268Y6iRYj6cy4t/z4uUcyev0GOq5xtGiicNKfPKMK9KXyh6u9+6cMAEbNc6W5Jv9MhZ8v27FSPw3EN5rXRiitH51oArtcsWkFSzJ+hO5oTUhgYISe+LmI5zD8dzgtzHjry4SqvdMsk3Hw7YtXJuptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzIRLWeC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzIRLWeC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c1453de4so2199195e9.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782895719; x=1783500519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIY4E2Qv/c4b0j+COVpWSOrsvci+vruq4kKRU7Wts6g=;
        b=NzIRLWeCBFi9g/P1K8p+/E17+JhwHvGZ6XqZLYRG6Y9HsGiUO9k4zJgNhIDw6zj1r9
         YsOomHHcLzpQyaAtYtpz83Bcjq1t816A84X1dXfosT+P1CTeP4ikQByodkH/AE4zJnMT
         5i++y/0aV7EkPc++Y1XogOlMtotXQyELTVv+wHgdZpI+TwjVM9dlQyVrS5hbaFKX2PDm
         y+G1pv8OQDdoxZLp5TtO9ncU1mrcCawm3aoush+AU8jNvdCuDDCVuFx+4+IzJPODgq6a
         4ilKxkYGBaz9+EIjCyX0JmjYCeGu+jeA0CaalaF9YIwQ+a/wvGNe3Wsr5I6VxJkkpkiD
         DXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895719; x=1783500519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIY4E2Qv/c4b0j+COVpWSOrsvci+vruq4kKRU7Wts6g=;
        b=bXQaXaAtugVRDWRgmmIi4zeATxStyXcCXtRAkZVnEjyllPYfipQ2TMdfZyFHUvTGol
         5gZSE8mU/40A24JyUMERhIcT/Abn4wwZkLN0AXZmjWmVPh7X0H+50DbSeD2npHvP4761
         MNXJAr9LneL5YB0QLY66zi3Ytb9U132tlTMEa+gCcS0HeGGpXbgWoGLQufoz5ICc26vU
         7VV7hLAZTJn4EPspSO2MfEQQQuqH5ennaDpO8FdUkMSqY+WdDhuFRYcuAslNHNc2QRTf
         6Ir+yUYwgJuquPubB9YoyQJSoguvh6GaPFBU2ccSKlIA7Nu5brI0f7PWxM0YO4Zd16hy
         JeDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/euWg30A9rVtSsM9OwCHAZj/9Txqn8viKbEiSlywzOXWasD3yPGukskAWsc+hSP71paOYM5ABNC12f@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIfm+dYZ3VKNpXg/LOUJEV0oJDzxSzc8ZcVbnnG4fVSeigyHz
	Wt4nSPRM5D4iR1pmYIPd/cjENr7sBIFr1s6IeWa2ciBtsSPwpbSK99lnZ664Zw==
X-Gm-Gg: AfdE7cn8TjGXJLVHCdCGkivm4/0STwKo41+8F43BSiIYkL0Jo4ArrghNnHlmGe0ZelK
	sLHWfLTqOerqvcdScssuL+JsnzwuLuu/S28gwhCRqKXTaDqvT/QSp2x8Bs54IWz+oOQVJ1bDSIO
	IahyzgAsWTFlgMXib+VJxkCaApmrPyJDjqgfe51YTsMEYQqyfqjPGmfBHWTUmjFCP7XFCeAmnWn
	oQ/KkyZWNxWQvPaXK9JFtPZZs8A8oarUgOV/nc8HqN54SU36JpSkJMZr09UO4wUFI6TSxLZCacU
	a7FBES8XDwPl8SkUnI9TbFCiM2FQlD3lJ1/jL8Uq0Z459yfznS69uATPGd3rmOrI14jNNSkHWHT
	PFnMUMDm0u6ee17fE1ZZxStTTMf9Dg7kYvSE/SglJEDniMRO9n2M0i3r6Usd1yvSR0BHEL892UL
	8C+Rhc8tGdjZzpg6Hzm3oKcrdTyIIfOMSI7sciDIA0D3CyoCr5e7FMPYxD5Vp6DbidQLbLw1R80
	LEfvouqOS3iJygeApzqvniTCLfRksRC
X-Received: by 2002:a05:600c:4f4a:b0:493:a84a:ec5a with SMTP id 5b1f17b1804b1-493c2b26b38mr13891255e9.12.1782895719252;
        Wed, 01 Jul 2026 01:48:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475671d0403sm15802622f8f.29.2026.07.01.01.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:48:38 -0700 (PDT)
Date: Wed, 1 Jul 2026 10:48:36 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
	Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-PLUS
Message-ID: <akTUZLKogURvYIPx@Lord-Beerus.station>
References: <85af11e85dbb7cf5097d7c0ee567272ff6e87ec5.1780998600.git.stefano.r@variscite.com>
 <20260609100729.C9FF21F00893@smtp.kernel.org>
 <akKh5XbMS_JjGpPF@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akKh5XbMS_JjGpPF@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 29, 2026 at 12:48:37PM -0400, Frank Li wrote:
> >
> > > +/* BT module */
> > > +&uart4 {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pinctrl_uart4>, <&pinctrl_bt>;
> > > +	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
> > > +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> > > +	uart-has-rtscts;
> > > +	status = "okay";
> > > +
> > > +	bluetooth_iw61x: bluetooth {
> > > +		compatible = "nxp,88w8987-bt";
> > > +	};
> >
> > [Severity: Medium]
> > The pinctrl_bt group configures GPIO2_IO06 and GPIO2_IO09 as GPIOs and attaches
> > them to uart4, but this bluetooth_iw61x node does not map these pins to any
> > properties like device-wakeup-gpios or reset-gpios.
> 
> Please check it, look like make sense

This is intentional,
these pins are not meant to be controlled by the Bluetooth kernel
driver. They only need to be muxed as GPIOs in the device tree so they
are not configured with different alternate function, since they are
handled by our userspace initialization script following the power-on
rules.

This is also consistent with the existing Variscite DTS files, where
these BT/WBE control pins are only muxed and not mapped to Bluetooth
driver properties.

Best Regards,
Stefano

> 
> >
> > Will the kernel driver fail to toggle these pins, leaving the chip in an
> > uncontrolled state? Is it relying on bootloader defaults or userspace sysfs
> > toggling for these pins?
> >
> > > +};
> >
> > [ ... ]
> >
> > > +	pinctrl_eqos: eqosgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> > > +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> > > +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
> > > +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
> > > +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
> > > +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
> > > +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> > > +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
> > > +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
> > > +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
> > > +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
> > > +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
> > > +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
> > > +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> > > +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10
> >
> > [Severity: Medium]
> > The pinctrl_eqos node configures MX8MP_IOMUXC_SD2_WP__GPIO2_IO20 as a GPIO, but
> > there is no corresponding regulator or driver property that requests this GPIO.
> >
> > Could this unnecessarily block GPIO2_IO20 and cause a pin conflict for any
> > carrier board that attempts to use it (for example, for usdhc2 write protect)?
> > Was this possibly a copy-paste error from imx8mp-var-som.dtsi?
> 
> Look like make sense, are you really use GPIO2_IO20 for eqos?
> 
> Frank
> 
> >
> > > +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0x150
> > > +		>;

Thank you,
I will remove this GPIO.

Best regards,
Stefano

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208458;
	b=CSR6AU9rVsAoCEBt6LIHlOBIhESdbv4qrNdUn9rXjMp/d2uH8n7ExrtsYzI4Zz8Yin5x
	 Md64O14lp4dTIo6hjQuzD11omxHe57VChmXEhn/QvdSFYAxd6iP7/9nk9wvU8Jf6PXp63
	 cqf1OaL3hhHhZQ+5zn0GvVlucp+8ZbxADhASNuKBqTHJeAxfJ8krxfWd3/tggmsCPy401
	 dbqVa6xi6nNleAitq5BGhonrmMgRJEddwhkTGJhgvz5oyBOdduRlzv6WEngUOzIKTwix2
	 QKZbnLX0MWlHgsl86Lw9C+/jC+Vddocc14sEsZRHoUwAxWNw1lqWAc8oBlTXRsrYDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208458;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZZjBmHFYrK7mcpQi/vdsSMMP3rhv3MuWMhCLuqmuudE=;
	b=zgl6wrC1jXRYSrcWx/EtrjR2PTzzaQ4kKh3dxuVgFZn6aGYlnvTbYwRxJg6GIE2rkThU
	 lCU2C2gC/Jqh7Ws2TphgfuhYormFbEYVaoCIKuoVLCgVisWODK+p7uIOdeEUFKkH90gRo
	 1T0UC7KcdGa+jBm24Mo5c+bxxV3jsyQpQ87GrTIwoxsXCwBY0UTN6+hzZOHZGM+N3hXkt
	 MAbu1pFZEtv2d2iJP//wabjChx5tMxMNEliXFwYMuUiKoOJmDuqFQz+e6f6A4kloFp1H0
	 TgpBlqlWyI8YAVM8ExgPTtI5xtA3xvvK8ZmsZmpVRtXw/LKpKkYRsrv3483nBbHz+UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQTSo0jT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B301606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQTSo0jT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6481F0089F;
	Mon,  9 Nov 2026 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794208458;
	bh=ZZjBmHFYrK7mcpQi/vdsSMMP3rhv3MuWMhCLuqmuudE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQTSo0jTdxMVE0nzH6yPmIm1xJvDO6sT8R3K7P49B2qxbSthTvKuTB6iOOkcbmJgl
	 8PvCI/O48P6Vv6MWB4zEEXlJJ/OqjI01PUBSWyPf+9VfMAR+TP0jE04HQNIRGiwwkO
	 +3MnD9MpdAgGOX3QrgabuAHp0uzD+LMH8jV9CSBpImIfTJ81XQBlR5YjuPXAKbgbcA
	 sxcEYcG5GTIgVVIvh21Iy63HEPzEkhGG0ZdHsoazysxojvYEZNnNn6FM07Fg3XNhr0
	 Se5o2YsGRxm9D83ZHZAoVwPfmuzYuKus2Sa0mhOjQoV40wSiKVzGbUKknPO4tDYtCz
	 MSY8dlBtjdYSg==
Message-ID: <sashiko-outbox-204535@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261109065606.62641-5-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
 <20261109065606.62641-5-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 07:14:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] phy: nuvoton: missing MFD_SYSCON select and unchecked
  regmap_read()
--

commit ce87e45e509dca5386021bb0dd4e3bb91e3935d8
Author: Joey Lu <a0987203069@gmail.com>

phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

This commit extends the Nuvoton MA35D1 USB 2.0 PHY driver to support both
PHY0 and PHY1, updates clock-stability polling in phy_init(), registers a
read-only USB role switch for PHY0, and adds resistor calibration and
over-current polarity device-tree properties.

> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
> index d02cae2db315a..1f37e860de507 100644
> --- a/drivers/phy/nuvoton/Kconfig
> +++ b/drivers/phy/nuvoton/Kconfig
> @@ -6,6 +6,7 @@ config PHY_MA35_USB
>  	tristate "Nuvoton MA35 USB2.0 PHY driver"
>  	depends on ARCH_MA35 || COMPILE_TEST
>  	depends on OF
> +	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
>  	select GENERIC_PHY
>  	help
>  	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/=
phy-ma35d1-usb2.c
> index 0b9976fb15c17..bc706356c4341 100644
> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c

[ ... ]

> +static int ma35_usb_phy_init(struct phy *phy)
> +{
> +	struct ma35_phy_port *port =3D phy_get_drvdata(phy);
> +	struct ma35_usb_phy *p =3D container_of(port - port->idx,
> +					      struct ma35_usb_phy, port[0]);
> +	unsigned int n =3D port->idx;
>  	unsigned int val;
>  	int ret;
> =20
> -	ret =3D clk_prepare_enable(p_phy->clk);
> -	if (ret < 0) {
> -		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
> -		return ret;
> -	}
> +	ret =3D clk_prepare_enable(p->clk);
> +	if (ret)
> +		return dev_err_probe(p->dev, ret, "failed to enable clock\n");
> =20
> -	regmap_read(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, &val);
> -	if (val & PHY0SUSPEND) {
> -		/*
> -		 * USB PHY0 is in operation mode already
> -		 * make sure USB PHY 60 MHz UTMI Interface Clock ready
> -		 */
> -		ret =3D regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR=
, val,
> -						val & PHY0DEVCKSTB, 10, 1000);
> -		if (ret =3D=3D 0)
> -			return 0;
> -	}
> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
> =20
> -	/*
> -	 * reset USB PHY0.
> -	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
> -	 */
> -	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR=
 | PHY0SUSPEND));
> +	if ((val & USBPMISCR_PHY_SUSPEND(n)) &&
> +	    !ma35_usb_phy_wait_ready(p, n, &val))
> +		goto out;

[ ... ]

> +static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
> +{
> +	struct ma35_usb_phy *p =3D usb_role_switch_get_drvdata(sw);
> +	u32 val;
> +
> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
> +
> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
> +}

[Severity: Medium]
Can val be used uninitialized in ma35_usb_phy_init() and
ma35_role_sw_get() when regmap_read() fails or is stubbed out?

Neither PHY_MA35_USB nor ARCH_MA35 selects MFD_SYSCON, so PHY_MA35_USB can
be built with CONFIG_MFD_SYSCON=3Dn and CONFIG_REGMAP=3Dn.  In that
configuration, syscon_regmap_lookup_by_phandle() always fails with
-ENOTSUPP, and the regmap_read() stub returns -EINVAL without writing val,
causing the compiler to flag val as uninitialized in ma35_usb_phy_init()
and ma35_role_sw_get().

Selecting MFD_SYSCON in PHY_MA35_USB and checking the regmap_read() return
value (or initializing val) would avoid both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109065606.6264=
1-1-a0987203069@gmail.com?part=3D4

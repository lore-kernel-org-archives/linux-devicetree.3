Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816343F09E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142898; cv=none; b=WNRZNV6+2cxLJtpDLdvmXftxOgt0N0PFk98AFS1TWriXWbOfUcoyNaaK+72Ms6V055d5M0xAtXR/YpEFTjGJYy9RZLI15x3tNuH8LrbMHPLcv6Rcxsp1DirGx6TfbD9rVpM9zOKpwaJEFmxda4seXI7r9i0VxKdWJaQa5cW5O78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142898; c=relaxed/simple;
	bh=puOmzRHIlRascXpQTVsh0yIFod+pxoO++c3THyIxTMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o4TSsIqujuipRJWHOH/2tfb28pDrEnDVahTRR3jcie2/0/SsC7AML7mWHswe67rY7NZAuHVk5V7Y6Dww/ZBI2HID3IV6Q5jDLakQd7uN1N6hV5suTauP7fxZrRr07Jo+brZ1FUkjAIXkEHa9+BUru4C98jtYHf9VUfzdnQ7lziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhBlaQcp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhBlaQcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5784D1F00A3D;
	Wed, 15 Jul 2026 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142890;
	bh=LaUTGNXIKTQxykhOsEkVPArO+SO+J/GC0U043647SAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EhBlaQcpkcZzFzgLQezNiz/JQm+/OHBpiTW7XUoUu4l9OfRwa+QPHywn1QwQ7vrO2
	 6CgM1yXDsVo6iJbPmxkoRwv3YBefHnBB+EmdKoqt1oKTKnROFu/eLrBGpSa0x88iZB
	 cQuyG+0TzqyU3Mr9xgBSRZg8lHm2ebzRZ3TblcgkHU22STNeL7pgLpUYwomjbka0Fo
	 YcwUnVGHCHKwD28eT4Se5D1rQz7IEXcJKZo/aagkkUFd7Prr7JuE4QVypCdkxp3Szy
	 WCIQdFzwDCVSfgYlt8x1bWHPmpg3U7a8g4rhrdHb5Se3nlHeHXENo0JdXDSBbJ4eLs
	 cmzAaTPe5ChLg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 03/10] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260714191341.690906-4-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:14:49 +0000
Message-Id: <20260715191450.5784D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch breaks device tree backward compatibility by forcing the=
 SGMII MAC selection to GMAC0 when the optional `rockchip,sgmii-mac-sel` pr=
operty is absent, overriding the hardware default.
--

--- Patch [3]: [RFC PATCH 03/10] phy: rockchip: naneng-combphy: add SGMII M=
AC selection for RK3568 ---
commit 605f86936fd231092ab8489f15df507702255912
Author: Coia Prant <coiaprant@gmail.com>

phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

This commit adds support for routing the SGMII interface to either GMAC0
or GMAC1 on RK3568 by introducing the rockchip,sgmii-mac-sel DT property.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 229)

> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c

[ ... ]

> @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *d=
ev, struct rockchip_combphy
> =20
>  	priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-refclk"=
);
> =20
> +	priv->sgmii_mac_sel =3D 0;
> +	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_ma=
c_sel);
> +
>  	priv->phy_rst =3D devm_reset_control_get_exclusive(dev, "phy");

[ ... ]

> @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy=
_priv *priv)
>  		break;
> =20
>  	case PHY_TYPE_SGMII:
> +		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
> +					priv->sgmii_mac_sel > 0);

[Severity: High]
Does this break device tree backward compatibility?

When the rockchip,sgmii-mac-sel property is missing from an older device
tree, priv->sgmii_mac_sel defaults to 0 in rockchip_combphy_parse_dt().

By unconditionally calling rockchip_combphy_param_write() here, the driver
now actively clears the MAC selection bit to 0 (GMAC0).

Because the hardware reset value is GMAC1, this actively overrides the defa=
ult
hardware and bootloader state that older device trees were relying on.

Could the code check if the property was actually present before writing
to the register, to ensure the hardware default is preserved for existing
setups?

>  		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready=
, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, tr=
ue);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714191341.6909=
06-1-coiaprant@gmail.com?part=3D3

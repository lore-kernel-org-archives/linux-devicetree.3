Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347099;
	b=bV8pEYV5woAxLLq/s89vVEppya5gSb8pndCVqFm7/z3AYG6kLYbYpta3Um2QUJ4L3DyO
	 m0nxywxmG6oPw3T3lydpZ9Daq57SpIGEVTtTHHsW7mGfKD79CoI0z7VLTNyKxPfaB/GFY
	 Vd1e6WD9DDVGpQVuRXSoW1WoBsVYrfEXRKukLnoR1ITURlS6OnzJFm+eK7f7oTo03EdgG
	 fF3pFVWdBOAZpv6wmew3SUKhgOlP8iYKEB9R65Oh//9W/NWSCjrBEDkv/fXCmuur2doDS
	 NQq/1IndS62ZcL+rYTbgyIwfPJErNSGWQt3bsw+qoU4TDCxhqVvUtxnD28x4CcdH57w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347099;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rnuHtycsvwGpXm3jZggAtDZD7UEs1uf7LuP65yh6YWY=;
	b=zM1VBjX61L+Khq6I2V/S2bnsj+0uo4vUHq/RTJQNfjzMHnpKyj0yQkBWIldJwe9kXErV
	 IDlMGnKp+7YXJsfLouHRgL9CZgSk31+HxdjlFa/mLcCHoyfXLIrUqbIG2CQUUz1lufKo2
	 bs+U9o+YQ2yfAY5cJaHKAJl6pEyU3PdJwSNsZfRw/DiN6K2Ou01cDpxZVBMsHblgHK9sC
	 QhA95XOhKDKimuw7oUVPWDEZVpeKIplI3u25LF5BOExPtPitBDWyRI6qDKSLSbl5SQYMS
	 s05+wEoJ36BrJ9AYzao0iUIU7zIDS9dC1X3Z7mtfldGNRjRxg4I2B/Ns6FhWlRB3+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHWJLfUY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A56606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHWJLfUY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841FF1F0093A;
	Fri, 30 Oct 2026 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793347098;
	bh=rnuHtycsvwGpXm3jZggAtDZD7UEs1uf7LuP65yh6YWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NHWJLfUYe8hWpZjw8eTOaczbuUZNq2Dc2PuqPnwnnyYVPioM7q3y9fE1GuEFzHuqx
	 7gZ6RMQVzByPNFe5nYbqaS26lUaDJMOPKL4+AMsIykCDaOJWbZ7tEI27hGig3HYl2C
	 h8WxQqTZNm7WKHRj+rkMdb36QiCPZ/XJWO08cVM6CU2Gz77EPiV6cTf7KmbxKyVVr3
	 bviT4CCgr9J0bska3T1bAZsNGbDj6BTnvVFO+LDBVZ0GKRLVIk30JNaqfGbeLjmIUH
	 qVfar9cQjoOb1n5QS61POmUQh0aYipmv1Go2ejwIhMIE+r5BwOlpz7K7sU3rGUKpzY
	 3q1isBMmgkl5A==
Message-ID: <sashiko-outbox-190670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: add TH1520 DesignWare MIPI DSI host
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f@iscas.ac.cn>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
 <20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:58:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] drm/bridge: missing GENERIC_PHY_MIPI_DPHY and MFD_SYSCON select =
in Kconfig
- [Medium] drm/bridge: uninitialized ret in th1520_dw_mipi_dsi_probe() erro=
r path
- [Medium] drm/bridge: 32-bit signed overflow in calculate_lane_mbps()
--

commit 1daf55a66c6c757f635f5bb068b6e103e284e178
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

drm/bridge: add TH1520 DesignWare MIPI DSI host controller

This commit adds a glue driver for the Synopsys DesignWare MIPI DSI host
controller and internal D-PHY on the T-Head TH1520 SoC.

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 4a57d49b4c6d3..b005623ba26bf 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -375,6 +375,16 @@ config DRM_THEAD_TH1520_DW_HDMI
>  	  Choose this to enable support for the internal HDMI bridge found
>  	  on the T-Head TH1520 SoC.
> =20
> +config DRM_THEAD_TH1520_DW_MIPI_DSI
> +	tristate "T-Head TH1520 DesignWare MIPI DSI bridge"
> +	depends on OF
> +	depends on COMMON_CLK
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	select DRM_DW_MIPI_DSI
> +	help
> +	  Choose this to enable support for the internal MIPI DSI bridge
> +	  found on the T-Head TH1520 SoC.

[Severity: Medium]
Should DRM_THEAD_TH1520_DW_MIPI_DSI in drivers/gpu/drm/bridge/Kconfig also
select GENERIC_PHY_MIPI_DPHY and MFD_SYSCON?

In drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c, calculate_lane_mbps() calls
phy_mipi_dphy_get_default_config(), which has no inline stub fallback when
CONFIG_GENERIC_PHY_MIPI_DPHY is disabled. Because GENERIC_PHY_MIPI_DPHY is a
promptless symbol and DRM_DW_MIPI_DSI does not select it, building with
CONFIG_DRM_THEAD_TH1520_DW_MIPI_DSI enabled will fail at link time if no
other enabled driver selects GENERIC_PHY_MIPI_DPHY.

Similarly, th1520_dw_mipi_dsi_probe() calls syscon_regmap_lookup_by_phandle=
()
and dsi_phy_init() calls regmap_update_bits(). When CONFIG_MFD_SYSCON is not
enabled, syscon_regmap_lookup_by_phandle() falls back to a stub returning
ERR_PTR(-ENOTSUPP), causing probe to unconditionally fail.

> diff --git a/drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/th1520-dw-mipi-dsi.c
> new file mode 100644
> index 0000000000000..e5c7c5d6dcc71
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c

[ ... ]

> +static unsigned int
> +calculate_lane_mbps(const struct drm_display_mode *mode,
> +		    unsigned long mode_flags,
> +		    u32 lanes, u32 format)
> +{
> +	int bpp =3D mipi_dsi_pixel_format_to_bpp(format);
> +	union phy_configure_opts phy_opts;
> +
> +	/*
> +	 * FIXME: the extra bandwidth headroom logic mimics what the Rockchip
> +	 * driver does, and test shows that it's necessary for the hardware
> +	 * to work with the mainline dw-mipi-dsi common code.
> +	 */
> +	phy_mipi_dphy_get_default_config(mode->clock * 1000 * 10 / 8,
> +					 bpp, lanes,
> +					 &phy_opts.mipi_dphy);

[Severity: Medium]
Can the pixel clock multiplication in calculate_lane_mbps() overflow a 32-b=
it
signed int?

Since mode->clock in struct drm_display_mode is an int (in kHz) and 1000, 1=
0,
and 8 are signed int literals, mode->clock * 1000 * 10 is evaluated in 32-b=
it
signed arithmetic before being converted to the unsigned long parameter of
phy_mipi_dphy_get_default_config().

When mode->clock is 214749 kHz or higher, mode->clock * 1000 * 10 exceeds
INT_MAX. With 4 lanes and up to 2500 Mbps per lane in hsfreqrange_table, the
hardware supports 24-bpp modes up to 333333 kHz, which will wrap to a
negative value, sign-extend to a large unsigned long, and be rejected by
dsi_mode_valid() and dsi_get_lane_mbps(). Higher out-of-range pixel clocks
(such as 594000 kHz) can also wrap around to a small positive value and
falsely pass dsi_mode_valid().

Would using 1000UL (or mul_u32_u32()) avoid this overflow?

> +
> +	return DIV_ROUND_UP(phy_opts.mipi_dphy.hs_clk_rate, USEC_PER_SEC);
> +}

[ ... ]

> +static int th1520_dw_mipi_dsi_probe(struct platform_device *pdev)
> +{
> +	const struct dsi_chip_data *cdata;
> +	struct device *dev =3D &pdev->dev;
> +	struct th1520_dw_mipi_dsi *dsi;
> +	struct resource *res;
> +	void __iomem *base;
> +	int i, ret;
> +
> +	dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +
> +	dsi->dev =3D dev;
> +
> +	dsi->syscon =3D syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(dsi->syscon)) {
> +		ret =3D PTR_ERR(dsi->syscon);
> +		dev_err_probe(dev, ret, "Unable to get system controller regmap\n");
> +		return ret;
> +	}
> +
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base)) {
> +		dev_err_probe(dev, ret, "Unable to get DSI registers\n");
> +		return PTR_ERR(base);\n> +	}

[Severity: Medium]
In th1520_dw_mipi_dsi_probe(), if syscon_regmap_lookup_by_phandle() succeeds
and devm_platform_get_and_ioremap_resource() fails, isn't ret uninitialized
when passed to dev_err_probe()?

Should this pass PTR_ERR(base) (or return dev_err_probe(dev, PTR_ERR(base),
...)) instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-th1520-dw-=
mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn?part=3D3

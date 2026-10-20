Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465320;
	b=mgBLBzAwzQ9Y2ejpKH44FAae7PKsRot+8ynOcimjZ9Vo4Zt78h0QuF9QYosh5Jh64j7h
	 rWCgbJn0rzLgoY7BFq4l/eagV0DfIIwdNIMUA3In/KZh5tyP/f5iPUKGVixwdsc86EzlC
	 V7fc8DIprP3fmDEqbi/TM+qc0isMKENprmp63Cb3a1vpK/vmub8Jmb1crb03E3jbYlxMT
	 ly7ZcJAsiMXBqj9S/uOpZZhFkYdy5DoWSTCvVpKEsLJfCKHV147QkAJ9ifvPD1Lpw8ro5
	 H5u8gtmtRltendjBx8AP4hZqMMcd6RbwrFb9GKDKb+6F73u9FXO6F2c7N5Ib1moAIGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465320;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rpi8eRJY+QpgufrsBkwNLoaSiaI73ZLy3XEg2jPcg+w=;
	b=JKyAfQj/rugnZqzbALOMOgJCSdfDVLR4o9LKdMs43PcVB9iCRpaa8wy2OUzVjrvDAydC
	 hoSNLVxCp63KbWCGiB9me7AzSqNZHU8lnmypt+0SvUyS4H4jsJsa30WT7sT6SmRAitAGZ
	 hNczpX1e8U87njxY8dVB3spVy15PjYElbtyfhGktubMsJrQHIlbyXSy5mEQhXAyp4nvpX
	 5DUNbcuDTeVuEecSOGF+B/jhsVegW/URwFjRMEJAafW3R6dv/WnKvIPXLX01+kySufBiS
	 Mm+vTFd/7FGHCMsE5sXD2kV7Zx+sY54+KPDZMpCDwI1T/e2Jk/g5YAB51KfCqhxx1Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkkxYMsr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1470606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkkxYMsr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AB91F000C6;
	Tue, 20 Oct 2026 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792465319;
	bh=Rpi8eRJY+QpgufrsBkwNLoaSiaI73ZLy3XEg2jPcg+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RkkxYMsr32A7zmiW8x/UcqzW89Or4fZ7rcxKW+xmtNxaOn1v5zzCBQ8VtWwfIIUh/
	 r7kdSe7N1uladc/c8IgQVNN3zPPaaNssT4ixXnlafAKUoIvRm8H+VZGxUjrMXyEB4C
	 0j7Hz5L50QTWBXaQ3WaE7PBXUVR2DDi1ji/JS+S1Lv+CiiAWfhz7IQmzINJiWzJlEm
	 4TeIr9hp22vs+o/m3CBNF+Nm5tRK3plAtT4e6y04UKUYtxQhwhgr+9x5kngiSGgwb/
	 6KVGdpbE53IJSzF4YokwBfwcTIYI3fZcq7bQZpsiIltV4Nb9rM36wHnxKX2Qb7La0d
	 un2Rid3wFItDA==
Message-ID: <sashiko-outbox-178430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 5/5] net: stmmac: support the TC9564 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019030129.1470307-6-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-6-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 03:01:58 +0000
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
- [High] net: stmmac: tc9564_reset_names mismatch with DT binding reset-nam=
es
- [High] net: stmmac: stmmac_get_platform_resources() zeroes DT MAC address
- [Medium] net: stmmac: tc9564: unconditional reset and clock disable in su=
spend breaks WoL
--

commit d94523eb7296bd3578512ea2f1d63c42d3751631
Author: Daniel Thompson <daniel@riscstar.com>

net: stmmac: support the TC9564 SoC

This commit adds stmmac glue layer support for the Ethernet XGMAC
functionality on the Toshiba TC9564 SoC via a platform driver bound to a PCI
endpoint bus node.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc9564.c b/drivers=
/net/ethernet/stmicro/stmmac/dwmac-tc9564.c
> new file mode 100644
> index 0000000000000..21098f91e3bbf
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc9564.c
> @@ -0,0 +1,590 @@

[ ... ]

> +enum {
> +	RESET_ID_MAC,
> +	RESET_ID_XPCS,
> +	RESET_ID_PMA,
> +};
> +
> +static const char * const tc9564_reset_names[] =3D {
> +	[RESET_ID_MAC] =3D "mac",
> +	[RESET_ID_XPCS] =3D "xpcs",
> +	[RESET_ID_PMA] =3D "pma",
> +};

[Severity: High]
Should the entries in tc9564_reset_names include the "-reset" suffix?

In Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml, the
required reset-names property items are defined as:

  reset-names:
    items:
      - const: mac-reset
      - const: pma-reset
      - const: xpcs-reset

When tc9564_dwmac_probe() calls tc9564_reset_init() ->
devm_reset_control_bulk_get_exclusive(), the reset lookup matches each
td->resets[i].id against the device tree node's reset-names property. With
"mac", "xpcs", and "pma", won't reset lookup fail during probe on a
binding-compliant device tree?

[ ... ]

> +static void tc9564_mac_disable(struct tc9564_data *td)
> +{
> +	WARN_ON(reset_control_bulk_assert(ARRAY_SIZE(td->resets), td->resets));
> +
> +	clk_bulk_disable_unprepare(td->clock_count, td->clocks);
> +}

[ ... ]

> +static int tc9564_dwmac_suspend(struct device *dev, void *bsp_priv)
> +{
> +	struct tc9564_data *td =3D bsp_priv;
> +
> +	tc9564_mac_disable(td);
> +
> +	return 0;
> +}
> +
> +static int tc9564_dwmac_resume(struct device *dev, void *bsp_priv)
> +{
> +	struct tc9564_data *td =3D bsp_priv;
> +
> +	tc9564_mac_enable(td);
> +
> +	return 0;
> +}
> +
> +static int tc9564_probe_config_dt(struct tc9564_data *td)
> +{
> +	struct platform_device *pdev =3D to_platform_device(td->dev);
> +	struct device_node *np =3D td->dev->of_node;
> +	struct plat_stmmacenet_data *plat;
> +	phy_interface_t phy_interface;
> +	struct device *dev =3D td->dev;
> +	int ret;
> +
> +	ret =3D device_get_phy_mode(dev);
> +	if (ret < 0)
> +		return -ENODEV;
> +	phy_interface =3D ret;
> +
> +	/* The platform structure is allocated with devm_kzalloc() */
> +	plat =3D devm_stmmac_probe_config_dt(pdev, td->res.mac);
> +	if (IS_ERR(plat))
> +		return PTR_ERR(plat);
> +
> +	/*
> +	 * Core driver cannot deduce or validate fifo size because the bits
> +	 * that provide FIFO size only worth in powers of two.
> +	 */
> +	if (plat->rx_fifo_size =3D=3D 0 || plat->tx_fifo_size =3D=3D 0)
> +		return dev_err_probe(dev, -EINVAL, "fifo size is not set\n");
> +	if (plat->rx_fifo_size > TC9564_RX_FIFO_SIZE ||
> +	    plat->tx_fifo_size > TC9564_TX_FIFO_SIZE)
> +		return dev_err_probe(dev, -EINVAL, "fifo size too big (%u/%u)\n",
> +				     plat->rx_fifo_size, plat->tx_fifo_size);
> +
> +	/*
> +	 * toshiba,tc9564-xgmac is *not* compatible with snps,dwxgmac because
> +	 * generic drivers cannot possibly work on TC9564 (without clocks
> +	 * reading registers wedges the bus). However, without snps,dwxgmac,
> +	 * devm_stmmac_probe_config_dt(), can't figure of the core type and
> +	 * won't parse a couple of extra properties. Let's handle that here!
> +	 */
> +	plat->core_type =3D DWMAC_CORE_XGMAC;
> +	plat->pmt =3D true;

[Severity: Medium]
Does calling tc9564_mac_disable() unconditionally in tc9564_dwmac_suspend()
break Wake-on-LAN?

In tc9564_probe_config_dt(), plat->pmt is set to true. When Wake-on-LAN is
enabled via ethtool and the system suspends, stmmac_suspend() programs the
XGMAC receiver and PMT wakeup registers via stmmac_pmt() and keeps the link
active via phylink_suspend(priv->phylink, true), before calling
priv->plat->suspend().

Because tc9564_dwmac_suspend() unconditionally calls tc9564_mac_disable(),
all three resets (RESET_ID_MAC, RESET_ID_XPCS, RESET_ID_PMA) are asserted
and all clocks are disabled without checking device_may_wakeup(dev), which
clears the programmed PMT state and shuts down the receive path.

[ ... ]

> +static int tc9564_dwmac_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D tc9564_probe_config_dt(td);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D stmmac_get_platform_resources(pdev, &td->res);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to initialize stmmac resources\n");

[Severity: High]
Does calling stmmac_get_platform_resources() after tc9564_probe_config_dt()
wipe out the MAC address read from the device tree?

In tc9564_probe_config_dt(), devm_stmmac_probe_config_dt(pdev, td->res.mac)
populates td->res.mac from the device tree. However,
stmmac_get_platform_resources(pdev, &td->res) is called immediately
afterward, and it begins with:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:stmmac_get_platform_r=
esources() {
	int ret;

	memset(stmmac_res, 0, sizeof(*stmmac_res));

This zeroes the entire td->res structure, including td->res.mac, before it
is passed to stmmac_dvr_probe(). Should stmmac_get_platform_resources() be
called before tc9564_probe_config_dt()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019030129.1470=
307-1-elder@riscstar.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1378F29
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389491; cv=none; b=Lu3BHUSx0yawvXvDgWsgoIthynEMoHncB9mgD3T3cZyPk30mUj7DrjwawTC1I+YmcjivuwVczInVaZIDp6aS6HjFRaO3GMjXFW+YNERNr+Uhetude/C3ux6zsT27vt9zSJmY7BsfDQ494Aw1d6EHT/AIYvt6JPLvx1aqWntcBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389491; c=relaxed/simple;
	bh=rh5Q9jNYnYIzk2slqdy3NQyAqeA/ekPVcVR8i+cULiM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hkWxWbGW+FY605L8KGc6VM9u4TDnNxGWxq1yVhuERmlr3gRgA9l3+s9bCoQCG0a+p3KlxDBpPe4Ts6ouKlYZwxN0OqqstZ49e8ZXziE/qq2gfQKdiq77NFr9zWcOj/OeGJ2RtBo78iNw4a2vS6g67wMHzfCbb9SCuKKaS/BbiFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frRN0Ojf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frRN0Ojf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482B51F000E9;
	Mon, 10 Aug 2026 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786389489;
	bh=XiMjvtS5v65SI5Sg5Vt4OVpthalQeWCuvLQf3jOj878=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frRN0OjfmO3+PMK6CN2sdtbNXBDOvASBiqRJ9lo0KRoEsALXFP0F1JZlDZrGy67g9
	 QbDF0+nLigDiFPV8IJ3CqVGcA3oAySR3e3X6DaoiPiQDOzEkVlROUrc+Zn2999T7Sl
	 isPr/eHCRJ6VlfgBOCHfLap97+gIu8Y0aI3JtAo/KiL6lrcbgl8xULq02sHHOj55ck
	 quOVyZXnp/41TgQBlhf8frolT2W1a1cot40VHy3y2KrlgIZPAdUb2wPKY9jwwru5oF
	 mI4x9IyQeJIZajqUgUc24at8pUtx1UPbDuv358SrmGAkGeD5uu1kDp0ZAPdlLNjaF9
	 LyWRz82oRxsXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] mmc: sdhci-cadence: add Cadence SD6HC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810190025.25045-8-tanmay.kathpalia@altera.com>
References: <20260810190025.25045-1-tanmay.kathpalia@altera.com>
 <20260810190025.25045-8-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 19:18:08 +0000
Message-Id: <20260810191809.482B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Inconsistent PHY generation identification leads to dangerous stru=
ct casting and massive out-of-bounds memory accesses.
- [Medium] The `biu` clock reference is not released during system suspend,=
 blocking the shared bus clock from being gated.
- [Medium] The `wmb()` memory barrier is incorrectly used as a delay/flush =
mechanism to wait for indirect PHY register writes to complete.
- [Medium] Hardware reset sequence lacks a dummy read to flush the posted w=
rite, potentially causing a violation of the minimum eMMC reset pulse width.
- [Medium] The SD6HC PHY and hardware reset logic bypasses the `priv->priv_=
writel()` abstraction, using raw `writel()` instead.
--

--- Patch [7]: [PATCH v4 7/8] mmc: sdhci-cadence: add Cadence SD6HC support=
 ---
commit 3dbe4a2148f59d518992019858523fa45d6808da
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
Subject: mmc: sdhci-cadence: add Cadence SD6HC support

Adds support for the sixth-generation Cadence SD/SDIO/eMMC host controller
(SD6HC), splitting the driver to support its new combo-PHY and separate
CIU/BIU clocks.

> diff --git a/drivers/mmc/host/sdhci-cadence-core.c b/drivers/mmc/host/sdh=
ci-cadence-core.c
> --- a/drivers/mmc/host/sdhci-cadence-core.c
> +++ b/drivers/mmc/host/sdhci-cadence-core.c
[ ... ]
> @@ -577,6 +592,13 @@ static int sdhci_cdns_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
> =20
> +	/* SD6HC requires a second clock, "biu", for the bus interface unit. */
> +	if (of_device_is_compatible(dev->of_node, "cdns,sd6hc")) {
> +		biu_clk =3D devm_clk_get_enabled(dev, "biu");
> +		if (IS_ERR(biu_clk))
> +			return dev_err_probe(dev, PTR_ERR(biu_clk), "failed to enable biu clo=
ck\n");
> +	}

[Severity: Medium]
Is the biu_clk reference intentionally discarded here? By keeping biu_clk a=
s a
local variable, there is no way to disable it during system suspend. This
prevents the clock and its parent power domains from powering down.

[ ... ]
> +/*
> + * Only the CIU clock is gated on suspend. The SD6HC "biu" clock is not
> + * toggled here as it may be a shared bus clock; a dedicated biu clock
> + * would need explicit PM gating added here.
> + */

[Severity: Medium]
Does this approach misinterpret how shared clocks work in the Common Clock
Framework?

The framework uses reference counting, which safely handles shared clocks by
physically disabling them only when all consumers have disabled their
references. By not keeping the biu_clk pointer and failing to call
clk_disable_unprepare() on suspend, this code leaks a prepare/enable refere=
nce
and keeps the shared bus clock unnecessarily active during suspend.

>  static int sdhci_cdns_resume(struct device *dev)
>  {
>  	struct sdhci_host *host =3D dev_get_drvdata(dev);
> @@ -636,7 +674,11 @@ static int sdhci_cdns_resume(struct device *dev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D sdhci_cdns4_phy_init(priv);
> +	if (host->version >=3D SDHCI_SPEC_420)
> +		ret =3D sdhci_cdns6_phy_init(priv);
> +	else
> +		ret =3D sdhci_cdns4_phy_init(priv);
> +

[Severity: High]
Can this version check cause an out-of-bounds memory read?

In sdhci_cdns_probe(), the driver allocates struct sdhci_cdns6_phy for
priv->phy purely based on the cdns,sd6hc device tree compatible string. If
the hardware's SDHCI_HOST_VERSION register reports a version older than
4.20 (e.g., due to a hardware errata), this resume path falls back to
sdhci_cdns4_phy_init().

When sdhci_cdns4_phy_init() is called, it casts priv->phy to struct
sdhci_cdns4_phy and iterates over phy->nr_phy_params. Because the memory
actually holds a struct sdhci_cdns6_phy, nr_phy_params aliases with
t_cmd_output_min (which typically holds a value like 5000). This would
cause the loop in sdhci_cdns4_phy_init() to read thousands of elements
past the end of the heap allocation and write arbitrary memory contents
to the PHY registers.

> diff --git a/drivers/mmc/host/sdhci-cadence-phy-v6.c b/drivers/mmc/host/s=
dhci-cadence-phy-v6.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-cadence-phy-v6.c
[ ... ]
> +static void sdhci_cdns6_write_phy_reg(struct sdhci_cdns_priv *priv, cons=
t u32 address,
> +				      const u32 value)
> +{
> +	writel(address, priv->hrs_addr + SDHCI_CDNS_HRS04);
> +	writel(value, priv->hrs_addr + SDHCI_CDNS_HRS05);
> +}

[Severity: Medium]
Does this bypass the priv->priv_writel() abstraction?

The Cadence core driver uses priv->priv_writel() to handle SoC-specific
write constraints for Host Register Set accesses, such as the spinlocks and
byte-lane logic needed for elba_priv_writel(). Hardcoding raw writel() calls
here violates that abstraction and could lead to state corruption on future
platforms that require custom write logic.

[ ... ]
> +int sdhci_cdns6_phy_init(struct sdhci_cdns_priv *priv)
> +{
[ ... ]
> +	sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_CTRL_REG, reg);
> +
> +	/*
> +	 * Ensure all preceding PHY register writes complete and reach the cont=
roller before
> +	 * releasing the PHY from reset. Without this, SDR104 has been observed=
 to fail
> +	 * intermittently on some boards.
> +	 */
> +	wmb();
> +
> +	ret =3D sdhci_cdns6_dll_reset(priv, false);

[Severity: Medium]
Is wmb() the correct mechanism for this synchronization?

The wmb() macro is an ordering barrier for CPU memory accesses, but it does
not flush posted interconnect writes to the peripheral. Since the subsequent
readl() inside sdhci_cdns6_dll_reset() naturally flushes preceding writes,
this wmb() appears to be inadvertently acting as a short CPU delay loop.

If a delay is required by the hardware to process the writes before releasi=
ng
reset, should this be an explicit udelay() instead of relying on the side
effects of a memory barrier?

[ ... ]
> +void sdhci_cdns6_hw_reset(struct sdhci_host *host)
> +{
> +	struct sdhci_cdns_priv *priv =3D sdhci_cdns_priv(host);
> +	void __iomem *reg;
> +
> +	reg =3D priv->hrs_addr + SDHCI_CDNS_HRS11;
> +	writel(SDHCI_CDNS_HRS11_EMMC_RST, reg);
> +	/* eMMC HW reset assertion: spec requires >=3D 1us, give margin */
> +	usleep_range(10, 20);
> +	writel(0, reg);
> +	/* For eMMC, minimum is 200us but give it 300us for good measure */
> +	usleep_range(300, 1000);
> +}

[Severity: Medium]
Can the lack of a dummy read here truncate the eMMC reset pulse?

Because writel() is a posted write, the first write asserting the reset
could be buffered in the interconnect while the CPU sleeps in
usleep_range(). When the CPU wakes and issues the second writel() to
deassert reset, both writes might arrive at the peripheral back-to-back.
This could result in a physical reset pulse width much shorter than the
required 1us minimum. Adding a readl() after the first writel() would
ensure the write reaches the hardware before the sleep timer starts.

Also, should this function be using priv->priv_writel() instead of raw
writel() for the same abstraction reasons mentioned regarding
sdhci_cdns6_write_phy_reg()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810190025.2504=
5-1-tanmay.kathpalia@altera.com?part=3D7

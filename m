Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D7416879
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906415; cv=none; b=YiAKYqBC2Tx66BR1nXg2RCBsz/yHtvB0dvWEAJHbLZfkP+VGAvWg8520dGhWKGgSyWmtA49DrAdjCGOSRuz2qyxWfOQ74BQNMx0z2aMjmZm5MadzoKiCbPMX5eUG3QItbEfT5thcZ9uqvqk8WREGgWmqUY686kPYS8B+X51PhfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906415; c=relaxed/simple;
	bh=PwT+KmmzLralR9Xl6LLi2Tsy+blBxGpKFCQa/7FKbdc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4OunjN6evTvK3hQoQyBMJ4G4Au/nSuaGEdh3WDNQezVQpoijS12xHcJ41J1yxeL0Q1OqFqTrAsX2KNVwCTl0WWGx78l2j7gkYpC9YpZpTLqXPQQpF5edIvywIBJmVpx62dMyf6TD2jDewMDVia7kJRrRs2govVCfvuB5NfMTG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct4SiaKQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct4SiaKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3161F000E9;
	Fri, 24 Jul 2026 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784906410;
	bh=1CemeW3Pa5upKbo+iPqlX/7nPtONyrlsZsutqSwjmwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ct4SiaKQrVfVdG38UVYI9HNJrqA1LUMBggGORDymDU2zJ06Ry3Y7sKhJn7BddRDZn
	 ztZnlmrqUKiQYEuKXJur2I7vaiqKOdz6ngZ9QFyuEJpbwJzV1h61NT3nddIx0GqIjP
	 4AM1Tc44Ap9Jn7FEkSRuFw6SYx54N+BlfOOt3rlCKE8WiBwQApQlaXwJ/bapryq1KK
	 iQWzYhUWs3kbR1WTl8MT2HahQRTMnm3ag3Sl9GcxLUtJKCvebQpcTRluVm2n10dyAV
	 GT9kBgpIFxot8fZvDAJ1rduJdRQCGr5oxEqV6z5pjkBUlfYnp0/1jaONvISLKiK1rC
	 1pFG6UdiWbi8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] mmc: sdhci-cadence: add Cadence SD6HC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724145009.7456-7-tanmay.kathpalia@altera.com>
References: <20260724145009.7456-1-tanmay.kathpalia@altera.com>
 <20260724145009.7456-7-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 15:20:09 +0000
Message-Id: <20260724152009.CB3161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] SD6HC PHY timing calculations use the requested clock frequency in=
stead of the actual physical hardware clock.
- [High] SD6HC PHY remains uninitialized during initial MMC card discovery =
at 400kHz.
- [High] Unvalidated `cdns,delay-element-ps` device tree property leads to =
multiple division-by-zero kernel panics.
- [High] The Agilex5 platform initialization logic is unreachable dead code=
 due to a missing match table entry.
- [High] `clk_wr_delay` is incorrectly hardcoded to 255 when the required d=
elay exceeds the DLL's maximum limit.
- [Medium] SD6HC PHY code bypasses the driver's established abstraction for=
 accessing Host Register Set (HRS) registers.
- [Medium] `wmb()` is incorrectly used as a mechanism to flush posted MMIO =
writes to the hardware.
--

--- Patch [7]: [PATCH v3 7/8] mmc: sdhci-cadence: add Cadence SD6HC support=
 ---
commit 61309bb2c01b2db2af64956b37f9af9f380deea8
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

mmc: sdhci-cadence: add Cadence SD6HC support

This commit introduces support for the Cadence sixth-generation SD/SDIO/eMMC
host controller (SD6HC) with an integrated combo-PHY. It splits the existing
driver into core and PHY-specific files, adding new configuration, timing,
and DLL logic.

> diff --git a/drivers/mmc/host/sdhci-cadence-core.c b/drivers/mmc/host/sdh=
ci-cadence-core.c
> --- a/drivers/mmc/host/sdhci-cadence-core.c
> +++ b/drivers/mmc/host/sdhci-cadence-core.c
[ ... ]
> @@ -481,6 +471,16 @@ static const struct sdhci_ops sdhci_cdns4_ops =3D {
>  	.set_uhs_signaling =3D sdhci_cdns_set_uhs_signaling,
>  };
> =20
> +static const struct sdhci_ops sdhci_cdns6_ops =3D {
> +	.set_clock =3D sdhci_set_clock,

[Severity: High]
Might this leave the SD6HC PHY uninitialized during initial MMC card
discovery at 400kHz?=20

During power-up, the clock transitions from 0 to 400kHz while remaining in
MMC_TIMING_LEGACY. The core MMC sdhci_set_ios() optimizes clock enabling by
returning early if the timing mode does not change. Because this only hooks
set_uhs_signaling to program the PHY, it looks like it will get bypassed
when only the frequency changes. Does the driver need a custom set_clock
callback to intercept pure frequency changes and initialize the PHY?

> +	.get_timeout_clock =3D sdhci_cdns_get_timeout_clock,
> +	.set_bus_width =3D sdhci_set_bus_width,
> +	.reset =3D sdhci_reset,
> +	.platform_execute_tuning =3D sdhci_cdns_execute_tuning,
> +	.set_uhs_signaling =3D sdhci_cdns_set_uhs_signaling,
> +	.hw_reset =3D sdhci_cdns6_hw_reset,
> +};
[ ... ]
> @@ -671,6 +709,10 @@ static const struct of_device_id sdhci_cdns_match[] =
=3D {
>  		.compatible =3D "cdns,sd4hc",
>  		.data =3D &sdhci_cdns4_drv_data,
>  	},
> +	{
> +		.compatible =3D "cdns,sd6hc",
> +		.data =3D &sdhci_cdns6_drv_data,
> +	},
>  	{ /* sentinel */ }
>  };

[Severity: High]
Is the altr,agilex5-sd6hc compatible string missing from this match table?

Looking at the driver sources, there is an sdhci_cdns6_agilex5_init()
function that asserts and deasserts specific sdhc, combophy, and ocp resets
for the Altera Agilex5. Without a match entry hooking up this initialization
logic, the driver falls back to the generic cdns,sd6hc match data, making
the Agilex5 reset sequence unreachable dead code.

> diff --git a/drivers/mmc/host/sdhci-cadence-phy-v6.c b/drivers/mmc/host/s=
dhci-cadence-phy-v6.c
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
Will using direct writel() bypass the established priv->priv_writel()
abstraction?

The core sdhci-cadence architecture uses priv->priv_writel() to support
hardware like the Pensando Elba SoC, which requires custom byte-lane enable
writes. Using writel() directly for Host Register Set (HRS) access here
could cause silent hardware programming failures if SoCs with similar quirks
incorporate the SD6HC IP.

[ ... ]
> +	if (!phy->sdhc_extended_wr_mode) {
> +		u32 out_hold, out_setup, out_hold_margin;
> +		u32 n;
> +
> +		if (!data_ddr)
> +			wr0_dly =3D 1;
> +
> +		out_setup =3D output_max;
> +		out_hold =3D output_min;
> +		out_hold_margin =3D DIV_ROUND_UP(out_setup - out_hold, 4);
> +		out_hold +=3D out_hold_margin;
> +
> +		if (!phy->cp_dll_bypass_mode)
> +			n =3D DIV_ROUND_UP(256 * out_hold, phy->t_sdmclk_calc);
> +		else
> +			n =3D DIV_ROUND_UP(out_hold, phy->delay_element) - 1;
> +
> +		if (n <=3D phy->dll_max_value)
> +			clk_wr_delay =3D n;
> +		else
> +			clk_wr_delay =3D 255;

[Severity: High]
Should this assignment clamp to phy->dll_max_value instead of hardcoding 25=
5?

In sdhci_cdns6_phy_lock_dll(), phy->dll_max_value is explicitly restricted =
to
127 when delay elements are doubled. If n exceeds 127 in that scenario, wri=
ting
255 here violates the maximum allowable tap index, potentially causing
unpredictable wraparound or breakage of hardware timing on slow clocks.

[ ... ]
> +	/*
> +	 * Ensure all preceding PHY register writes complete and reach the cont=
roller before
> +	 * releasing the PHY from reset. Without this, SDR104 has been observed=
 to fail
> +	 * intermittently on some boards.
> +	 */
> +	wmb();

[Severity: Medium]
Does a wmb() actually flush posted MMIO writes to the hardware here?

A wmb() only orders CPU instructions; it does not flush posted write buffers
on interconnect buses like PCIe or AXI. If the intent is to guarantee MMIO
writes have settled before the PHY is taken out of reset, a dummy readl()
to the same device is usually required to prevent intermittent device failu=
res.

[ ... ]
> +	ret =3D of_property_read_u32(dev->of_node, "cdns,delay-element-ps", &ph=
y->delay_element);
> +	if (ret)
> +		phy->delay_element =3D SDHCI_CDNS6_PHY_DEFAULT_DELAY_ELEMENT;
> +
> +	phy->delay_element_org =3D phy->delay_element;

[Severity: High]
Could this cause a division-by-zero kernel panic if the device tree explici=
tly
provides a 0 value for the delay element?

The property is read without validating that it is non-zero. Later, in
sdhci_cdns6_phy_lock_dll(), phy->delay_element is used as a divisor in the
DIV_ROUND_UP(phy->t_sdmclk, delay_element) macro. A malformed device tree
could trivially trigger this crash on probe.

[ ... ]
> +void sdhci_cdns6_set_uhs_signaling(struct sdhci_host *host, unsigned int=
 timing)
> +{
> +	struct sdhci_cdns_priv *priv =3D sdhci_cdns_priv(host);
> +	struct sdhci_cdns6_phy *phy =3D priv->phy;
> +	int ret;
> +
> +	/* Clock may be 0 during initial ios setup; skip PHY update */
> +	if (!host->mmc->ios.clock)
> +		return;
> +
> +	phy->t_sdclk =3D DIV_ROUND_DOWN_ULL(1000000000000ULL, host->mmc->ios.cl=
ock);

[Severity: High]
Can this lead to PHY timing mismatches by using the requested ios.clock ins=
tead
of the actual physical hardware clock?

The host->mmc->ios.clock field contains the requested target frequency. How=
ever,
the SDHCI controller can only output discrete frequencies based on its inte=
rnal
integer dividers, which is tracked in host->mmc->actual_clock. If the reque=
sted
clock doesn't perfectly match a divider step, the PHY will be programmed fo=
r a
frequency the bus isn't actually running at, potentially causing data corru=
ption.

> +	phy->mode =3D timing;
> +
> +	ret =3D sdhci_cdns6_phy_update_timings(host);
[ ... ]
> +void sdhci_cdns6_hw_reset(struct sdhci_host *host)
> +{
> +	struct sdhci_cdns_priv *priv =3D sdhci_cdns_priv(host);
> +	void __iomem *reg;
> +
> +	reg =3D priv->hrs_addr + SDHCI_CDNS_HRS11;
> +	writel(SDHCI_CDNS_HRS11_EMMC_RST, reg);

[Severity: Medium]
Does this direct writel() skip the priv->priv_writel() abstraction as well?

Just like in sdhci_cdns6_write_phy_reg(), using writel() directly bypasses
the established abstraction and breaks variants that rely on custom byte-la=
ne
writes for hardware reset.

> +	/* eMMC HW reset assertion: spec requires >=3D 1us, give margin */
> +	usleep_range(10, 20);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724145009.7456=
-1-tanmay.kathpalia@altera.com?part=3D7

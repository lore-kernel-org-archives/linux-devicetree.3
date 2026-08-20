Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E48B3911BD
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787253298; cv=none; b=pCof6+bYit1kZSFf3ZGhztj0Zi7EBzlTh7DIAAP0KOcCZ7kMpMPoMhZhNLcwdabAMlsGNj8knhrbjMvM/I3IhFRyx+aQ7iS1P2M0jRGe5Mg3Ubn1Pj3nWUzUEjQ/GbmGa9X+CEUH5YkXvRA6jEcHJCJ6nwrtyszVQ0FMoh5oex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787253298; c=relaxed/simple;
	bh=omUi7/oP18KdpC6nnYb4sA0C+YShoalqp5/UKwRI45s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PVbPJPrGgiJEQo4XcEkeB48Rml36Gy4M4mVv0R9CjvwNLK77Rp1WdqKSzUl5eHqVzNqPxPU85AVVEcgvqJ3/8gCm1QD3RjOBaWqzqCpUDszxh5r9Tja9L15eXoGjQc2NBjMy1z+4OTUNP1jwlvhl4VrCcdloCqFiJ972w3JUmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1KodAx9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1KodAx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2F41F000E9;
	Thu, 20 Aug 2026 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787253297;
	bh=80O0J4hayCmyib3k4UMtP1hTPTcC737lVZQ+iCJm03Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q1KodAx9a/omURqXQqtSyZq9TLS2xEWD1O3R6Ws5MBBfF7sV52EntXQwgohnpY7tB
	 Mp/QM6Q2dBNp7qEa1MDx2DY7U7SDiATEK3Pru70AgIfjtE9QSm4Ty+dYOOqV6q8gIs
	 k8/7A6VSGwqoBEbSZJmRHdawrV+UNUGzjd7jukektKKfqZx0EBwflE1JpHLLT/Q8sg
	 SFVT6XZ+cDtZDcPnTk7QsxO8SaNnaIjVLZot25zCOhlKWvF7JGIX8dQRbF0NzV7mYi
	 khYEPrnf1xBuAlh36MuRRM+tIrAkQnQqEkPqzRZnCMEHJLcJqv5bxluqQErJi+gTvP
	 al0G7wFr10iFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] mmc: sdhci-cadence: add Cadence SD6HC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820185721.22823-8-tanmay.kathpalia@altera.com>
References: <20260820185721.22823-1-tanmay.kathpalia@altera.com>
 <20260820185721.22823-8-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 19:14:56 +0000
Message-Id: <20260820191457.1E2F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Type confusion and out-of-bounds read in PHY initialization dispat=
ch.
- [High] Missing ACK poll for indirect PHY writes causes hardware race cond=
itions.
- [Medium] Power leak across system suspend due to unmanaged 'biu' clock.
- [Medium] Incorrect clamping of `clk_wr_delay` programs out-of-bounds PHY =
values.
- [Low] Off-by-one clamping error in `cp_io_mask_end` reduces maximum confi=
gurable delay.
--

--- Patch [7]: [PATCH v5 7/8] mmc: sdhci-cadence: add Cadence SD6HC support=
 ---
commit 204ee0f57cbdb355317e3bf02166d93e9c8056ce
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
Subject: mmc: sdhci-cadence: add Cadence SD6HC support

This commit splits the existing driver into sdhci-cadence-core.c and=20
sdhci-cadence-phy-v6.c to support the Cadence SD6HC. It introduces new PHY=
=20
initialization, DLL management, and timing calculations for the sixth
generation host controller.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence-core.c
> similarity index 85%
> rename from drivers/mmc/host/sdhci-cadence.c
> rename to drivers/mmc/host/sdhci-cadence-core.c
> index 1fb23051a047b..18a5329f27db9 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence-core.c
[ ... ]
> @@ -569,6 +583,7 @@ static int sdhci_cdns_probe(struct platform_device *p=
dev)
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct sdhci_cdns_priv *priv;
>  	struct clk *clk;
> +	struct clk *biu_clk;
>  	int ret;
>  	struct device *dev =3D &pdev->dev;
>  	static const u16 version =3D SDHCI_SPEC_400 << SDHCI_SPEC_VER_SHIFT;
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
> +

[Severity: Medium]
Does this drop the reference to the biu_clk variable? Since it is stored
in a local variable that goes out of scope here, the clock cannot be proper=
ly
disabled during system suspend, potentially preventing the power domain from
turning off.

>  	data =3D of_device_get_match_data(dev);
>  	if (!data)
>  		return dev_err_probe(dev, -EINVAL, "missing platform driver data\n");
[ ... ]
> @@ -601,30 +623,46 @@ static int sdhci_cdns_probe(struct platform_device =
*pdev)
>  			return ret;
>  	}
>  	sdhci_enable_v4_mode(host);
> -	__sdhci_read_caps(host, &version, NULL, NULL);
> -
>  	sdhci_get_of_property(pdev);
> =20
>  	ret =3D mmc_of_parse(host->mmc);
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D sdhci_cdns4_phy_probe(pdev, priv);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * For SD4HC, read capabilities with fixed version override and set up
> +	 * the optional eMMC card RST_n reset control.
> +	 * For SD6HC, sdhci_add_host() will automatically read capabilities
> +	 * and version from the host controller registers.
> +	 */
> +	if (of_device_is_compatible(dev->of_node, "cdns,sd4hc")) {

[Severity: High]
Can this allocation logic mishandle valid SD4HC variants?=20

If a device tree uses a supported SD4HC compatible string without explicitly
including "cdns,sd4hc" (for example, using "socionext,uniphier-sd4hc" alone=
),
the check will fail and fall into the else branch, allocating a=20
struct sdhci_cdns6_phy for an SD4HC device.

> +		__sdhci_read_caps(host, &version, NULL, NULL);
> +		ret =3D sdhci_cdns4_phy_probe(pdev, priv);
> +		if (ret)
> +			return ret;
> =20
> -	if (host->mmc->caps & MMC_CAP_HW_RESET) {
> -		priv->rst_hw =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> -		if (IS_ERR(priv->rst_hw))
> -			return dev_err_probe(mmc_dev(host->mmc), PTR_ERR(priv->rst_hw),
> -					    "reset controller error\n");
> -		if (priv->rst_hw)
> -			host->mmc_host_ops.card_hw_reset =3D sdhci_cdns_mmc_hw_reset;
> +		if (host->mmc->caps & MMC_CAP_HW_RESET) {
> +			priv->rst_hw =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +			if (IS_ERR(priv->rst_hw))
> +				return dev_err_probe(mmc_dev(host->mmc), PTR_ERR(priv->rst_hw),
> +						    "reset controller error\n");
> +			if (priv->rst_hw)
> +				host->mmc_host_ops.card_hw_reset =3D sdhci_cdns_mmc_hw_reset;
> +		}
> +	} else {
> +		ret =3D sdhci_cdns6_phy_probe(pdev, priv);
> +		if (ret)
> +			return ret;
>  	}
> =20
>  	return sdhci_add_host(host);
>  }
> =20
> +/*
> + * Only the CIU clock is gated on suspend. The SD6HC "biu" clock is not
> + * toggled here as it may be a shared bus clock; a dedicated biu clock
> + * would need explicit PM gating added here.
> + */

[Severity: Medium]
Does this skip disabling the clock during suspend due to a misunderstanding
of the Common Clock Framework?=20

Since the CCF uses reference counting, calling clk_disable_unprepare() on t=
he
driver's own reference allows the framework to correctly suspend the parent
clock or power domain once all other consumers have also suspended.

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
Could this cause an out-of-bounds read loop?=20

If an SD4HC device bypassed the compatible string check in sdhci_cdns_probe=
()
and allocated a sdhci_cdns6_phy structure, the hardware version check here
will correctly identify it as < SDHCI_SPEC_420.
   =20
This would pass the sdhci_cdns6_phy pointer into sdhci_cdns4_phy_init(),
which expects a sdhci_cdns4_phy struct. It would misinterpret the first fie=
ld
(t_cmd_output_min) as nr_phy_params, resulting in massive out-of-bounds
memory reads being written to the PHY registers.

>  	if (ret)
>  		goto disable_clk;
> =20
> diff --git a/drivers/mmc/host/sdhci-cadence-phy-v6.c b/drivers/mmc/host/s=
dhci-cadence-phy-v6.c
> new file mode 100644
> index 0000000000000..22d56bb46d75a
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

[Severity: High]
Does this function need to poll the SDHCI_CDNS_HRS04_ACK bit?=20

The SD4HC counterpart polls this bit to ensure the hardware has completed t=
he
internal indirect transaction. Leaving out the polling might cause hardware
state corruption if subsequent writes occur too quickly.

[ ... ]
> +static void sdhci_cdns6_phy_calc_out(struct sdhci_cdns6_phy *phy, bool c=
md_not_dat)
> +{
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

[Severity: Medium]
Should this clamp clk_wr_delay to phy->dll_max_value instead of 255?=20

If the DLL step size requires dynamically reducing phy->dll_max_value (for
instance, to 127 in sdhci_cdns6_phy_lock_dll), writing 255 here will apply =
an
extreme, wrapped-around delay to the PHY data lines rather than saturating
at the calibrated limit.

> +	} else {
> +		/* sdhc_extended_wr_mode set =3D> PHY IO cell work in SDR mode */
> +		clk_wr_delay =3D 0;
> +	}
[ ... ]
> +static void sdhci_cdns6_phy_calc_cmd_in(struct sdhci_cdns6_phy *phy)
> +{
> +	phy->cp_io_mask_end =3D ((phy->iocell_output_delay + phy->iocell_input_=
delay) * 2) /
> +				phy->t_sdmclk;
> +
> +	/* cp_io_mask_end is a 3-bit field, clamp to max value of 7 */
> +	phy->cp_io_mask_end =3D min_t(u8, phy->cp_io_mask_end, 7);
> +
> +	if (phy->strobe_cmd && phy->cp_io_mask_end > 0)
> +		phy->cp_io_mask_end--;

[Severity: Low]
Does clamping before the decrement artificially reduce the maximum
configurable delay?=20

If the raw computed value is 8 or higher and strobe_cmd is true, the result
becomes 6 (clamped to 7, minus 1). Decrementing before clamping would yield
a correct maximum of 7.

> +
> +	if (phy->strobe_cmd) {
> +		phy->cp_use_phony_dqs_cmd =3D false;
> +		phy->cp_read_dqs_cmd_delay =3D 64;
[ ... ]
> +int sdhci_cdns6_phy_init(struct sdhci_cdns_priv *priv)
> +{
[ ... ]
> +	reg =3D sdhci_cdns6_read_phy_reg(priv, SDHCI_CDNS6_PHY_CTRL_REG);
> +	reg &=3D ~SDHCI_CDNS6_PHY_CTRL_PHONY_DQS_TIMING;
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

[Severity: High]
Can this memory barrier fully prevent the intermittent SDR104 failures?

A wmb() only flushes the CPU write buffer. It does not wait for the hardware
controller to actually complete the indirect PHY writes. Re-adding the
SDHCI_CDNS_HRS04_ACK poll logic to sdhci_cdns6_write_phy_reg() might be
required to reliably solve the timing issue.

> +
> +	ret =3D sdhci_cdns6_dll_reset(priv, false);
> +	if (ret)
> +		return ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820185721.2282=
3-1-tanmay.kathpalia@altera.com?part=3D7

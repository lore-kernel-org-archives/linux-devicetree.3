Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35E51FCCF
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548121; cv=none; b=G30IywYtmXgqrABinpbHZhpdk2VXInSvMUUdbImuqZGAiNyzMHjIiffqzFohlKC+CJ9lHRpH7wsRiDqm/CoabpXvKqd7T4rlQfHx/3312N+9JDL+vJGpXrr6WofDPRuku9OUvud808QdgPg26GhcfDM+bzSyzPEzmoX7vgtR5sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548121; c=relaxed/simple;
	bh=F6V3/vADpSREnvU/sOKkb89t42cBOKMyi3afZ0whhC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bZvK8kOz8nXEbL0JD79DzCQ3+PG8vZCgRQJB25HpSC4Dn97nZg2PDJUvw8deD1N9B9mF+NjhwR9YQo5Bo1efamcxT9gmgVnjS53sHyY8aoyGIBU7XtjIRa+uITR6SxtMRSp2Dr81o5ECc+mrBdMk0vvDLPZYcQ4AEc/PhBeU1lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6CcxbKl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6CcxbKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D371F00A3E;
	Fri,  4 Sep 2026 18:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548119;
	bh=9zBXLvh3LySfCY9sC0FJU93iSdmW6AaKvC3jiOFNJn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C6CcxbKlobosZhzrIOkwWTWuWfh7nPvyXRR4PUDYCJk9eI8goT0Lhw3bMQ/qaAPNP
	 +eqgibhw1IOqFr71aVfHuHU2T94JAt7ZbQm3+FXYkkCUhLZC3XvmZwgJ8Wldd2TLkC
	 ISoGclhIZtpzoMc5YoR2+fEbujWrpVhUT/+fQhPGp7XRPrOUmUU2teGGvmHTGxl5rg
	 YSxwWoCk5GdAwXMp7uS1e/zFkfAIjrpxf4e5uVJY57w5kAQO0+XA4m2LwZo/SACMCw
	 U/P+A8S+3jzyzM6gv3zaQ7zL/r7q3omEqHa3QC6p2Of6/PrkPsZB263m070aTXlJsL
	 EnBZexy8KrAcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 8/9] net: stmmac: qcom-ethqos: add per-platform
 NOC clock voting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-shikra_ethernet-v1-8-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-8-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:55:18 +0000
Message-Id: <20260904185519.26D371F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Incorrect power sequencing order in ethqos_clks_config() error pat=
h drops OPP performance state before disabling dependent clock.
- [Medium] Performance state (OPP vote) leaks if probe fails after qcom_eth=
qos_init_noc_clks().

Pre-existing issues:
- [High] Sleepable calls inside NOIRQ PM suspend phase (sleeping in atomic =
context).
--

commit 4d584908beed74d65a7bef91b593a47ddf6c4f85
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add per-platform NOC clock voting
   =20
Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
that must be enabled before the DMA can reach memory. Add
ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
runtime structs so each compatible can declare its own set with per-clock
rates.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 4f9bef662c579..a31541506a4c9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -708,7 +758,12 @@ static int ethqos_clks_config(void *priv, bool enabl=
ed)
>  		qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		if (ethqos->num_noc_clks) {
> +			ret =3D clk_bulk_prepare_enable(ethqos->num_noc_clks,
> +						      ethqos->noc_clks);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC clocks enable failed: %d\n", ret);
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
> +				clk_disable_unprepare(ethqos->link_clk);
> +				return ret;
> +			}
> +		}

[Severity: High]
Does this error unwinding path invert the required hardware power sequence?

If clk_bulk_prepare_enable() fails, the code calls dev_pm_opp_set_rate() to
drop the OPP performance state before calling clk_disable_unprepare() on
the link_clk.=20

Should the dependent link_clk be disabled first to prevent hardware lockups
or brownouts while it is still running?

>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> @@ -708,7 +758,12 @@ static int ethqos_clks_config(void *priv, bool enabl=
ed)
>  		qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		if (ethqos->num_noc_clks)
> +			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
> +						   ethqos->noc_clks);
>  		clk_disable_unprepare(ethqos->link_clk);
> +		if (ethqos->num_noc_clks)
> +			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  	}
> =20
>  	return ret;

[Severity: High]
This is a pre-existing issue, but ethqos_clks_config() is called from
stmmac_pltfr_noirq_suspend() (via pm_runtime_force_suspend() and
stmmac_runtime_suspend()), which runs with local interrupts disabled.

The existing code already called clk_disable_unprepare() which acquires the
sleepable CCF prepare_lock mutex, risking a deadlock or kernel panic when
sleeping in atomic context.

This patch adds more sleepable function calls here, such as
clk_bulk_disable_unprepare() and dev_pm_opp_set_rate() (which acquires
the opp_table->lock mutex).

Could these sleepable hardware power operations be moved to a sleepable
suspend phase?

[ ... ]

> @@ -736,6 +791,46 @@ static void ethqos_ptp_clk_freq_config(struct stmmac=
_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
> =20
> +/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
> + * so ethqos_clks_config() can enable/disable them at runtime. The OPP
> + * table is used to propagate the required VDD_CX performance state via
> + * dev_pm_opp_set_rate().
> + */
> +static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
> +				     const struct ethqos_emac_driver_data *data)
> +{
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data->num_noc_clks)
> +		return 0;
> +
> +	for (i =3D 0; i < data->num_noc_clks; i++) {
> +		ethqos->noc_clks[i].id =3D data->noc_clk_cfg[i].id;
> +		ethqos->noc_clk_rates[i] =3D data->noc_clk_cfg[i].rate;
> +	}
> +	ethqos->num_noc_clks =3D data->num_noc_clks;
> +
> +	ret =3D devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
> +
> +	ret =3D devm_pm_opp_set_clkname(dev, data->noc_clk_cfg[0].id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set OPP clock name\n");
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
> +
> +	ret =3D dev_pm_opp_set_rate(dev, data->noc_clk_cfg[0].rate);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set initial NOC OPP rate\n");
> +
> +	return 0;
> +}
> +
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np =3D pdev->dev.of_node;
> @@ -795,6 +890,12 @@ static int qcom_ethqos_probe(struct platform_device =
*pdev)
>  	ethqos->has_emac_ge_3 =3D data->has_emac_ge_3;
>  	ethqos->needs_sgmii_loopback =3D data->needs_sgmii_loopback;
> =20
> +	if (data->num_noc_clks) {
> +		ret =3D qcom_ethqos_init_noc_clks(ethqos, data);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ethqos->link_clk =3D devm_clk_get(dev, data->link_clk_name ?: "rgmii");
>  	if (IS_ERR(ethqos->link_clk))
>  		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),

[Severity: Medium]
If devm_clk_get() fails (e.g., returning -EPROBE_DEFER), does this leak the
performance state (OPP) vote?=20

qcom_ethqos_init_noc_clks() sets the initial rate via dev_pm_opp_set_rate(),
but there doesn't seem to be a devres cleanup action or manual unwind in the
error path of qcom_ethqos_probe() to drop the vote by calling
dev_pm_opp_set_rate(dev, 0).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-shikra_eth=
ernet-v1-0-a50765996035@oss.qualcomm.com?part=3D8

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB668227BB9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 23:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468479; cv=none; b=M4FkajiYY1Tjbi0aEzTY2BwLcqv9TzE4bZKgzokj1O8pf+93rjbsSPo6Mjm64K/6wL82UYSnYZtI6pv3ImcvmnSQ1c+iTxf4tp2+RUy0NXrjBp6+foC9wDUashai6ZbVP7yiTKRCTYVtziPXuCxIOHqaU/Lf3dDR7IgDdAZ1Fy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468479; c=relaxed/simple;
	bh=peyNi9efO1Ew0SZQDbF8ZvJBceXQDC/acAR5mo3fGlo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fpHl/6wEqTkyFeAMptvzQlFUXo9Vt1AgTh4INPaCBib5HRxfPl8Mdny07UsBxov1W86lU95EylJU3aIoWs6ZW2dt65PvRn380uayRf0qBhDd3psGrifLwUednoXaJy97pgrXHERyvFt5tIQpfE3r1ECHURA7OHTQHthWkVQ9JsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3U4Qeot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3U4Qeot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31631F000E9;
	Tue,  7 Jul 2026 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783468477;
	bh=mFlnY09/quxkpz0+kwQHHyZFT1dVLEuYTm2Dxu+j/iI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o3U4QeotDOYH3XZqFmkFrnUL9wHocqsQcxjI0pCaMHnez5/kRsrtLXlLiqKNq3a0r
	 j+nUhm/JBYX8ot5Ide1vPnl+f/K6kGB8AHFUaLZ2YfgLgDi6khSXZyZ4wXwNi9d8Av
	 mSPLzyTZrKdLoyWUmbmYsCSDH51XATbB9jhr3e1j9vIxTy6PrARnf7duFAxXteZXIq
	 yUeoPyASG+iHC+5NMzI0kgAWr/bvfa8X01pA++3ebwgjYwkE2J2OoZzK94bJerMPkJ
	 Anp6RPweN8I8mwK50mb0EY9FnYRDwLKXLij8mgEj8XEcxfVBxl15O55/KyrnNCeLRj
	 h2GCmECfcrquA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260708-x1e-csi2-phy-v9-2-0210b90c04cf@linaro.org>
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-2-0210b90c04cf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 23:54:36 +0000
Message-Id: <20260707235436.F31631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `pd_data` struct is allocated on the stack but not zero-initia=
lized, causing garbage `pd_flags` to be passed to `devm_pm_domain_attach_li=
st()`.
- [High] Missing resource cleanup on the error path of `phy_qcom_mipi_csi2_=
power_on` if `ops->lanes_enable()` fails.
- [High] The power-off sequence incorrectly drops the device's voltage (per=
formance state) before its frequency (OPP rate), causing improper power seq=
uencing.
- [Medium] `phy_qcom_mipi_csi2_probe` falsely returns success (0) when PM d=
omains are not attached.
--

--- Patch [2]: [PATCH v9 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY dri=
ver ---
commit c5be1bcc08e40b760c1de3b49fbb5eda1354c97c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
[ ... ]
> @@ -118,6 +118,78 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *p=
hy)
>  	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
>  	const struct mipi_csi2phy_hw_ops *ops =3D csi2phy->soc_cfg->ops;
>  	int i, ret;
[ ... ]
>  	ops->reset(csi2phy);
> =20
>  	ops->hw_version_read(csi2phy);
> =20
>  	return ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);

[Severity: High]
If ops->lanes_enable() fails, does this return directly and bypass the
cleanup labels (unset_rate, poweroff_phy, disable_regulators)?

Will this leak the regulator enable counts and PM runtime usage counts,
leaving the hardware permanently powered on?=20

Also, should the clocks be disabled in an error path here since they were
enabled earlier in the function?

> =20
>  unset_rate:
>  	for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>  			continue;
> =20
>  		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
>  	}
> =20
>  	dev_pm_opp_set_rate(csi2phy->dev, 0);

[Severity: High]
Does this error path sequence drop the performance state (voltage) to 0
before dropping the OPP rate (frequency) to 0?

Could lowering the voltage while the hardware is still running at a high
clock frequency cause hardware faults or system instability?

[ ... ]
> @@ -168,6 +168,26 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *=
phy)
> =20
>  	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
>  				   csi2phy->clks);
> =20
>  	for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>  			continue;
> =20
>  		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
>  	}
> =20
>  	dev_pm_opp_set_rate(csi2phy->dev, 0);

[Severity: High]
Does this similarly drop the performance state before lowering the OPP rate
during normal power off?

[ ... ]
> @@ -210,6 +210,23 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(stru=
ct mipi_csi2phy_device *csi2
>  {
>  	struct dev_pm_domain_attach_data pd_data;
>  	const char **pd_names;
>  	int i;
> =20
>  	pd_names =3D devm_kzalloc(csi2phy->dev,
>  				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
>  				GFP_KERNEL);
[ ... ]
>  	pd_data.pd_names =3D pd_names;
>  	pd_data.num_pd_names =3D csi2phy->soc_cfg->num_genpds;
> =20
>  	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
>  					  &csi2phy->pd_list);
>  }

[Severity: High]
Is the pd_data struct fully zero-initialized before being passed to
devm_pm_domain_attach_list()?

Since pd_data is declared on the stack and only pd_names and num_pd_names
are populated, could random garbage on the stack cause unexpected pd_flags
to be set?

If bits like PD_FLAG_NO_DEV_LINK or PD_FLAG_ATTACH_POWER_ON are set by
uninitialized memory, it might skip creating device links and cause silent
hardware failures.

[ ... ]
> @@ -331,6 +331,90 @@ static int phy_qcom_mipi_csi2_probe(struct platform_=
device *pdev)
>  	ret =3D phy_qcom_mipi_csi2_parse_routing(csi2phy);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
>  	if (ret < 0 || csi2phy->pd_list =3D=3D NULL)
>  		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
> =20
>  	devm_pm_runtime_enable(dev);

[Severity: Medium]
If devm_pm_domain_attach_list() returns 0 but csi2phy->pd_list is NULL,
will dev_err_probe() return 0 here?

Could this falsely report a successful probe to the driver core while
leaving the device half-initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-x1e-csi2-p=
hy-v9-0-0210b90c04cf@linaro.org?part=3D2

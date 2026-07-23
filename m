Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CA355048
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774645; cv=none; b=hxTpJCd4B+sucGck2C0Q0c49GHKu6+e/JITwg0Up05R1HYZlRuXwUhPZov34X1cc2yeLm02DfPAW/Y463ZEbFFcaK6ZWbJNsdXFgpyETaU3NR1AioPTE4wdfu5GNfgQLgzK3G2BU//UPiMk+B45EZZWJWtEtqvw1TpNDCPOYsLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774645; c=relaxed/simple;
	bh=NPLSY9k9knrDG+QgQjpAJt501oG3X5HQ4HdCYtlX0ns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ox+Wo7bQ54+8pltLebuy0O2TwtqVnlPeCOk8lCN4pya0MmbGWB3+XqRZ0lY+vY2iF01eJMnT+6269Yne9CSMmsIV2tKHfPGQEH0K9QdK4/dFSLV7NwLvaoEBmPmxzP7v0TH/4QHISK2/eISl+jrySkQ2mrw/yzZaYoTLzsRIpUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFiMZ44a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFiMZ44a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4DD1F00A3A;
	Thu, 23 Jul 2026 02:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784774642;
	bh=cZ0RpoRsNCBnMwb6W/Jn4NaTuUluXiHIqDeqXMQxRVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DFiMZ44agY+2bgobgW0iGHvNLrDnj0SZhvDN862jDnckBbpJdCZESR7YDWQNie+43
	 bcxcIoml0Sc5j43e47qzB2O4qGgrIe+ZK9rZRfDS0fOpWFkqdR5m/gElgXSrmG+9bf
	 u/fn5KFIuiHhI+xuiI8tq5HYMf4f/X3/TKtDUJM5nfW5bfEBJwK14Ba0auV/NgDSQV
	 qUD87D+jqM7FP62wXZh3pnT+Sdoz2ZrgOk5qxGwedjOPUb8EYp8qOxmm8i+PUDbbxi
	 N4Yq5lRntnxwzo0+EPz5aUIDtwLsYZOOgSJOsalRNwGcrUi7ax7ZrhDWG2GbRQqK/u
	 kDUrZqsSY24VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-glymur_linkmode_0722-v6-2-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-2-bba8156b8cbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:44:00 +0000
Message-Id: <20260723024401.EA4DD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing NULL check for power domain devices causes a kernel panic =
if a power domain is missing in the device tree.
--

--- Patch [2]: [PATCH v6 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY d=
river ---
commit 7fe1c90cb97487fff90a2cef8d97abd7bb798202
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver

This commit adds a dedicated driver for QMP PCIe PHY hardware blocks that
support multiple link topologies. It uses a per-mode config table to
instantiate one qmp_pcie per sub-PHY required by the link mode.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/=
phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c

[ ... ]

> +static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +	int i, ret;
> +
> +	for (i =3D 0; i < cfg->num_pds; i++) {
> +		ret =3D pm_runtime_resume_and_get(qmp->pd_devs[i]);

[Severity: High]
If dev_pm_domain_attach_by_name() returns NULL during initialization, could
passing that NULL to pm_runtime_resume_and_get() here cause a kernel panic?

> +		if (ret < 0) {
> +			dev_err(qmp->dev, "failed to power on %s domain\n",
> +				cfg->pd_names[i]);
> +			goto err_power_off;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	while (--i >=3D 0)
> +		pm_runtime_put(qmp->pd_devs[i]);
> +
> +	return ret;
> +}
> +
> +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +	int i;
> +
> +	for (i =3D cfg->num_pds - 1; i >=3D 0; i--)
> +		pm_runtime_put(qmp->pd_devs[i]);

[Severity: High]
Similarly, could this pm_runtime_put() panic if qmp->pd_devs[i] is NULL?

[ ... ]

> +static int qmp_pcie_pd_init(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +	struct device *dev =3D qmp->dev;
> +	int i, ret;
> +
> +	if (!cfg->num_pds)
> +		return 0;
> +
> +	qmp->pd_devs =3D devm_kcalloc(dev, cfg->num_pds, sizeof(*qmp->pd_devs),
> +				    GFP_KERNEL);
> +	if (!qmp->pd_devs)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < cfg->num_pds; i++) {
> +		qmp->pd_devs[i] =3D dev_pm_domain_attach_by_name(dev,
> +							       cfg->pd_names[i]);
> +		if (IS_ERR(qmp->pd_devs[i])) {

[Severity: High]
dev_pm_domain_attach_by_name() returns NULL if the power domain is missing
in the device tree. Because this only checks IS_ERR(), a NULL pointer will
be stored in qmp->pd_devs[i] in that scenario.

Should this check be IS_ERR_OR_NULL(), or should the power on/off functions
check for NULL before calling the runtime PM APIs?

I noticed that qmp_pcie_pd_detach() correctly uses !IS_ERR_OR_NULL() when
cleaning up, so it seems like NULL might be an expected value to handle.

> +			ret =3D PTR_ERR(qmp->pd_devs[i]);
> +			goto err_detach;
> +		}
> +	}
> +
> +	return devm_add_action_or_reset(dev, qmp_pcie_pd_detach, qmp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-glymur_lin=
kmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com?part=3D2

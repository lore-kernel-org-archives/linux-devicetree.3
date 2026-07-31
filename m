Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD382D3EEB
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475601; cv=none; b=saAgiVqk7nBYCNYroyW4oPdq1PyDyR7uyN4EM21U3Qtj52OzKSXb/0rXXc6N0YVF0FYx8pReGA/v6I37JLgXzebFRz8/EJakTuYh7QvQT4EK6wH7HkNKwSMmH+2PzzrMCyPhqtOOpj0qsEQFlnrNO/nrucm03axDXLYSlVJVH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475601; c=relaxed/simple;
	bh=VVafv/8tDS6oCkWve6qfblDwVFH01avyxgOsNPClY5U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nb3NysZhVJte4OXsZHKKk3bquKurXh4aJnPGW+r4xnfJyzgDkK6v2WIVUnFQMyVakqFhoiRayBYkV1/k4vrA146DnmWg0t188oiyk/LeahfI0GzbnvUYSepCDY0aetGv11c0OlAvUWN1Yl4tgmvzfxV/syVwGO8Y4A6zfZ7MSzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhoeMVSL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhoeMVSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FF61F000E9;
	Fri, 31 Jul 2026 05:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785475599;
	bh=XIrCJMc+HIXJXCNFISK7TKZOqfRlSB4xo+zlSbIJILA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IhoeMVSL02j43zvM3Ei5Pj5EkaZVHdyjsTmkvPNiHpQCoabaP4Vx0jOzgCxaZNQcr
	 eot/sonsuRiZeEqhUQ4iWyQW7AqIGy4cypXcDrlXffJF8bkIYEXVYrhrepMkfPoWnT
	 klnuOa3rthnksY3x1tnhI7B8/JONO0pxxLQPvClyDygGVDJSWF2BUQKre6/exuIFv6
	 k31/tXb+TvZkPE1OwKXNhekfJseQl+8wLvuXfw9Zkl5qxbm0ilWVWb9OMQLAXwsNkq
	 Y+Fbj1u9IMf4N/7+PDkPWlgXA8zC1dGB19h49kJyLJAH+oB4NOhcTeEuo6MTi9qqq4
	 g/aWpXwy1S9Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260730-glymur_linkmode_0731-v8-2-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-2-a455265ad8bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 05:26:39 +0000
Message-Id: <20260731052639.81FF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Asynchronous pm_runtime_put() during PHY power off leaves hardwa=
re powered on if device is removed.
- [Medium] Unchecked return value of of_property_count_strings() leads to m=
assive allocation attempt and incorrect error masking.
--

--- Patch [2]: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY d=
river ---
commit 512c48acf91e02b02ae430362c2348d1ce2fb525
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver

This patch introduces a dedicated QMP PCIe PHY driver for hardware blocks
that support multiple link topologies. It reads the current link mode from
the hardware and instantiates the necessary sub-PHYs, inheriting firmware
configurations.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/=
phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> new file mode 100644
> index 0000000000000..739c7c96aeed6
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
> +		if (ret < 0) {
> +			dev_err(qmp->dev, "failed to power on %s domain: %d\n",
> +				cfg->pd_names[i], ret);
> +			goto err_power_off;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	while (--i >=3D 0)
> +		pm_runtime_put(qmp->pd_devs[i]);

[Severity: Medium]
Will using an asynchronous pm_runtime_put() here (and in=20
qmp_pcie_pd_power_off) race with device unbind?

If the PHY provider unbinds, device links will cause the consumer to unbind
first, which calls phy_power_off() and phy_exit(), queuing an asynchronous
suspend. The PHY provider's devres cleanup then calls dev_pm_domain_detach(=
),
which executes pm_runtime_disable() and cancels the pending suspend.

Does this leave the hardware powered on? Should pm_runtime_put_sync() be us=
ed
instead to ensure the hardware powers down before the domain detaches?

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

[Severity: Medium]
As mentioned above, can this asynchronous put race with the devres teardown
during removal?

> +}
[ ... ]
> +static int qmp_pcie_multiphy_register_clocks(struct device *dev,
> +					      struct device_node *np,
> +					      struct qmp_pcie_multiphy *qmp_data)
> +{
> +	int num_pipe_outputs;
> +	int i, ret;
> +
> +	num_pipe_outputs =3D of_property_count_strings(np, "clock-output-names"=
);
> +
> +	qmp_data->num_pipe_outputs =3D num_pipe_outputs;
> +	qmp_data->pipe_out_clks =3D devm_kcalloc(dev, num_pipe_outputs,
> +					       sizeof(*qmp_data->pipe_out_clks),
> +					       GFP_KERNEL);

[Severity: Medium]
Does this code properly handle missing or malformed device tree properties?

If "clock-output-names" is missing, of_property_count_strings() will return
a negative error code (e.g., -EINVAL). This negative value is passed as the
count parameter to devm_kcalloc(), underflowing into a massive size_t.=20

While the internal size_mul checks in the allocator safely return NULL, this
causes the driver to fail probe with -ENOMEM rather than the actual device
tree parsing error. Should num_pipe_outputs be checked for a negative value
before attempting the allocation?

> +	if (!qmp_data->pipe_out_clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_pipe_outputs; i++) {
> +		ret =3D __phy_pipe_clk_register(dev, np, i,
> +					      &qmp_data->pipe_out_clks[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, qmp_pcie_multiphy_clk_hw_get, q=
mp_data);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-glymur_lin=
kmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com?part=3D2

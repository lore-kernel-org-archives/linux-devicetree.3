Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C13FA5DD
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096808; cv=none; b=RVURlhnkR7coJ3fq2NGCxa8afGcC3JIz7qmfsWtRcY3v+ei/A0ZD6hjl0Kw30vM1v5E69csgZt4SQsuifUiu/aaHTKgNvEKRTVtRbo1obNgd7+hg/fnJRFHRm8D+Jk1Tpges0ApHPFpJ5i+7FSugpFCCOXZZilGZPZvfes78d60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096808; c=relaxed/simple;
	bh=4QClrz0ekg8jW+bU9CazFEcDDnAnRl9xhnNUsPm/80k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fLjcZ/mXjyWTDOzENn1T+526piyWIlBm8uPhGtTLd7hKjwLuzFEGkAQFdAZD5K6c8+4GLSmORfkWR1oyjQVip2U/O+l1paJckeFUnjzKuNtkrk5QRz2/oDfugmOj0kQLdzd0PSBMHqcGm14VYOvVRVae51T/NjvZ2MemTYPs1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGViLZSY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGViLZSY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABD31F000E9;
	Fri,  7 Aug 2026 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786096807;
	bh=uoFo+0qWOo7EjHVbum7BKJa8TYReTkAStSvX4qsSdmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cGViLZSYvl5F1/PZ7EYZWzfJc9XOQbXL6XuUi2pShwnMwuV+NSF60XubSM7Hmh2sR
	 OMwaECsATMgOmly//VKIgv7N0xZHTrNOF8YU/LfjNIOcrOYRWxv8k7mZ0B1C7ouwUn
	 VpxpYQpw6T2zvRZa6c2tzfNfVTCDjdmNCcjyV3HAXxsD+0CHP+Y6H6rKP3CdB+EgDv
	 DU3y07wiCCqF6Jnzi+hV9lJXgJtX11EYPwEtHNhFxarGcfA2d89q9JJrLExUJG8kiv
	 TofJEQn6chKXgdRFDpxd1C4qFiW/r/K3YK7fHdMahgbH1WTd+W8MuKq1q8OSbCZlCV
	 E5jCNVNU0t0VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260807-glymur_linkmode_0807-v9-2-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
 <20260807-glymur_linkmode_0807-v9-2-dd1c7e236e29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 10:00:05 +0000
Message-Id: <20260807100006.DABD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing error check for of_property_count_strings() leads to pas=
sing a negative value as array size to devm_kcalloc().
--

--- Patch [2]: [PATCH v9 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY d=
river ---
commit 5143b0d54dc0134303885f90816364c6021fa993
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver

This commit adds a dedicated driver for QMP PCIe PHY hardware blocks that
support multiple link topologies (bifurcation). It reads the current link m=
ode
from a TCSR register, and dynamically instantiates the required sub-PHYs,
clock providers, and #phy-cells to expose individual sub-PHYs by index.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/=
phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> new file mode 100644
> index 0000000000000..e93cba4369fb1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c

[ ... ]

> +static int qmp_pcie_multiphy_register_clocks(struct device *dev,
> +					     struct device_node *np,
> +					     struct qmp_pcie_multiphy *qmp_data)
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
If the clock-output-names property is missing from the device tree,
of_property_count_strings() will return a negative error code (such as
-EINVAL).=20

Will passing this negative value as the array size to devm_kcalloc() cause =
it
to implicitly cast to a massive size_t value? While the allocator will like=
ly
fail safely and return NULL, it seems this would cause the driver to return
-ENOMEM instead of propagating the actual error code.

Should we add a check to verify num_pipe_outputs > 0 before attempting the
allocation?

> +	if (!qmp_data->pipe_out_clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_pipe_outputs; i++) {
> +		ret =3D __phy_pipe_clk_register(dev, np, i,
> +					      &qmp_data->pipe_out_clks[i]);
> +		if (ret)
> +			return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-glymur_lin=
kmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com?part=3D2

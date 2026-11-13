Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560121;
	b=Ro35mGm1dVmsjvqB3SbJAXHGBaV/7p2c+uG9uFCOYkybh7GCmqtLbANi1nPupxDAED/S
	 ZTsGGTpsga+CzTG6EIUD980KPUmum/gyo9kcy764qxN9wRD5DxZ/n0Egmj7uuI+eCrOlD
	 ltfFh8LneGdSUuiSDG8DYb/VKRAg388B4XDb3QGP4J8EM/lmIbbryervY/rnlnrEk5Ncw
	 /EenPfqpRQZFNfprFgujL/zpefPToNsF4HjjrYejoF7/opLa0+G0ku4AxMZRbv2qNrOHi
	 9UbkFWzuufcs88u6+cYtsTeFu7Yfzj2oyA/bugXMyxn/pHl+XBKu//Flzh2ulZgBjBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560121;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GELAR2KyQtCDu1K0VR89akHnPcpw44546jMrJojRZLs=;
	b=uqTVyM4dCeF6ZnevqAPrKM+SSw+bmUTPCyMBIl7arA5F7BqId6/02J6nkfIRSSmqKgvi
	 eox8X8Q+BooNW5gbgIhdbYytsjSylBqfp5jlLMZwWX1BML+tw2U1Ly3/DL1R5WTA1Fezl
	 N1x6+G4gZRmEQfGCJb0XD4EsHMiKBHMXuUIrXSORSHUO5O+zLkn+UWkJSc3TbMwogiU4E
	 9R+myv3k51cXDmB0QMtuCn4gzD8K/DoS9h/AEJTw3wzRrVkoQ8SMMHZdpTnRKZIFMjpem
	 hnmwjFPBaolkN7Bon/OjuKq+W5YcbkwmSASdinefQf7HV1FDmXDJcjw7hH7mDe78BEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiBaZRfA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46AF606A336
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiBaZRfA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4621F000C4;
	Fri, 13 Nov 2026 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560121;
	bh=GELAR2KyQtCDu1K0VR89akHnPcpw44546jMrJojRZLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eiBaZRfAfR49WHaWTjEHPWNg6o+XgthJ8ZwbeXftDOy7PAnDaAtkz8KhJUA3eqzRw
	 HgS4n+2D+crSIn6sj7Obl7nloq/O8o9z9eQytMGjkI7NEbQsAVMdtrNOno3zWqa86i
	 8c+UxnVmTtFPFi3wy8eDK7MFibTRcIgrfkmKnFomxAX2PeG2z9hAYcnZ+bBNZqch5J
	 iL6wkVQBsjRB1TeLUG5IF5wBL13/dJz3V+Tz2tobMzr+gdyXx1IqbnQYldFzG78ah3
	 45DNPtMkX8GXCVXcu3YFd/u+FxvtlKmyXmtiHNhc9bjcADvbPAojAxo+1y7V1YjgIK
	 XoAB5OljYtHuA==
Message-ID: <sashiko-outbox-212477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] thermal: qcom: tsens: add hardware-bin
 trip-point filtering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-thermal_bin-v3-4-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-4-878df6eef8bc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:55:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] thermal: qcom: tsens: broken error handling in
  tsens_populate_hw_bin_info()
- [Low] thermal: qcom: tsens: inaccurate cell_names kernel-doc in
  tsens_hw_bin_desc
- [Low] thermal: qcom: tsens: inaccurate i-temp description in commit
  message
--

commit 65356a4ab856b03d856c9e9331810962e03057df
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

thermal: qcom: tsens: add hardware-bin trip-point filtering

This commit reads hardware-binning qfprom fuse cells at probe time and pass=
es
the computed hardware version bitfields to the thermal OF parser for
qcm6490, sc7280, and x1e80100 TSENS controllers.

>  - tsens_hw_bin_desc_i_temp reads a single i-temp bit and reports it
>    directly as the hw-bin value; used by data_x1e80100.

[Severity: Low]
Is this description of tsens_hw_bin_desc_i_temp accurate?

tsens_compute_hw_version_i_temp() maps bit 0 of the fuse to the bitmask
values 0x1u (standard bin) or 0x2u (high-temp bin) rather than reporting
the raw bit value directly.

> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index bca3fb1d2bf99..db4e02529c91d 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c

[ ... ]

> +static const char * const tsens_cells_qcm6490[] =3D { "jtag-id", "feat-i=
d" };
> +static const char * const tsens_cells_i_temp[]  =3D { "i-temp" };
> +
> +const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490 =3D {
> +	.cell_names         =3D tsens_cells_qcm6490,
> +	.ncells             =3D ARRAY_SIZE(tsens_cells_qcm6490),
> +	.compute_hw_version =3D tsens_compute_hw_version_qcm6490,
> +};
> +
> +const struct tsens_hw_bin_desc tsens_hw_bin_desc_i_temp =3D {
> +	.cell_names         =3D tsens_cells_i_temp,
> +	.ncells             =3D ARRAY_SIZE(tsens_cells_i_temp),
> +	.compute_hw_version =3D tsens_compute_hw_version_i_temp,
> +};
> +
> +/**
> + * tsens_populate_hw_bin_info - read fuse cells and populate priv->hw_bi=
n_info
> + * @priv: tsens private data
> + * @data: platform data containing the optional hw_bin_desc pointer
> + *
> + * If data->hw_bin_desc is NULL, this is a no-op and returns 0.  Otherwi=
se,
> + * reads the nvmem cells named in hw_bin_desc->cell_names, calls the
> + * compute_hw_version() callback, and stores the result in priv->hw_bin_=
info
> + * for later use by tsens_register().
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +static int tsens_populate_hw_bin_info(struct tsens_priv *priv,
> +				      const struct tsens_plat_data *data)
> +{
> +	const struct tsens_hw_bin_desc *desc;
> +	u32 fuse_vals[TSENS_HW_BIN_MAX_CELLS];
> +	u32 hw_versions[THERMAL_HW_BIN_MAX_LEVELS] =3D { 0 };
> +	unsigned int hw_count =3D 0;
> +	int i, ret;
> +
> +	if (!data->hw_bin_desc)
> +		return 0;
> +
> +	desc =3D data->hw_bin_desc;
> +
> +	if (!desc->ncells || desc->ncells > TSENS_HW_BIN_MAX_CELLS) {
> +		dev_err(priv->dev, "hw_bin_desc ncells %u out of range\n",
> +			desc->ncells);
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D 0; i < (int)desc->ncells; i++) {
> +		ret =3D nvmem_cell_read_variable_le_u32(priv->dev,
> +						      desc->cell_names[i],
> +						      &fuse_vals[i]);
> +		if (ret < 0) {
> +			dev_err(priv->dev,
> +				"failed to read nvmem cell '%s': %d\n",
> +				desc->cell_names[i], ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D desc->compute_hw_version(priv->dev, fuse_vals, desc->ncells,
> +				       hw_versions, &hw_count);
> +	if (ret) {
> +		dev_err(priv->dev, "compute_hw_version failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!hw_count || hw_count > THERMAL_HW_BIN_MAX_LEVELS) {
> +		dev_err(priv->dev,
> +			"compute_hw_version returned invalid hw_count %u\n",
> +			hw_count);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Store a copy of the hw-version array in priv->hw_bin_info so
> +	 * tsens_register() can pass it to the thermal OF parser while trips are
> +	 * parsed.
> +	 *
> +	 * Use devm_kmemdup so the copy is freed when the device is unbound.
> +	 */
> +	priv->hw_bin_info.supported_hw_bin =3D devm_kmemdup(priv->dev, hw_versi=
ons,
> +							  hw_count * sizeof(u32),
> +							  GFP_KERNEL);
> +	if (!priv->hw_bin_info.supported_hw_bin)
> +		return -ENOMEM;
> +
> +	priv->hw_bin_info.supported_hw_bin_count =3D hw_count;
> +
> +	return 0;
> +}

[ ... ]

> @@ -1443,6 +1619,14 @@ static int tsens_probe_common(struct platform_devi=
ce *pdev)
>  	priv->feat =3D data->feat;
>  	priv->fields =3D data->fields;
> =20
> +	ret =3D tsens_populate_hw_bin_info(priv, data);
> +	if (ret =3D=3D -EPROBE_DEFER)
> +		return ret;
> +	if (ret)
> +		dev_warn(&pdev->dev,
> +			 "thermal-bin failed to read FUSE data (%d): trips with temperature-b=
in will use first entry\n",
> +			 ret);
> +
>  	platform_set_drvdata(pdev, priv);
> =20
>  	device_init_wakeup(dev, !data->no_irq_wake);

[Severity: Medium]
Does tsens_populate_hw_bin_info() log a dev_err() on -EPROBE_DEFER before
tsens_probe_common() checks for probe deferral?

When TSENS probes before the qfprom nvmem provider,
nvmem_cell_read_variable_le_u32() returns -EPROBE_DEFER and
tsens_populate_hw_bin_info() emits an error message on every deferred
probe attempt.  When booting with existing sc7280 or x1e80100 DTBs that do
not define the optional nvmem-cells for hardware binning,
nvmem_cell_read_variable_le_u32() returns -ENOENT, causing both the
dev_err() in tsens_populate_hw_bin_info() and the dev_warn() in
tsens_probe_common() (which also passes &pdev->dev instead of dev) to be
printed.  In addition, if devm_kmemdup() returns -ENOMEM,
tsens_probe_common() treats it as a non-fatal fuse read warning instead of
failing probe.

> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index a35b15312961f..24489542b8a21 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -40,6 +40,29 @@ enum tsens_ver {
>  	VER_2_X_NO_RPM,
>  };
> =20
> +/**
> + * struct tsens_hw_bin_desc - per-SoC descriptor for hardware-bin fuse r=
eading
> + * @cell_names: NULL-terminated array of nvmem cell names to read
> + * @ncells:     number of entries in @cell_names
> + * @compute_hw_version: callback that converts raw fuse values to hw-ver=
sion
> + *                      bitfields for thermal OF trip filtering
> + *
> + * Embed a pointer to this struct in tsens_plat_data.hw_bin_desc to enab=
le
> + * hardware-bin trip filtering for a given SoC.  Set to NULL to disable.
> + */
> +struct tsens_hw_bin_desc {
> +	const char * const	*cell_names;
> +	unsigned int		 ncells;
> +	int (*compute_hw_version)(struct device *dev,
> +				  const u32 *fuse, unsigned int nfuse,
> +				  u32 *hw, unsigned int *count);
> +};

[Severity: Low]
Should the kernel-doc for @cell_names drop "NULL-terminated"?

tsens_cells_qcm6490 and tsens_cells_i_temp are not NULL-terminated and
size @ncells with ARRAY_SIZE(), while tsens_populate_hw_bin_info()
iterates from 0 to desc->ncells - 1.  If a future descriptor follows the
comment and NULL-terminates cell_names while using ARRAY_SIZE() for
ncells, the NULL sentinel will be passed as cell_id to
nvmem_cell_read_variable_le_u32().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-thermal_bi=
n-v3-0-878df6eef8bc@oss.qualcomm.com?part=3D4

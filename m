Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453814;
	b=Sn+W4Z1k6guxwo4wSrbXykz81FcODouF7QxqCqTDmr3Lc5thyyjVuw6h10dt+7ytgr80
	 jNtTYZtW4NwHEePWQfPEBcFBMb6ISl+l0IVlz+3Ij8uMyJYU1g7s85Kg7vMNviBqtypa9
	 URlQMB0i9WbL5EYsFdPw+QttfuC1cf6x91R/sya4QwKlASKbLck0acfwH8E0hGIoQL+eW
	 LWgjZwVjpnVKl5dhmVkIjfRvR8D8q+Rxl4l5+ubl5JVBhgZII55c6UCN/GTwhrHsTmZb5
	 q01dy/IZ5qbUUCB75upG616J6i6M5EF520RfYapaJj03rIG62KXBe0IvEJvS+BzZHfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453814;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MSKv52fyEAwCevsNkAkD8sJsmJ/DVfrXhTtI2ydUKA4=;
	b=BrUltFuQ+UR9LJ9cHUzB/LrezLy1CxoKTU/O1zhxSaGXs88bUedFWvYbduZ704LKu7il
	 EZIy1DAgtaFqZoGR9Tw5zmAbUuiiCqi9WHPWG5v8dlQ9b6OWHjZsAHI+cVNjqsLA6gWi+
	 IFWhL6yXZSUd4caN+3Ig8VPt/eLjw3laoz6RFy0dV/ro0ydPw+t+6NmpoyIaIFEXsL5/a
	 m2Jgp66Cssu8A6h6e6AvYmHSXrYiRROdPeZyC2yLR4G4PnLuY7Su1ZRmPmUzVTEPEIzhv
	 lvUxznm+kPQr7Np7hxSdDz3j9rW0arhnTyib6sbcRWvuDP1YNBbxi8Q8DTM3/+QUBTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPTaKFNQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6B6606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPTaKFNQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650991F000C1;
	Sat, 31 Oct 2026 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793453813;
	bh=MSKv52fyEAwCevsNkAkD8sJsmJ/DVfrXhTtI2ydUKA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPTaKFNQ32LpPpOQoVBIUEW1jsyr2/OBp9KNX5FqtZYNs6YXpcwNIpM6hgthaf4Aa
	 yx9aK1mVkuXPKndp7eXLI6BiwuKzdvuBzDrTXHxGGTAnHb2ETnjsUv0URK9AEAhsxU
	 GlqoZHCyN83eAmh+bkT3kdDoJ3rYoZ/W2b5HnipbHGqEcWaK5vqJCZjWWR1cT8Cfgk
	 l4wL8ilGUTaP1Ao4PWz6WW9XQs28z21eud0B8wgoNGiWxT2KvBeKuMStj6gT71hBuS
	 rZ7IxU/hVB3sUVujN3ptbCiRdzEAjrzZSPIaYTdYhpleMTVmTWn/VLB8vhdsov3+3g
	 qZS4v/EFurbeA==
Message-ID: <sashiko-outbox-191979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] thermal: qcom: tsens: add hardware-bin
 trip-point filtering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031-thermal_bin-v2-4-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
 <20261031-thermal_bin-v2-4-d76fd073ae98@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 13:36:53 +0000
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
- [Medium] thermal: qcom: tsens: broken error handling in tsens_populate_hw=
_bin_info()
- [Low] thermal: qcom: tsens: inaccurate cell_names kernel-doc in tsens_hw_=
bin_desc
- [Low] thermal: qcom: tsens: inaccurate i-temp description in commit messa=
ge
--

commit 747c218e81cea1873e3ba13a84fe505aad9fc9f2
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

thermal: qcom: tsens: add hardware-bin trip-point filtering

This commit adds per-SoC qfprom fuse support to read hardware binning
information at probe time and pass it to the thermal OF parser for
trip-point filtering on x1e80100, sc7280, and qcm6490.

>     thermal: qcom: tsens: add hardware-bin trip-point filtering
>    =20
>     Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>     in qfprom fuses. The thermal OF parser can filter trip points by
>     hardware version; wire tsens up to feed it.
>    =20
>     Add the per-SoC plumbing:
>    =20
>      - struct tsens_hw_bin_desc names the nvmem cells to read and supplie=
s a
>        compute_hw_version() callback that turns the raw fuse values into =
the
>        hw-version bitfields consumed by the thermal OF parser. A SoC opts=
 in
>        by pointing tsens_plat_data.hw_bin_desc at one of these descriptor=
s;
>        leaving it NULL disables the feature for that SoC.
>    =20
>      - tsens_populate_hw_bin_info() reads the named cells at probe time,
>        invokes the callback, and stashes the result in priv->hw_bin_info.
>        When hw_bin_desc is NULL it is a no-op, so SoCs that do not bin are
>        unaffected.
>    =20
>      - tsens_register() now uses devm_thermal_of_zone_register_with_bin(),
>        passing &priv->hw_bin_info only when a bin was actually read.
>    =20
>     Two descriptors and their SoC wiring are provided:
>    =20
>      - tsens_hw_bin_desc_i_temp reads a single i-temp bit and reports it
>        directly as the hw-bin value; used by data_x1e80100.
>    =20
>      - tsens_hw_bin_desc_qcm6490 reads the jtag-id and feat-id fuses and =
maps
>        the known qcm6490/sc7280 ID pairs to a synthesized hw-bin value (0=
x1
>        for the standard profile, 0x2 for the elevated profile); used by
>        data_sc7280, which serves both the sc7280 and qcm6490 compatibles.
>    =20
>     Register the qcm6490, sc7280 and x1e80100 compatibles in tsens_table.
>    =20
>     Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>     Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>     Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

[Severity: Low]
The commit message states that tsens_hw_bin_desc_i_temp reads a single
i-temp bit and reports it directly as the hw-bin value.

In tsens_compute_hw_version_i_temp(), the single bit (fuse[0] & BIT(0)) is
actually mapped to bitmask values 0x1u for the standard bin or 0x2u for the
high-temp bin:

	/* Single bit: set bit 1 for high-temp bin, bit 0 for standard bin */
	hw[0]  =3D (fuse[0] & BIT(0)) ? 0x2u : 0x1u;

Should the commit message be updated to match what
tsens_compute_hw_version_i_temp() does?

> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index b5ec70201e2f3..9ba6b3c4c133a 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c

[ ... ]

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

> @@ -1425,6 +1601,14 @@ static int tsens_probe(struct platform_device *pde=
v)
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

[Severity: Medium]
How should errors from tsens_populate_hw_bin_info() be handled in
tsens_probe()?

In tsens_populate_hw_bin_info(), when nvmem_cell_read_variable_le_u32()
returns a negative error code, dev_err() is unconditionally called before
returning ret.

When the qfprom nvmem provider has not probed yet,
nvmem_cell_read_variable_le_u32() returns -EPROBE_DEFER. Although
tsens_probe() checks for -EPROBE_DEFER and returns early,
tsens_populate_hw_bin_info() has already logged a dev_err() message on every
deferred probe attempt.

When booting with an older or existing DTB for qcom,x1e80100-tsens or
qcom,sc7280-tsens that omits the optional nvmem-cells property,
nvmem_cell_read_variable_le_u32() returns -ENOENT. That causes
tsens_populate_hw_bin_info() to emit a dev_err() and tsens_probe() to emit a
redundant dev_warn() (which also passes &pdev->dev instead of the resolved
dev pointer).

Conversely, if devm_kmemdup() in tsens_populate_hw_bin_info() fails and
returns -ENOMEM, tsens_probe() only aborts on -EPROBE_DEFER and downgrades
-ENOMEM to the fuse warning instead of failing the probe.

> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index e8376accdff3d..1ebdc6935b794 100644
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

[Severity: Low]
Is the kernel-doc for @cell_names in struct tsens_hw_bin_desc accurate in
saying it is a NULL-terminated array?

In drivers/thermal/qcom/tsens.c, tsens_cells_qcm6490 and tsens_cells_i_temp
are defined without a NULL terminator and initialize .ncells using
ARRAY_SIZE():

static const char * const tsens_cells_qcm6490[] =3D { "jtag-id", "feat-id" =
};
static const char * const tsens_cells_i_temp[]  =3D { "i-temp" };

const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490 =3D {
	.cell_names         =3D tsens_cells_qcm6490,
	.ncells             =3D ARRAY_SIZE(tsens_cells_qcm6490),
	.compute_hw_version =3D tsens_compute_hw_version_qcm6490,
};

Since tsens_populate_hw_bin_info() iterates from 0 to desc->ncells - 1 and
passes desc->cell_names[i] to nvmem_cell_read_variable_le_u32(), adding a
NULL terminator alongside ARRAY_SIZE() would pass a NULL cell_id to
nvmem_cell_read_variable_le_u32(). Should the NULL-terminated wording be
dropped from the comment?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-thermal_bi=
n-v2-0-d76fd073ae98@oss.qualcomm.com?part=3D4

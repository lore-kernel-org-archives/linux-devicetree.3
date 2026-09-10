Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13CF36C5B4
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032914; cv=none; b=neT1o4K6P9SpghD44E3dKGkNqYRUepT7a9WCp8bKVRsDrSqHbzrBBiNkhwciLtOKdUSOEyFb35av+2cfNAyxLkiBmurdDv+fASoq26iIF/thYZkT6r0uKAVIcKSz8uczrA14ZBAy2JI3hFSwF0NpI5N21+/wlO9CxH3AZJI2j1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032914; c=relaxed/simple;
	bh=H0BXrity824CdrnSWHHo+JxTAKF1tP1krJwYkKcmQp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pAkoe4RIrBkx+DB/Qx/3fIpH8gqwbuq0dGTjOXAs4CRklSUMbyrpvqHEGg3mObH3jYYFY7s2YEun3nAcoCB1M2UMBlPUqReXCmELOUHgOCNNhKkJItbkwHN43RRV3wbkdiRGtlA1HFOXW5yZ4+xiPzlrsthIwXUm3OCbqAztVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T14sobBz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T14sobBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF2E1F000FF;
	Thu, 10 Sep 2026 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032912;
	bh=8Nrqvf9ZUOw7Ek+ftup4a1e0+6fM3t6Iq3bdnj7iZjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T14sobBzIzIWI/bDHdIRbvufMwvgHyakiFGYUWzzq4RbZo1m8rnmgHiKwzsfVUktl
	 z4D9XUpEoW9EQkFCjiGTuU/I0FDLooVWiaO7aIi7a7aq6pg13Q5e75WQuDvw6kVD43
	 OFEmcLjJiqvElIgH1NzJoiuoRIIZ5Stc96HCwOxby2lhe9PdNiQ1nTTIGIjiFIR1Od
	 OztFoC4wNGCLdRuxkYWNj/zDOSS9uUddhiaF1yASvUZirCwR3RBcTJqJPpoBSnQdKC
	 1XYCejUFcfnwfDIkW98BBfYYHgJEh+DGLbOn43cLN0blToFwpP5c+m9Hd8sQxuvUFu
	 yOXG8GHrz+KYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] phy: phy-mtk-dp: Add support for digital and
 analog calibration
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260910092038.48291-9-angelogioacchino.delregno@collabora.com>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:35:11 +0000
Message-Id: <20260910093512.1AF2E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Silent ignoring of hardware write failures during PHY initializa=
tion.
- [Medium] False positive error logs emitted when optional eFuse calibratio=
n data is missing.
- [Low] Unused variables left over from refactoring (`dev` and `ret`).
--

commit 7b4b9550381f2fc0574d6e28361a57bed4016c26
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Add support for digital and analog calibration

This commit adds support for reading DP PHY calibration values from eFuse.
If calibration values are present, they are written to the PHY; otherwise,
the driver falls back to default SoC-specific values. It also adds support
for writing the calibration values for the analog part of the PHY.

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy=
-mtk-dp.c
> index 692049f788332..2f4cf52d922c1 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
[ ... ]
> -static int mtk_dp_phy_init(struct phy *phy)
> +static void mtk_dp_phy_set_digital_drv_params(struct mtk_dp_phy *dp_phy)
>  {
> -	struct mtk_dp_phy *dp_phy =3D phy_get_drvdata(phy);
>  	const struct mtk_dp_phy_pdata *pdata =3D dp_phy->pdata;
>  	const u32 reg =3D pdata->regs_dig_lane[DP_PHYD_LAN_DRIVING_PARAM_0];
> -	static const u32 driving_params[] =3D {
[ ... ]
> -	};
>  	int i, ret;

[Severity: Low]
Is `ret` still needed here? The return checks for regmap bulk writes were
removed below, which appears to leave this variable completely unused.

> =20
>  	/*
[ ... ]
> -	for (i =3D 0; i < MTK_DP_PHY_MAX_LANES; i++) {
> -		ret =3D regmap_bulk_write(dp_phy->regmap,
> -					pdata->off_dig_lane[i] + reg,
> -					driving_params,
> -					ARRAY_SIZE(driving_params));
> -		if (ret)
> -			return ret;
> -	};
> +	for (i =3D 0; i < MTK_DP_PHY_MAX_LANES; i++)
> +		regmap_bulk_write(dp_phy->regmap, pdata->off_dig_lane[i] + reg,
> +				  pdata->driving_params,
> +				  ARRAY_SIZE(pdata->driving_params));
> +}

[Severity: Medium]
Does this code introduce a regression by silently ignoring hardware write
failures during PHY initialization?

Prior to this patch, if regmap_bulk_write() failed, the error was propagated
back to the caller. Now that this has been extracted into a void function,
any hardware or bus errors during these bulk writes will be silently droppe=
d.

> +
> +static int mtk_dp_phy_init(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy =3D phy_get_drvdata(phy);
> +	struct device *dev =3D &phy->dev;

[Severity: Low]
Is the `dev` variable used anywhere in this function? It appears to be
declared and assigned but never utilized.

> +
> +	mtk_dp_phy_set_digital_drv_params(dp_phy);
> +	mtk_dp_phy_set_analog_calibration_params(dp_phy);
> =20
>  	return 0;
>  }

[Severity: Medium]
Does the PHY initialization now unconditionally succeed regardless of
the underlying hardware state?

Because the extracted functions mtk_dp_phy_set_digital_drv_params() and
mtk_dp_phy_set_analog_calibration_params() return void, any failures
during regmap updates will not be caught, and this function will always
improperly return 0 on failure.

[ ... ]
> +static int mtk_dp_phy_get_one_cal_para(struct device *dev, const char *n=
ame, u8 max_val)
> +{
> +	u8 buf_byte;
> +	u16 buf;
> +	int ret;
> +
[ ... ]
> +	ret =3D nvmem_cell_read_u8(dev, name, &buf_byte);
> +	if (ret)
> +		ret =3D nvmem_cell_read_u16(dev, name, &buf);
> +	else
> +		buf =3D buf_byte;
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot get calibration data for %s\n",=
 name);

[Severity: Medium]
Will this cause false positive error logs on normal boots?

If an NVMEM cell is missing, the nvmem read functions naturally return
-ENOENT. This dev_err_probe() triggers a KERN_ERR log here before returning
the error to the caller.

> +
> +	if (buf =3D=3D 0) {
[ ... ]
> +static int mtk_dp_phy_get_calibration_data(struct mtk_dp_phy *dp_phy)
> +{
[ ... ]
> +end:
> +	if (ret < 0) {
> +		/*
> +		 * If any of the calibration values is missing, or if there
> +		 * is no calibration at all in the eFuses, copy the default
> +		 * one entirely (as partial values shall not be mixed!)
> +		 */
> +		if (ret =3D=3D -ENOENT) {
> +			dev_info(dev, "Using calibration default values\n");
> +			mtk_dp_phy_get_default_cal_data(dp_phy);
> +			return 0;
> +		}

[Severity: Medium]
Since -ENOENT is explicitly checked and handled gracefully as a benign
fallback here, should we avoid logging it as an error in
mtk_dp_phy_get_one_cal_para() earlier?

Logging an expected missing cell as an error falsely spams the kernel dmesg
with an error trace for boards that legitimately omit calibration data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910092038.4829=
1-1-angelogioacchino.delregno@collabora.com?part=3D8

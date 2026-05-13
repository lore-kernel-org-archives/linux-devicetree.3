Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CA3A426D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702228; cv=none; b=OxetORlopnTT0ETv7vc13hQj+EATm/jouddxhiTknXUQUZvkbw1XGKFjyVQvsOMANE4LnyijuxFEL/s3w3nuXRcNbb4ck75d7udMH7E5LF1H+k8xq7M3GXT2cejSyxc2SvahwIN9n/ntw9YkRuHIoBpLrK1xzh6VRX2g0ce8eXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702228; c=relaxed/simple;
	bh=n3VoEN+WVSSI10xYwaK8/8R5tJdt64IjR6WKw+v/Y3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tyoF9VP4ND9Fo4Icp/ra3c6ZbO/Y10xR46GQ4XzsQa623EpxmRDSPbvUcX5ecXVOWEM+AhtpPShIWAJJCMzmCKqIuwSFHvMVxBzPR63InhEle8kCpCTRrG4Sq+k0wnYBVkJ0kXxkklmdF64XeQ1JLUJ+Gn64SK9ENEgtIpdSqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DE9HXdjH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DE9HXdjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CD0C19425;
	Wed, 13 May 2026 19:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778702228;
	bh=n3VoEN+WVSSI10xYwaK8/8R5tJdt64IjR6WKw+v/Y3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DE9HXdjHaaFqOqqXoX0u9noEnpGX9uI0nUGA2GIGMwvsVuABkRumd+ULNBfXcRxhB
	 hPt9uwNZMIKbZNoBG8uBf7Kg9fKmZgrUWJeix8fzFtiaGUWyystmIwmK6Z5FlM1oRF
	 YzShKfWfz9NTC5RPn5AVskIya5YafbyPnaqrb+LugXIcL1vZc3NnjcRdC2uXlKSvF4
	 UvuWkKih+RfCqnLhiqNd2gwc0l485zwcZdTEBIT4B41Gfv6kKwcrLvZzx1tp/vNbk+
	 O/38ZnxtiyvzNQPQEi2xQMTN0XQob+q4FoAOFNNBQArWcXRR9rDSPjbxGCOqTGdt4d
	 j1wxPo9CJB3FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/16] thermal: mediatek: add PMIC thermal support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 19:57:07 +0000
Message-Id: <20260513195708.07CD0C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect error handling logic prevents the use of default calibra=
tion values and masks fatal hardware errors.
- [High] MT6323_TEMP_MAX is capped at 50=C2=B0C, causing valid high tempera=
tures to be discarded and breaking thermal mitigation.
- [High] Signed integer overflow in temperature calculation results in wild=
ly negative temperatures under load.
- [High] Missing NULL check for the result of `device_get_match_data()` lea=
ds to a potential kernel panic on probe.
- [High] Missing Kconfig dependencies on the IIO subsystem.
- [Medium] NVMEM byte stream is incorrectly cast directly to a `u16` array,=
 causing Big Endian read failures.
--

commit 7a6cbdb919c201e8e0890350ae5a7b867cecd588
Author: Roman Vivchar <rva333@protonmail.com>

thermal: mediatek: add PMIC thermal support

Add a new driver to support thermal monitoring on MediaTek PMICs, which
retrieves calibration data from EFUSE and registers with the thermal framew=
ork.

> diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/=
Kconfig
> index d82c86d9be563..8320d109fde68 100644
> --- a/drivers/thermal/mediatek/Kconfig
> +++ b/drivers/thermal/mediatek/Kconfig
> @@ -34,4 +34,16 @@ config MTK_LVTS_THERMAL_DEBUGFS
>         help
>           Enable this option to debug the internals of the device driver.
> =20
> +config MTK_PMIC_THERMAL
> +	tristate "AUXADC temperature sensor driver for MediaTek PMICs"
> +	depends on MFD_MT6397

Should this also depend on IIO?

If the thermal driver is compiled as built-in (CONFIG_MTK_PMIC_THERMAL=3Dy)
while IIO is compiled as a module (CONFIG_IIO=3Dm), could the kernel build
fail during linking with unresolved symbols?

> +	help
> +	  Enable this option if you want to get PMIC temperature

[ ... ]

> diff --git a/drivers/thermal/mediatek/mtk_pmic_thermal.c b/drivers/therma=
l/mediatek/mtk_pmic_thermal.c
> new file mode 100644
> index 0000000000000..f644dad15fc2f
> --- /dev/null
> +++ b/drivers/thermal/mediatek/mtk_pmic_thermal.c
> @@ -0,0 +1,316 @@

[ ... ]

> +#define MAX_SENSORS			1
> +
> +#define MT6323_TEMP_MIN			(-20 * MILLIDEGREE_PER_DEGREE)
> +#define MT6323_TEMP_MAX			(50 * MILLIDEGREE_PER_DEGREE)

Is 50 degrees Celsius the intended maximum limit for MT6323_TEMP_MAX?

PMICs routinely operate well above 50 degrees under normal load, and thermal
mitigation trip points are typically set above 105 degrees.

Could this cap cause the driver to return -EINVAL for valid high temperatur=
es,
effectively hiding overheating from the thermal subsystem?

[ ... ]

> +static int mtk_pmic_read_temp(struct thermal_zone_device *tz, int *tempe=
rature)
> +{
> +	struct mtk_pmic_sensor *sensor =3D thermal_zone_device_priv(tz);
> +	int ret, raw, temp;
> +
> +	ret =3D iio_read_channel_processed(sensor->adc_channel, &raw);
> +	if (ret < 0) {
> +		dev_err(sensor->mt->dev, "failed to read iio channel: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 *                 slope1 * V
> +	 * t =3D Intercept + ----------
> +	 *                   slope2
> +	 */
> +	temp =3D sensor->mt->t_intercept +
> +	       (sensor->mt->t_slope1 * raw) / sensor->mt->t_slope2;

Can the multiplication of mt->t_slope1 and raw overflow the signed 32-bit
integer here?

mt->t_slope1 is initialized to 100,000, and raw comes from an AUXADC
with a resolution up to 32,767. Any raw value exceeding 21,474 will
cause the multiplication to exceed 2,147,483,647.

Would it be better to use a 64-bit cast, such as div_s64(), to avoid
returning wrapped negative temperatures when the device is under load?

> +
> +	if (!mtk_pmic_thermal_temp_is_valid(temp))
> +		return -EINVAL;
> +
> +	*temperature =3D temp;
> +	return 0;
> +}

[ ... ]

> +static int mtk_pmic_thermal_extract_efuse_mt6323(struct mtk_pmic_thermal=
 *mt,
> +						 u16 *buf)
> +{
> +	u32 reg;
> +	s32 vts, degc_cali, o_slope, o_slope_sign, id;
> +	int ret;
> +
> +	if (!FIELD_GET(CALIB_BUF0_ADC_CALI_EN_MASK, buf[0]))

Does buf need to be parsed with endian-safe helpers?

Since nvmem_cell_read() returns an opaque byte stream buffer, treating it
directly as a u16 array relies on the CPU byte order. On a big-endian kerne=
l,
could this swap the bytes within each 16-bit word and corrupt the
calibration data?

> +		return -EINVAL;
> +
> +	/* Voltage offset */

[ ... ]

> +static int mtk_pmic_thermal_get_calib_data(struct device *dev,
> +					   struct mtk_pmic_thermal *mt)
> +{
> +	void *buf __free(kfree) =3D NULL;
> +	struct nvmem_cell *cell;
> +	size_t len;
> +	int ret;
> +
> +	cell =3D nvmem_cell_get(dev, NULL);
> +	if (IS_ERR(cell))
> +		return PTR_ERR(cell);

Does returning here bypass the fallback logic for uncalibrated devices?

If nvmem_cell_get() returns -ENOENT because the nvmem-cells property is
legitimately missing from the device tree, the probe is aborted before
applying the default calibration values.

> +
> +	buf =3D nvmem_cell_read(cell, &len);
> +	nvmem_cell_put(cell);
> +
> +	if (IS_ERR(buf)) {
> +		ret =3D PTR_ERR(buf);
> +		buf =3D NULL;
> +		return ret;
> +	}
> +
> +	if (len < 2 * sizeof(u16)) {
> +		dev_err(dev, "invalid calibration data length\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D mt->data->extract_efuse(mt, buf);
> +	if (ret) {
> +		dev_info(dev, "device not calibrated, using default values\n");

Conversely, if extract_efuse() encounters a hardware communication error
or an invalid chip ID, will this incorrectly mask the hardware error as
"device not calibrated"?

This might cause the driver to register the thermal zone using default valu=
es
on unresponsive hardware.

> +		mt->data->precalc(mt, MT6323_DEFAULT_VTS,
> +				  MT6323_DEFAULT_DEGC_CALI,
> +				  MT6323_DEFAULT_SLOPE,
> +				  MT6323_DEFAULT_SLOPE_SIGN);
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int mtk_pmic_thermal_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mtk_pmic_thermal *mt;
> +	int ret;
> +
> +	mt =3D devm_kzalloc(dev, sizeof(*mt), GFP_KERNEL);
> +	if (!mt)
> +		return -ENOMEM;
> +
> +	mt->regmap =3D dev_get_regmap(dev->parent->parent, NULL);
> +	if (!mt->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap");
> +
> +	mt->dev =3D dev;
> +	mt->data =3D device_get_match_data(dev);

Should mt->data be checked for NULL?

If the driver is bound to the MFD cell purely by platform name (e.g., if
the MFD core does not pass an of_node to the cell), device_get_match_data()
will return NULL.

> +
> +	ret =3D mtk_pmic_thermal_get_calib_data(dev, mt);

If mt->data is NULL, calling mtk_pmic_thermal_get_calib_data() will
dereference a NULL pointer when it attempts to call
mt->data->extract_efuse(mt, buf).

> +	if (ret)
> +		return ret;
> +
> +	for (int i =3D 0; i < mt->data->num_sensors; i++) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-mt6323-v2-=
0-3efcba579e88@protonmail.com?part=3D7

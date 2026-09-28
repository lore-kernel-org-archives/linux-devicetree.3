Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9331D757
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571228; cv=none; b=lUtsQ/I1MPYkyl2qUFBVKIod7PymqPC89hpt8t/vQ5SKoXXyVCy1BKwd6br39mMehwvFSqGfJXN2dZhYY7vwxmx3tqwQXl8YZJdfqT/uZzZeB4j/bSsqoEOspL18RsbPRC+dK+J9bPi7sr5cKrN8O5PpSCttmWQ0gORPbGfveWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571228; c=relaxed/simple;
	bh=CqK9PKZiDVMg6AYDWZt0s9pgSWnJpiA9LJR5jIrd7Io=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uUSiqmKzi6lAWAjLuwGnIZc/FBahhbn25QNlk/WLbczOhuyNlBHSJNCueblY6cd5oP+Mxdhs8Qxt6G8HB5MArZPWzZEg8ym8C/kroEDfok0bE1RYzBm095r7G7+Mzi03i+8tKoOPO8Zia9S+o4g7pbD7qas1UA878CnGewGXP/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cv8nd1+a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cv8nd1+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8D41F000FF;
	Mon, 28 Sep 2026 04:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790571227;
	bh=90nxe4bH1DqxJINReDETEU86JgwNPh3hsWY1QIlMsuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cv8nd1+ac3KlMBrn16mPzlBBOjb5MRtA4mg8jzUNROgQMj/lB6uqfW7kcPcbJO4rz
	 Wr2LbG13kV9Uh06qiVUXCHsi0NKP6L/i6wUSHpwei2NpHSABOuMZKZc1rriXHfPfGq
	 poURJHrii76vVXGsqN1DePClTZFn6jD+T2fx9H4z6S3mIw5bh01eAdPj0DPVNdheYG
	 Sm267cz2pLHH8womMtOFwJbZa+UfGzQrf2IWSYX4+s5NbheneULiTPfrwpX9JQcLHS
	 BklBVYXhDtdpgICDhXjDIrwcCGjbL+6TGH4JxqBhOrlu/emsF62/ubhCcN36z0mm1I
	 c+g8emgY4ADNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] thermal/drivers/loongson2: Add Loongson-2K0300
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <549b204c1621341edc5b4aa4f81e164ec5ce7fed.1790561983.git.zhoubinbin@loongson.cn>
References: <cover.1790561983.git.zhoubinbin@loongson.cn>
 <549b204c1621341edc5b4aa4f81e164ec5ce7fed.1790561983.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 04:53:46 +0000
Message-Id: <20260928045347.0B8D41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] thermal/loongson2: hardware race in ADC initialization triggers =
false fallback
- [Medium] thermal/loongson2: missing sign bit check for ID0 calibration da=
ta
--

commit 0cea5de8d422086175b271d663470bc3da490430
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Add Loongson-2K0300 support
   =20
This commit adds support for the Loongson-2K0300 thermal sensor by reading
calibration offsets from syscon, initializing the sensor, and calculating
the temperature. It also includes logic to detect early fuse revisions and
fall back to an older calibration formula if the initial reading is out of
bounds.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 17aa1d80a2e67..a53d70b824f32 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
[ ... ]
> +static int ls2k0300_thermal_read_calib(struct loongson2_thermal_data *da=
ta)
> +{
> +	u32 chip_id0, chip_id1;
> +	int calib_data, calib_offset, ret;
> +
> +	ret =3D regmap_read(data->regmap_cfg, LS2K0300_CHIP_ID0, &chip_id0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(data->regmap_cfg, LS2K0300_CHIP_ID1, &chip_id1);
> +	if (ret)
> +		return ret;
> +
> +	if (chip_id0 & LS2K0300_EXTERN_ID) {
> +		calib_data =3D FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id1);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +		if (calib_data & LS2K0300_COMP_SIGN_BIT)
> +			calib_offset =3D -calib_offset;
> +	} else {
> +		calib_data =3D FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id0);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +	}

[Severity: Medium]
Is there a missing sign bit check for the chip_id0 branch?

The chip_id1 branch explicitly checks LS2K0300_COMP_SIGN_BIT to negate the
offset, but the chip_id0 branch does not. Furthermore, the extracted=20
LS2K0300_ID0_VAL_MASK is 12 bits, but it is masked against=20
LS2K0300_COMP_VAL_MASK which is 15 bits.=20

Could negative calibration offsets provided via chip_id0 be incorrectly=20
treated as large positive offsets, leading to completely wrong temperature=
=20
readings?

> +
> +	data->calib_offset =3D calib_offset;
> +	return 0;
> +}
> +
> +static int ls2k0300_thermal_init_extend_resource(struct platform_device =
*pdev,
> +						 struct loongson2_thermal_data *data)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	data->regmap_cfg =3D
> +		syscon_regmap_lookup_by_phandle(dev->of_node, "loongson,chipid");
> +	if (IS_ERR(data->regmap_cfg))
> +		return PTR_ERR(data->regmap_cfg);
> +
> +	ret =3D ls2k0300_thermal_read_calib(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read calibration data\n");
> +
> +	writel(LS2K0300_THSENS_INIT_MASK, data->ctrl_reg + LS2K0300_THSENS_CFG_=
REG);
> +
> +	ls2k0300_thermal_detect_old_fuse(dev, data);

[Severity: Medium]
Could this trigger a false fallback to the old fuse formula due to a hardwa=
re
initialization race?

Here, the sensor is initialized by writing LS2K0300_THSENS_INIT_MASK to the
configuration register. Immediately after, ls2k0300_thermal_detect_old_fuse=
()=20
is called, which reads the ADC value via ls2k0300_adc_to_temp_mc() without =
any
readiness poll or sleep delay.

If the hardware ADC requires time to complete its first conversion after be=
ing
configured, this immediate read might yield an artificially low or invalid
temperature. This would cause the out-of-bounds check in=20
ls2k0300_thermal_detect_old_fuse() to fail, permanently falling back to the=
=20
incorrect old fuse formula.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790561983.gi=
t.zhoubinbin@loongson.cn?part=3D7

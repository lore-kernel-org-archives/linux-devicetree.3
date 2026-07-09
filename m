Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BFF39903B
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595064; cv=none; b=pr1CdiqRb/1ZWIcTTTGmzTL2MeEbKOn+drr+LzW9WtDIbj2Hjp0Ah30wSs5Q/ldlO05RIaqbHB///qyrfO9acMKvCwG89e3ytSIoVnL3u0rUiSyep7efPjHgzVtRGnHrx4U4vUOgHJupqMUwsLaLFJ8K0uVe1DjkMzxMN1gxcok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595064; c=relaxed/simple;
	bh=OAnB/uxq3n37O1XZq5uxn4BPSPHaydgo81l3/xWjfRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=th5nuwNxMSuNjTYn6LUAzMZJ3Nkbb8yvMPj5RlIlhRlxNF5TNvNYIv+irKq/v0qcaLxuQgat/UcMwlDX1v2F9JTv+l1qcD9S4EwsaQPjQYV14pp5t1H5Gb9QMnCJPpBj67NgE+JaUSLYLUxg59u6no3wBs7dq3SFgyQMt4uEb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnjQjaEv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnjQjaEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527111F000E9;
	Thu,  9 Jul 2026 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783595062;
	bh=FtiAC6i1ZIu8X5H0QMqRI+Z0a5YkJDGVBOO4rf5VRxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnjQjaEvHmdkMnZ8l67n+/X45XLpvuKazmvnbFbDWisDgaj/oz6O22IjTRs5kVs5s
	 icyMF58zK1Gy/EkfaFSQfgcqNutJ3+zSXUe6SFE8mMmrsP9LNprHUftFiNdsmURudF
	 +yam/PX17lg7Oc0snDLIVOuUGMBwFZWNsikNt3bWfp4XMxWhvRK9PeuED6249kRAGH
	 4xMklkFpNIx3oKDQzJ7+G5u4u+pbDLi9jHsM44RDaRwazVu3qYuHINY/Ou0cbG90BO
	 QhLICdnJYdWQHodc9KgCH6y1ILIekIJePvy+ubuZALlkM5neJCEGcnLtS8Qi2cDXGu
	 qE/8MmjtqXxtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-mt6323-adc-v5-3-d11b8332a735@protonmail.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
 <20260709-mt6323-adc-v5-3-d11b8332a735@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:04:21 +0000
Message-Id: <20260709110422.527111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The AUXADC clock is explicitly powered down instead of being enabl=
ed during initialization, resulting in a dead IP block.
- [Medium] The child driver directly accesses the grandparent's regmap inst=
ead of retrieving it via standard MFD parent data accessors, violating API =
contracts and risking a NULL pointer dereference.
- [Medium] The AUXADC request and release functions fail to clean up partia=
lly acquired hardware state if an intermediate register write fails.
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.
--

--- Patch [3]: [PATCH v5 3/4] mfd: mt6397-core: add mt6323 AUXADC support -=
--
commit 7593019cba73d4a6a4b6233e95fc0594442ed409
Author: Roman Vivchar <rva333@protonmail.com>

mfd: mt6397-core: add mt6323 AUXADC support
   =20
The mt6323 PMIC includes an AUXADC. Register the AUXADC in the mt6323
devices array to allow the corresponding driver to probe using compatible
string.

> mfd: mt6397-core: add mt6323 AUXADC support

[Severity: Low]
This isn't a bug, but the commit message description is not capitalized,
violating MFD subsystem guidelines.

> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-aux=
adc.c
> new file mode 100644
> index 0000000000000..c450fb6f09cb5
> --- /dev/null
> +++ b/drivers/iio/adc/mt6323-auxadc.c

[ ... ]

> +static int mt6323_auxadc_request(struct mt6323_auxadc *auxadc,
> +				 unsigned long channel)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));

[Severity: Medium]
Could this leave the voltage buffer enabled indefinitely if setting the
channel bit fails? There appears to be no rollback for AUXADC_CON11_VBUF_EN
when the second register write returns an error.

> +}
> +
> +static int mt6323_auxadc_release(struct mt6323_auxadc *auxadc,
> +				 unsigned long channel)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_clear_bits(map, MT6323_AUXADC_CON22, BIT(channel));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN=
);

[Severity: Medium]
If clearing the channel bit fails here, will this prevent AUXADC_CON11_VBUF=
_EN
from being cleared and leave the hardware in an inconsistent state?

[ ... ]

> +static int mt6323_auxadc_init(struct mt6323_auxadc *auxadc)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_STRUP_CON10,
> +			      AUXADC_STRUP_CON10_RSTB_SW |
> +			      AUXADC_STRUP_CON10_RSTB_SEL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_TOP_CKPDN2, AUXADC_TOP_CKPDN2_CTL_C=
K);

[Severity: High]
Is this actually powering down the AUXADC clock instead of enabling it?

In MediaTek PMICs, CKPDN registers control clock power down. Setting this
bit to 1 explicitly powers down the clock, which would render the AUXADC
IP block non-functional. Should this be using regmap_clear_bits() instead?

> +	if (ret)
> +		return ret;

[ ... ]

> +static int mt6323_auxadc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mt6323_auxadc *auxadc;
> +	struct regmap *regmap;
> +	struct iio_dev *iio;
> +	int ret;
> +
> +	regmap =3D dev_get_regmap(dev->parent->parent, NULL);

[Severity: Medium]
Is it safe to directly access dev->parent->parent here?

If the device tree topology changes or the parent device does not have a
parent, dev->parent->parent will evaluate to NULL. Calling dev_get_regmap()
with a NULL device would then trigger a NULL pointer dereference.

The MFD subsystem guidelines state that child drivers must retrieve parent =
data
using standard APIs like dev_get_drvdata(pdev->dev.parent) instead of bypas=
sing
the parent to access the grandparent directly.

> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt6323-adc=
-v5-0-d11b8332a735@protonmail.com?part=3D3

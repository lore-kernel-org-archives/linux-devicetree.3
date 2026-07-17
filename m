Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E69242CAE9
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300051; cv=none; b=ch0HekVWNYVyMfb21aC8yoht146AaCGNp++3aHYTVAj/AvMWqRBkCPrOILJqd/jKCGd7P77+nMhIkWJQpFIY2Tp+VGBlPc5G/Nq4Wx4lAQfBx/pLk3TbnS5dO0C0uRBYIUIfKIcVmdXTKLNZ97NxZ+pWUfIXSE9yXPg7n//2wPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300051; c=relaxed/simple;
	bh=LrgXqftk3akNQcomGYqS6PHGjYp4aL0Lmpd34N/NNNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B/wThf8J6WtmAdZzsg7JW/+pTvF5pYzefSYDFZsedVuPVgQAzwdrTXtUVm+Fu7JTA+Nd4RehP3b/cHdkvbN4nXeUIBJe9LUgZz9e1O240e+uXGy7rnmavUarPWt5T/bUG6sU9R/OTRrAA06UhUW+Tsplhu5fk0OS+Z7mHJ1CAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crkKUGTa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crkKUGTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99A01F00A3A;
	Fri, 17 Jul 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784300049;
	bh=02kJ4NP9eTZJ6Uals0gvjYtOqN45NETaAlJ4bNyYvIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crkKUGTaN7dfN8iQ7E7VV2ISBqlibsy3FwhvJV721hWnudQ3KqKNbEV6r/5+ZM0bm
	 IaxYNM08hsu1mAzLQ/GlWVjZe9ZCGtStBiKn51QwS+Utg7e8eHP5/s98meXTJi1nQS
	 K6A6h0mDfBrvum2lqPa5v5iBlEf3TlVHFvU3lG6o24ZwG61o7o/SCW4WXUvLPrLom7
	 KsKYsN568Ht3Ovxp6Z6PBixUFCa9zoBan93kKdX01laLW/EE7TEu0Vef9hLRSkb+0K
	 uSKne3NGfKFFs9+H2ClNZDeZEIn5P2d79flfq0D1jdxi1/6tjJV+A8ASf99wYI5+LU
	 mHk8acETkT99Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] mfd: axp20x-i2c: Fix i2c instantiation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-axp318-regulator-v4-4-50aff97084dd@baylibre.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
 <20260717-axp318-regulator-v4-4-50aff97084dd@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 14:54:08 +0000
Message-Id: <20260717145408.C99A01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing Error Handling / API Ambiguity causing unmatched devices t=
o probe as AXP152.
- [High] MFD subsystem guideline violation: Hard-coded IDs used in mfd_cell=
 array instead of PLATFORM_DEVID_AUTO.
--

--- Patch [4]: [PATCH v4 4/5] mfd: axp20x-i2c: Fix i2c instantiation ---
commit df6eff33eb956b610bd8100dff8a5beb1887390f
Author: Jerome Brunet <jbrunet@baylibre.com>

mfd: axp20x-i2c: Fix i2c instantiation

This patch fixes I2C instantiation for the AXP20X driver by moving the
variant matching directly into the bus-specific probes. It also adds support
for the AXP323 device.

Link: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org

> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 4e4ebfc78525c..64c212b76e5e6 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>  	axp20x->irq =3D i2c->irq;
>  	dev_set_drvdata(axp20x->dev, axp20x);
> =20
> +	axp20x->variant =3D (kernel_ulong_t)i2c_get_match_data(i2c);

[Severity: High]
This isn't a bug introduced by this patch, but because AXP152_ID is defined
as 0, a match failure returning NULL is indistinguishable from a successful
AXP152 match.

Since the driver blindly defaults to AXP152_ID on NULL, it could configure
an unrelated device as an AXP152 PMIC if forced via a sysfs bind. Writing
PMIC configurations to an unrelated I2C device can result in hardware
damage or system crashes.

Should the variant IDs be updated to start from 1 to allow unambiguous
error checking?

>  	ret =3D axp20x_match_device(axp20x);
>  	if (ret)
>  		return ret;

[ ... ]

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 2bbe73afff435..25509e47bedc8 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1339,7 +1339,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  	const struct mfd_cell *cells_no_irq =3D NULL;
>  	int nr_cells_no_irq =3D 0;
> =20
> -	axp20x->variant =3D (long)device_get_match_data(dev);
>  	switch (axp20x->variant) {
>  	case AXP152_ID:
>  		axp20x->nr_cells =3D ARRAY_SIZE(axp152_cells);

[Severity: High]
This is a pre-existing issue, but there are hard-coded IDs used in the
mfd_cell arrays defined in this file:

drivers/mfd/axp20x.c:axp806_cells[] =3D {
	{
		.id		=3D 2,
		.name		=3D "axp20x-regulator",
	},
};

Using hard-coded IDs in the mfd_cell array bypasses standard subsystem
indexing. This can lead to device naming collisions in sysfs and driver
load failures. A regulator driver load failure here could cause critical
power domains to remain uninitialized, leading to an unusable system.

Would it be possible to use PLATFORM_DEVID_AUTO in mfd_add_devices and
avoid hard-coded id fields in the mfd_cell arrays?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-axp318-reg=
ulator-v4-0-50aff97084dd@baylibre.com?part=3D4

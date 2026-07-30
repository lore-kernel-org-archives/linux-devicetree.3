Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B178939AD39
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 20:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785442693; cv=none; b=lSB0e+sWy3X9cKviAgG3Hb0Y34AYDFHVh7MC4I0IOIqyhM41sT7S1IDu80HMto4kUMrLwEdDhk/Us1GdZAWhehPXSogpVZy2D0PQ5nwdarFDIxNNiDHtMGm6RipYxkaYoaLV/CEkw/ivVBQZ43MM/8Xnm4wdOshRWm307ObWxhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785442693; c=relaxed/simple;
	bh=VZMWQcZCyFjZey+gFBatOJI0W/82QLdJHjzTWrvTAx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K2b0nG4sacTOrYjUqA/JMURh7XDo2nCHMge9kUTB4cUmHUHiBwpjQS6oSs0unDKJerucxyPHe0gmTSmkdLsHUROgTYBzWEBLDKhdbShX8DzIGl2HWL1Ocx+n0p4jCWkqYJ+mAGd5wnLgM8DDwAtMdFtUuFuk14aBQ/Hh/NhL9gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4oV1i8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4oV1i8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EB81F000E9;
	Thu, 30 Jul 2026 20:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785442691;
	bh=JeM7tlvF0atyZAFuDvrAqK3kxAZeXFz1qyBmXCXBbmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4oV1i8tpWZTS/Uwro6gxpwd1lUJYo+IhzSAmuBqqDE1/Mgo1zhaIWO9VKr00RYf6
	 KzxTQYplX4KPbwZP0zORPSZlM4xnMYPTQRUYMpKAysvWooKI7/TOcuEe+ELMmL7eDR
	 bJy3XBHW+Mt8oBCSO6BScwhS34LXrtblKlKPdoEfoSOgQouAbv7BtyORYT1pArX9WO
	 d2I8q5FL5FgGvS5elioA5aRn5cA66X6R3g0Ie4LudSFime2kfSskj0VL9iAgqMjEJ0
	 wKeCdfsMjjVQJF/T9M8pOjFP9Bp/zypZ+nwhHm9wqmlbvCZdX+4wysWQ18LINTF0w3
	 j6anrdfxGau8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-gp2ap070s-v3-2-d1f5cecf9fe7@disroot.org>
References: <20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org>
 <20260731-gp2ap070s-v3-2-d1f5cecf9fe7@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 20:18:10 +0000
Message-Id: <20260730201810.F0EB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] Double execution of hardware reset on probe error paths.
- [Medium] Meaningless regcache operations due to missing .cache_type, and =
incorrect volatile register definition.
- [Medium] Silent probe failure on IRQ request error.
- [Medium] write_event_value callback incorrectly returns IIO_VAL_INT on su=
ccess.
- [Medium] Unconditional enablement of hardware events at probe.
- [Medium] Missing PM suspend/resume operations leaves the sensor active du=
ring system sleep.
--

--- Patch [2]: [PATCH v3 2/3] iio: proximity: add driver for Sharp GP2AP070=
S proximity sensor ---
commit 804bae46d93961c6260dcd9dc62d6687c6acc1bf
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

    iio: proximity: add driver for Sharp GP2AP070S proximity sensor

This commit introduces a new IIO proximity driver for the Sharp GP2AP070S s=
ensor.
It sets up regmap-based I2C communication and configures IIO events and cha=
nnels
for reading proximity data.

Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/bl=
ob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]

> diff --git a/drivers/iio/proximity/gp2ap070s.c b/drivers/iio/proximity/gp=
2ap070s.c
> new file mode 100644
> index 0000000000000..98fc12e5ccd58
> --- /dev/null
> +++ b/drivers/iio/proximity/gp2ap070s.c
[ ... ]
> +static bool gp2ap070s_regmap_volatile(struct device *dev, unsigned int r=
eg)
> +{
> +	return reg =3D=3D GP2AP070S_REG_D0_LE16;
> +}
> +
> +static const struct regmap_config gp2ap070s_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.volatile_reg =3D gp2ap070s_regmap_volatile,
> +};

[Severity: Medium]
Does this regmap configuration intend to use caching?=20

The driver calls regcache_mark_dirty() during gp2ap070s_reset(), but
gp2ap070s_regmap_config lacks a .cache_type assignment, so the regmap core
will bypass caching entirely.=20

If caching is enabled in the future, will the current volatile_reg definiti=
on
cause data corruption? gp2ap070s_regmap_volatile() only marks 0x90 as volat=
ile,
but a 16-bit value is read spanning 0x90 and 0x91. The upper byte (0x91) wo=
uld
incorrectly be served from the cache, corrupting the proximity reading.

[ ... ]
> +static int gp2ap070s_iio_write_event_value(struct iio_dev *indio_dev,
> +					   const struct iio_chan_spec *chan,
> +					   enum iio_event_type type,
> +					   enum iio_event_direction dir,
> +					   enum iio_event_info info, int val,
> +					   int val2)
> +{
> +	struct gp2ap070s_drvdata *drvdata =3D iio_priv(indio_dev);
> +	__le16 value;
> +	u16 threshold_other;
> +	int ret;
[ ... ]
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
[ ... ]
> +		value =3D cpu_to_le16((u16)val);
> +		ret =3D regmap_bulk_write(drvdata->regmap,
> +					GP2AP070S_REG_PS_THD_HI_LE16, &value,
> +					sizeof(value));
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;

[Severity: Medium]
Should this return 0 instead of IIO_VAL_INT?

The IIO ABI requires write_event_value callbacks to return 0 on success.
IIO_VAL_INT is only meant for read_event_value to describe the returned data
type. Returning it here may break IIO consumers.

> +	case IIO_EV_DIR_FALLING:
[ ... ]
> +		value =3D cpu_to_le16((u16)val);
> +		ret =3D regmap_bulk_write(drvdata->regmap,
> +					GP2AP070S_REG_PS_THD_LO_LE16, &value,
> +					sizeof(value));
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;

[Severity: Medium]
This also appears to incorrectly return IIO_VAL_INT instead of 0 on success.

[ ... ]
> +static int gp2ap070s_probe_hw_register(struct gp2ap070s_drvdata *drvdata)
> +{
> +	struct device *dev =3D regmap_get_device(drvdata->regmap);
> +	int ret;
> +
> +	ret =3D gp2ap070s_reset(drvdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to reset sensor\n");
> +
> +	ret =3D regmap_write(drvdata->regmap, GP2AP070S_REG_COM2, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable interrupts\n");
> +
> +	ret =3D regmap_set_bits(drvdata->regmap, GP2AP070S_REG_COM3,
> +			      GP2AP070S_COM3_INT_PULSE);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to unmask interrupts\n");

[Severity: Medium]
Does this unconditionally enable hardware interrupts at probe?

The IIO ABI specifies that events should be disabled by default and only
enabled when requested via sysfs by userspace. Enabling them unconditionall=
y at
probe might cause unexpected system wakeups or interrupt load.

[ ... ]
> +static int gp2ap070s_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D gp2ap070s_probe_hw_register(drvdata);
> +	if (ret)
> +		goto hw_reset;
> +
> +	ret =3D devm_add_action_or_reset(dev, gp2ap070s_reset_action, drvdata);
> +	if (ret) {
> +		ret =3D dev_err_probe(dev, ret, "Failed to schedule reset on driver re=
moval\n");
> +		goto hw_reset;
> +	}
> +
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
> +					"gp2ap070s-irq", indio_dev);
> +	if (ret)
> +		goto hw_reset;

[Severity: Medium]
Is it intentional that devm_request_threaded_irq() failure is silent?

If the requested interrupt is missing in the Device Tree or fails to be
requested, the driver fails to load without leaving any diagnostic messages=
 in
the kernel log. This should likely use dev_err_probe().

> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		goto hw_reset;
> +
> +	return 0;
> +
> +hw_reset:
> +	gp2ap070s_reset(drvdata);

[Severity: Medium]
Will this cause a double execution of the hardware reset on probe error pat=
hs?

If devm_add_action_or_reset() succeeds, but a subsequent step like
devm_request_threaded_irq() fails, the code manually jumps to hw_reset and
calls gp2ap070s_reset().=20

When the probe function then returns the error code, the devres framework w=
ill
unwind and automatically invoke gp2ap070s_reset_action(), which calls
gp2ap070s_reset() a second time.

> +
> +	return ret;
> +}
[ ... ]
> +static struct i2c_driver gp2ap070s_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "gp2ap070s",
> +		.of_match_table =3D gp2ap070s_of_device_id,
> +	},
> +	.probe =3D gp2ap070s_probe,
> +	.id_table =3D gp2ap070s_i2c_device_id,
> +};
> +module_i2c_driver(gp2ap070s_i2c_driver);

[Severity: Medium]
Is this driver missing power management suspend and resume operations?

Without a .pm structure to handle suspend/resume, the kernel cannot disable
the sensor or its regulators when the system enters suspend, which could
lead to power drain or spurious interrupts during system sleep.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-gp2ap070s-=
v3-0-d1f5cecf9fe7@disroot.org?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C834A796
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780161918; cv=none; b=rdZ9RsNJHxP1VHHHaph3JoDZNb7kGbGwTddhR7Iqt8A5brkmx02y+5GJG8PXyJyMroe/K0oJkb1mERLemkkLMwsr3S4MF7Uxaa8hrm05t+bDPaToaIYbcbKatCJBe5IiWeYi/Bmd5kudBVbec7hcnFcfFAcpNoU+fczjbeuw1eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780161918; c=relaxed/simple;
	bh=AGEqD40v4VOXh1FEzQTKB0IRq8S/WiCqnE45ii/Z4b8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gS8FNkRc5wDvd4QzMGcdnhQKAaI3CichCSv7v3qp/Oo7meACq5nUPC6wUdF1A/FJWVpeu0ielNDSUukKMKvex89glcjZlr6Jsf0d1gvoPTYw/AQ0x4pMu/n+jicAVmE8+LxEDqmQxb0SXu0hbQ8oc5pGYiYNEoIWXQxrQz91GlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3JuRSLp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3JuRSLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7291F00898;
	Sat, 30 May 2026 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780161917;
	bh=XPCjjhoJ+sbMsJ/K7tpvp1vmYNKuVhqKLB4zs9qDt9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3JuRSLpMbpgoJFangYg5XDEnvq8d8Vc1CO6/JOondUUabox41hGMoNXkT7wCx1Us
	 SrW/2MdzqvNGHJ7ukcTbTpXYkS6/PZL6sRmMuOIXD9SP3Wo3eSS1FSJpLOryzb4npL
	 m/d8NvI5qlYvySYgCHhhl9QK+di0MdhZM0rIvpNfJav4EA40gXc1b+H12Oe7nO1W9t
	 fdVmTsCfHYV0ENKTeGM9QLE3rkCTfGv9S0VUTxtM8wg5fntALuWLyL0cD/i05cmgsU
	 937EU+9sYIy2MhpolMFWjD98IOEjQfAyUZLz+7v+06I38ws9mjiyKYB+CIBQ+qFDz9
	 76UHAdXnk4HUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: light: veml3328: add support for new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com>
References: <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 17:25:16 +0000
Message-Id: <20260530172516.CA7291F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Power management flaw: the sensor is left powered on indefinitel=
y after probe.
- [Medium] Race condition in write_raw allowing corrupted scale and integra=
tion time configuration.
- [Low] Build failure due to variable declaration immediately following a c=
ase label without an enclosing block.
--

commit e6504b133c6cc43d3687ab0ce437962c17f98107
Author: Joshua Crofts <joshua.crofts1@gmail.com>

iio: light: veml3328: add support for new device
   =20
Add support for the Vishay VEML3328 RGB/IR light sensor communicating
via I2C (SMBus compatible). Also add a new entry for said driver into
Kconfig and Makefile.

> diff --git a/drivers/iio/light/veml3328.c b/drivers/iio/light/veml3328.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/light/veml3328.c

[ ... ]

> +static int veml3328_read_avail(struct iio_dev *indio_dev,
> +			       struct iio_chan_spec const *chan,
> +			       const int **vals, int *type, int *length,
> +			       long mask)
> +{
> +	struct veml3328_data *data =3D iio_priv(indio_dev);
> +	struct regmap *regmap =3D data->regmap;
> +	struct device *dev =3D regmap_get_device(data->regmap);
> +	unsigned int reg_val;
> +	int ret, it_inx;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_INT_TIME:
> +		*length =3D ARRAY_SIZE(veml3328_it_times) * 2;
> +		*vals =3D (const int *)veml3328_it_times;
> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> +		return IIO_AVAIL_LIST;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dev, pm);
> +		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);

[Severity: Low]
Since PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() expands to a variable
declaration with a __cleanup__ attribute, does placing it immediately after
the case label cause a build failure?

In C, a label cannot be directly followed by a declaration. Additionally,
without an enclosing block, does the variable's scope extend to the end of
the switch statement, causing the compiler to emit an error because jumping
to the default case bypasses the initialization?

> +		if (ret)
> +			return ret;
> +
> +		ret =3D regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
> +		if (ret)
> +			return ret;

[ ... ]

> +static int veml3328_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int val, int val2, long mask)
> +{
> +	struct veml3328_data *data =3D iio_priv(indio_dev);
> +	struct regmap *regmap =3D data->regmap;
> +	struct device *dev =3D regmap_get_device(regmap);
> +	unsigned int reg_val;
> +	int i, it_inx;
> +	int ret;
> +
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dev, pm);
> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_INT_TIME:

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		ret =3D regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		it_inx =3D FIELD_GET(VEML3328_CONF_IT_MASK, reg_val);
> +		if (it_inx >=3D ARRAY_SIZE(veml3328_it_times))
> +			return -EINVAL;
> +
> +		for (i =3D 0; i < 4; i++) {
> +			if (val =3D=3D veml3328_scale_vals[it_inx][i * 2] &&
> +			    val2 =3D=3D veml3328_scale_vals[it_inx][i * 2 + 1])
> +				break;
> +		}
> +
> +		if (i =3D=3D 4)
> +			return -EINVAL;
> +
> +		return regmap_update_bits(regmap, VEML3328_REG_CONF,
> +					  VEML3328_CONF_GAIN_MASK,
> +					  FIELD_PREP(VEML3328_CONF_GAIN_MASK, i));

[Severity: Medium]
Is this read-modify-write sequence protected against concurrent changes?

Since there is no driver-private mutex or a call to
iio_device_claim_direct_mode() here, could a concurrent sysfs write to
IIO_CHAN_INFO_INT_TIME alter the integration time in hardware between the
initial read and the final update?

If this race occurs, does it cause the driver to apply a gain value calcula=
ted
for a stale integration time, leaving the sensor in an inconsistent
operational state?

> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

> +static int veml3328_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct veml3328_data *data;
> +	struct iio_dev *indio_dev;
> +	unsigned int reg_val;
> +	int ret;

[ ... ]

> +	pm_runtime_set_active(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D devm_pm_runtime_enable(dev);

[Severity: Medium]
Does this leave the sensor powered on indefinitely after probe?

Since the driver's usage count starts at 0 and no explicit idle check is
triggered (such as by calling pm_runtime_idle() or performing a
get_noresume() and put_autosuspend() cycle), the PM core is not prompted to
start the autosuspend timer.

Will the device remain in the RPM_ACTIVE state and draw full power after bo=
ot
until the first user-space interaction initiates a suspend cycle?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-veml3328-v=
3-0-dd562eaee8d9@gmail.com?part=3D2

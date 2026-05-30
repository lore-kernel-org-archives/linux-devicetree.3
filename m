Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68038350A05
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780161413; cv=none; b=o2aXePSEsMMxU8MnkIFfmx8XWv+9TovitJE6EAC56RsSZCnuKnALDlSJHJbZt+57Zkkl/rs5NPpX9JSDRWXmQp3O99yEM2KPs+MOQmX00fUsIKH0kDva4SeFqD14C/IgEaXcwK4xvlllpWX6CuiFmkPbxZjWYzrqqs89C+dcZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780161413; c=relaxed/simple;
	bh=+4u0fHWOjIcg90EBOqOuT8iGFRKnnKWCDYzdQHUcHp0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GDHhot/Z4yzfL1Xjop0vo9dRRYzeQXhdMBiaDo+xaKOlpNvj5E5dvP+KjAra2rpAqAkybMuIE9+KNP2M/IKULsPQhjmKGo6oBw7zUQvc3XHRHenfyr1dfh2oNN89/9TR9TLyjmCsVq2PzF8nxxMBT+QjcS3W+CfXH71eB50juVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yaj0/ib0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yaj0/ib0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE891F00899;
	Sat, 30 May 2026 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780161412;
	bh=NJNEYzJf64UlkAAqUl7tJ57ir0CkSQg2uCPf6X/R85U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yaj0/ib0TD7VTK+dyJmBSKML9jT5XxydnkZ3tRQBzaKBmI63zVgQjTDkVm+hG8ymY
	 b+E5k7e0M/6ki2vjv8yRDcnoXL9p5ATCcPNYerHS0EEWRyhqEV5D27DzJE6BYala3l
	 GEvsKGBJfh75JlyI/l2Zr80bvMPxGKMfdZjdl/nbFDoWHm/35giD2FvHZvoxsNqw1J
	 WKfKkrFQFR01pIEg83z8jgf1ZoBeC6xpgtrFCk0m1DzfaObiccnvprXjXOKX7JWDbY
	 pU9vNXlD4o6Q1hFZKFHwvR0n+GuQMrFguBFoTPVpXh2OZWJobvX3rdJDJ3rnNSnQyo
	 IjE84fsHTDuXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: light: veml6030: add veml3328
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530-veml3328-v3-1-dd562eaee8d9@gmail.com>
References: <20260530-veml3328-v3-1-dd562eaee8d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 17:16:51 +0000
Message-Id: <20260530171652.0CE891F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The runtime PM autosuspend timer is not started in probe, leavin=
g the device powered on indefinitely.
- [Medium] Concurrent sysfs writes to integration time and scale can leave =
the hardware in an inconsistent state.
- [Low] Jumping over a variable initialization with the __cleanup__ attribu=
te in a switch statement causes a compiler error.
--

commit e6504b133c6cc43d3687ab0ce437962c17f98107
Author: Joshua Crofts <joshua.crofts1@gmail.com>

iio: light: veml3328: add support for new device

Add support for the Vishay VEML3328 RGB/IR light sensor communicating
via I2C (SMBus compatible). Also add a new entry for said driver into
Kconfig and Makefile.

> diff --git a/drivers/iio/light/veml3328.c b/drivers/iio/light/veml3328.c
> new file mode 100644
> index 0000000000000..1def67fd9b51d
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

[Severity: Low]
Does this jump over a variable initialization and cause a build regression?

The PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() macro declares `pm` with the
__cleanup__ attribute. When `mask` does not match IIO_CHAN_INFO_INT_TIME or
IIO_CHAN_INFO_SCALE, the execution jumps to the `default:` label, which is
physically after the `pm` declaration.

Jumping over a variable initialization with the __cleanup__ attribute cause=
s a
compilation regression in GCC.

Could we wrap this case in a scoped block { ... } to prevent this?

> +		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		it_inx =3D FIELD_GET(VEML3328_CONF_IT_MASK, reg_val);
> +		if (it_inx >=3D ARRAY_SIZE(veml3328_it_times))
> +			return -EINVAL;
> +
> +		*length =3D 8;
> +		*vals =3D (const int *)veml3328_scale_vals[it_inx];
> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> +		return IIO_AVAIL_LIST;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

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

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		ret =3D regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		it_inx =3D FIELD_GET(VEML3328_CONF_IT_MASK, reg_val);

[Severity: Medium]
Is there a race condition here that causes a regression during concurrent s=
ysfs
writes?

This performs a lockless read-modify-write operation for IIO_CHAN_INFO_SCAL=
E.
Because veml3328_write_raw() lacks driver-level locking (like a mutex), a
concurrent sysfs write to IIO_CHAN_INFO_INT_TIME could modify the hardware's
integration time index immediately after it is read here.

If that happens, the gain index calculated and applied below will be based =
on a
stale `it_inx`, leaving the hardware in an inconsistent configuration.

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
Are we missing a call to start the autosuspend timer here, causing a power
regression?

The sensor is physically powered on via veml3328_power_up(), and runtime PM
is initialized as active and enabled.

Since the usage count remains at 0 and the driver does not invoke
pm_runtime_idle() or a matched pm_runtime_get/put cycle at the end of probe,
the autosuspend timer is never scheduled.

Does this leave the device permanently powered on until a userspace applica=
tion
accesses it?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-veml3328-v=
3-0-dd562eaee8d9@gmail.com?part=3D1

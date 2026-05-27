Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7A3FDC16
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884944; cv=none; b=fjxrke5dTZiOJpvYz1+s4B7u2HsurGyXnZQqud7F9BheULU7vKQ0MG5uUd0heGs2Pz5tUfSsBnMOaZM6BYj4TVTH0+9cWejpe4wziDtXiqBVrYf+37k1w8ELZcQSPq77/GN6qifkoU7cGhQORFdRNFBDKUZ7vArFk0vuRfRtqqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884944; c=relaxed/simple;
	bh=DNJ2oJkjfq4BEbtc5I3y0+p3kvY0xyHwJ74CxVMazFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gA3b3DwSlo5rwY+Yv1hgYvqq+xMVKrFaeScCxW7ldjKZBm6LxjCDm2Y3NQIoVfJBLNTeCKz/BfVtpXfknC0XDcUeqDhDcZjhRHXPxQq7dniztyRgcbXlU+Ji18zPdWfgss/6pjHOZyr+buw5izhhf47K4OZ65xe6drw9EIzrGLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3Hgc7XC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3Hgc7XC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494851F000E9;
	Wed, 27 May 2026 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884942;
	bh=TnGaLKtPIiX+OumTpyDauH89mI3vIM2gD9lRYCtT9i4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H3Hgc7XCDT3eEQZ6CJLsGL6Q/KkHqw0d/lEJWsWMjRPlxtsIG/9Buyc0HnZn75CmB
	 UQGIpVHumFS9UaEu8HQqO/Jsqckq9rPYOFPUmWD2mKnqhduE3n4mzgegGrYM6PkZv6
	 bNCZde7CG4vtz//g1t2HTdz5/bGGqJ9rhPkIAewm34EfUh4aL1+Eoz9rxyRgf35qU2
	 1xPz1D8rqRdYmnY/mDQKcg3PI+21dXJN8blzSF59LO7TNxlksXIbIlSpT4UqRTZZ+6
	 gwQUh7VZKJEm0E43Gw4eFoKDAirj1Lw97dBLQczHaArDU+qZubfD22NPyzX6dxMA4Y
	 fVyw1q5oiSV9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] iio: adc: add Versal SysMon driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527114211.174288-3-salih.erim@amd.com>
References: <20260527114211.174288-3-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 12:29:01 +0000
Message-Id: <20260527122902.494851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The Kconfig dependency prevents building the driver on its intende=
d architecture.
- [High] Raw temperature reads lack sign extension, and there is a mismatch=
 in bit width definitions causing negative temperatures to be corrupted.
- [Medium] Exposing IIO_CHAN_INFO_RAW for packed floating-point hardware fo=
rmats violates the IIO UAPI.
--

commit 084edfc78fc9fd37f78ac260bcd2da4ecb832e8a
Author: Salih Erim <salih.erim@amd.com>

iio: adc: add Versal SysMon driver

Adds the core driver and MMIO platform driver for the AMD/Xilinx Versal
System Monitor (SysMon) block, providing voltage and temperature monitoring.

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig

[ ... ]

> @@ -1943,6 +1943,26 @@ config TWL6030_GPADC
>  	  This driver can also be built as a module. If so, the module will be
>  	  called twl6030-gpadc.
> =20
> +config VERSAL_SYSMON_CORE
> +	tristate
> +	select REGMAP
> +
> +config VERSAL_SYSMON
> +	tristate "AMD Versal SysMon driver"
> +	depends on ARCH_ZYNQMP || COMPILE_TEST

[Severity: High]
Could this Kconfig dependency prevent the driver from being built on its
intended architecture? Since this driver targets the AMD Versal platform,
should it depend on ARCH_VERSAL instead of ARCH_ZYNQMP?

> +	depends on HAS_IOMEM
> +	select VERSAL_SYSMON_CORE

[ ... ]

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> --- /dev/null
> +++ b/drivers/iio/adc/versal-sysmon-core.c

[ ... ]

> +/*
> + * Both RAW and PROCESSED are exposed: RAW is needed for event thresholds
> + * (which operate in hardware register format), PROCESSED gives userspace
> + * the converted millivolt or millicelsius value.
> + */

[Severity: Medium]
Does exposing RAW for packed floating-point formats violate the IIO UAPI?

The IIO ABI dictates that _raw attributes must represent a simple, unscaled
linear integer value. Exporting a packed format containing mantissa, expone=
nt,
and format bits could break generic userspace clients expecting linear valu=
es.

Since event thresholds use their own dedicated sysfs attributes, is it
necessary to expose _raw on the main channel?

> +#define SYSMON_CHAN_TEMP(_chan, _address, _name) {		\
> +	.type =3D IIO_TEMP,					\
> +	.indexed =3D 1,						\
> +	.address =3D _address,					\
> +	.channel =3D _chan,					\
> +	.info_mask_separate =3D					\
> +		BIT(IIO_CHAN_INFO_RAW) |				\
> +		BIT(IIO_CHAN_INFO_PROCESSED),			\
> +	.scan_type =3D {						\
> +		.sign =3D 's',					\
> +		.realbits =3D 15,					\

[Severity: High]
There appears to be a mismatch between the realbits defined here and the
parameter type used in the conversion function below.

If the hardware format is actually 15-bit, will casting to s16 in
sysmon_q8p7_to_millicelsius() fail to sign-extend negative values? Or if
the hardware format is actually 16-bit, should realbits be set to 16?

> +		.storagebits =3D 16,				\
> +		.endianness =3D IIO_CPU,				\
> +	},							\
> +	.datasheet_name =3D _name,				\
> +}

[ ... ]

> +static void sysmon_q8p7_to_millicelsius(s16 raw_data, int *val)
> +{
> +	*val =3D (raw_data * (int)MILLI) >> SYSMON_FRACTIONAL_SHIFT;
> +}

[ ... ]

> +static int sysmon_read_raw(struct iio_dev *indio_dev,
> +			   struct iio_chan_spec const *chan,
> +			   int *val, int *val2, long mask)
> +{
> +	struct sysmon *sysmon =3D iio_priv(indio_dev);
> +	unsigned int regval;
> +	int ret;
> +
> +	if (mask !=3D IIO_CHAN_INFO_RAW && mask !=3D IIO_CHAN_INFO_PROCESSED)
> +		return -EINVAL;
> +
> +	guard(mutex)(&sysmon->lock);
> +
> +	switch (chan->type) {
> +	case IIO_TEMP:
> +		ret =3D regmap_read(sysmon->regmap, chan->address, &regval);
> +		if (ret)
> +			return ret;
> +		if (mask =3D=3D IIO_CHAN_INFO_PROCESSED)
> +			sysmon_q8p7_to_millicelsius(regval, val);
> +		else
> +			*val =3D regval;

[Severity: High]
Can this direct assignment corrupt negative temperature reads?

Since regval is unsigned int, assigning it directly to *val without
sign-extending the hardware value could result in a large positive integer
being exported to sysfs when the temperature is negative.

> +		return IIO_VAL_INT;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527114211.1742=
88-1-salih.erim@amd.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369E32D1916
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 23:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781305354; cv=none; b=db2RVgw4j/ZpifZ3PdCc2HEOslIoStEr2HvfyRbrYkoClB/nQkzncSzHi3hXwNVLRcm1OoGCZPtqRFxbRKQXIbbOFbx0aRSkhoqwrzn4xq65NfqqZ7LXjX1zWUSTXfnUVYhD0D6P2UaHb127hDT6+Y9CDsdJzjvRcTuDw+2MjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781305354; c=relaxed/simple;
	bh=BdoyeuaBTFRtEjrU6wZlxcx522Ex8keit1A4wHO7WTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQBzYv8fY7JU5Rjq3YxvQTyBATbem6TisEijxkSPUOMptTs81rbjUwE878/BDUWI004pVHgvnLYdBnf/CJoQJyKECXtgv4iR07x8dKIJ4ItvImQug85MYacjvWOgC0olYFis51XBtmToPbz3H3FILVSTiExQpoEyNkCDuNneOPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3DtTy+1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3DtTy+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8761F000E9;
	Fri, 12 Jun 2026 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781305352;
	bh=ggUK8t5uIJoxQi6FO8T632xacoDguEOhtSSCjLB24xE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e3DtTy+1ZGN7tJg84+1rPjgCYkClMw8pEOadQ2+DGjkphTBN5KQ2rmEc6uHyX6PX4
	 1TarZrhyoMUrPOzspiwVKWQC+VvBKKpH8ndVtk6ygLNPyyGDLNxEM44NWbvO/qil/4
	 4aMbJlVow/T7yVbEMp098XIl9MWX49MWrAeKFAhR+x7QKi8a1bYsw4iQHlj99wSc8H
	 Nkqc6lJK2b9vb7JnsfrGUWKfc+8GIEgFM2DhaERHr7+kesjHvS0iaJpQly+KO3AP9E
	 sBAd1M+nJBWtnW17+JGLq8QXy1KnAoqYOEe3ficZvtzMDMshn2OiH6xxKuXwVEFnr7
	 V1t7qNVt2X9Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] iio: adc: ti-ads1262: Add calibration support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260612-ads126x-v1-4-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-4-894c788d03ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 23:02:31 +0000
Message-Id: <20260612230232.4D8761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Using stack-allocated variables as buffers for SPI DMA transfers v=
ia `regmap_bulk_read()` and `regmap_bulk_write()` violates SPI subsystem co=
nstraints.
- [Medium] A partially uninitialized stack variable is read, which triggers=
 Kernel Memory Sanitizer (KMSAN) warnings and constitutes undefined behavio=
r.
- [Low] Implicit pointer conversion from `int *` to `u32 *` causes a `-Winc=
ompatible-pointer-types` compiler warning.
- [Low] The `calib_range` array is missing a `const` qualifier.
--

commit 610c80294ac29a44a2dda7d05bb059e7d60a62d2
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: Add calibration support

This commit adds channel calibration support to the ti-ads1262 ADC driver
by implementing scale and bias calibration via regmap bulk operations.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 6d5f22836ad8b..b33505e7fdc7a 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> @@ -453,6 +457,32 @@ static int ads1262_dev_start_one(struct ads1262 *st,=
 u8 runmode)
>  	return 0;
>  }
> =20
> +static int ads1262_read_calib(struct ads1262 *st, unsigned int reg, u32 =
*val)
> +{
> +	__le32 lval;
> +	int ret;
> +
> +	/*
> +	 * The calibration word is a signed 24 bit LSB-first value.
> +	 */
> +	ret =3D regmap_bulk_read(st->regmap, reg, &lval, 3);

[Severity: High]
Does this safely handle DMA transfers? Passing a stack-allocated variable
like lval to regmap_bulk_read() eventually initiates an SPI DMA transfer.
Using stack memory for DMA transfers can cause spi_map_buf() to fail with
-EINVAL on systems with vmap stacks, or lead to memory corruption due to
cache line tearing on architectures without hardware cache coherency.

> +	if (ret)
> +		return ret;
> +	*val =3D sign_extend32(le32_to_cpu(lval), 23);

[Severity: Medium]
Is it possible this reads uninitialized memory? The stack variable lval is
declared without initialization. When passed to regmap_bulk_read() above,
only the first 3 bytes are populated. Calling le32_to_cpu(lval) will then
read all 4 bytes, including the uninitialized 4th byte, which can trigger a
KMSAN use-of-uninitialized-value warning.

> +
> +	return 0;
> +}
> +
> +static int ads1262_write_calib(struct ads1262 *st, unsigned int reg, u32=
 val)
> +{
> +	__le32 lval =3D cpu_to_le32(val);
> +
> +	/*
> +	 * The calibration word is a signed 24 bit LSB-first value.
> +	 */
> +	return regmap_bulk_write(st->regmap, reg, &lval, 3);

[Severity: High]
Can this also cause issues with SPI DMA? Similar to the read function,
passing the stack variable lval to regmap_bulk_write() routes a stack
address into the SPI subsystem, violating DMA constraints.

> +}
[ ... ]
> @@ -673,6 +703,18 @@ static int ads1262_read_raw(struct iio_dev *indio_de=
v,
>  		*val2 =3D ads1262_conv_delay_avail[mode][1];
>  		return IIO_VAL_INT_PLUS_NANO;
> =20
> +	case IIO_CHAN_INFO_CALIBSCALE:
> +		ret =3D ads1262_read_calib(st, ADS1262_FSCAL0_REG, val);

[Severity: Low]
Will this cause a compiler warning for incompatible pointer types?
The val parameter provided by the IIO subsystem to ads1262_read_raw() is
an int pointer, but ads1262_read_calib() explicitly expects a u32 pointer.
Since Linux 6.8, incompatible pointer type warnings are treated as fatal
errors and can break the build.

> +		if (ret)
> +			return ret;
> +		return IIO_VAL_INT;
> +
[ ... ]
> @@ -682,6 +724,9 @@ static int ads1262_read_avail(struct iio_dev *indio_d=
ev,
>  			      struct iio_chan_spec const *chan, const int **vals,
>  			      int *type, int *length, long mask)
>  {
> +	static int calib_range[3] =3D { ADS1262_CALIB_WORD_MIN, 1,
> +				      ADS1262_CALIB_WORD_MAX };

[Severity: Low]
Should this array be declared as const? Omitting the const qualifier places
calib_range in the mutable data section instead of the read-only rodata
section, leaving it unprotected against accidental runtime modifications.

> +
>  	switch (mask) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-ads126x-v1=
-0-894c788d03ed@gmail.com?part=3D4

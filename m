Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBC4368D5A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072608; cv=none; b=rl5bPctJ/ZlakJay6LPhOlGgK1Buaoy8en85nYaTSx9Eq06Dg4rhuzzjLpaiAUUQEWHT/jhGKmE64HlexoLkbW9lX+M78VXAxLtf/OImzo7THs7TsdGX5wSWCkCqdgMoWUaOyly+E31yUcdK/WyveufKCnx/6FPBMjpdXu0bHD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072608; c=relaxed/simple;
	bh=F8eO+tjnPIlqpTQ7u6KyU2VEj5zMrVYkUwJh6E7xst0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t1NgHFaXd+65xHZMwA97X/exaPGmyPHZajquCkNd/wIqU5IOG9LfKc1liiaQkaLkT+ntRbu3pzeYduCWJ3cYQNAIlpq8/2fg9SM19N2Tva7z3xqbyJ7IHsV4hjyqxZ6HC7KA5gVYH17kMjkLt8t4YZ1avoO+Bt0LTsL7QxoJnKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWIFN6us; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWIFN6us"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09BB1F000E9;
	Tue, 14 Jul 2026 23:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784072607;
	bh=AXfTh1No98akGrG3HDy0XVhnznvh/3Z93Lo113VmDlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWIFN6usoQWdDwRyFe3cZ8NsRyTHuT9PwE25dg5h51Z6oft5TcvS4zVTpstsECDiL
	 pqveoKaVQz+6fb65uBVF06joGfIjag7WIqIZPf4/GgazFdpFX2xDnUIqGu7Zcr9HFs
	 TaKSxwzZ1Td7ZIrYVcI9V3fmebSO8s3XkjvA6/DkMuI6X8M6XTIu3HiyhHPBi+VoMJ
	 MEjvikTWV1UmXs8sPy7RLbXJ0jk5oCrW6wts+eUUnAjsiG8PpGOmAjBwNfBo5G4bWH
	 jKM8wgfPxCltl1yhbyD6DAL7Sfln2OeuyDWzNQRfarh6OiPcS7fP+WFEjTzcfbtvjv
	 MmKtoPPy4Knrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] iio: adc: add ti-ads112c14 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2aWQgTGVjaG5lciAoVEkp?= <dlechner@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-iio-adc-ti-ads122c14-v4-6-25f8e3084485@baylibre.com>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
 <20260714-iio-adc-ti-ads122c14-v4-6-25f8e3084485@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 23:43:26 +0000
Message-Id: <20260714234326.B09BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The polling loop for the single-shot conversion exits immediately =
because it checks the active-low `~DRDY` bit incorrectly.
- [Medium] Uninitialized kernel stack memory is leaked to user space due to=
 unhandled short reads from `i2c_smbus_read_i2c_block_data()`.
--

--- Patch [6]: [PATCH v4 6/8] iio: adc: add ti-ads112c14 driver ---
commit 399c7e84626ba31d27ae803b5704a50020c2c856
Author: David Lechner (TI) <dlechner@baylibre.com>
Date:   Tue Jul 14 23:21:28 2026 +0000

    iio: adc: add ti-ads112c14 driver
   =20
    Add a new driver for the TI ADS112C14/ADS122C14 ADC chips.
   =20
    This first step is adding a very basic driver that only supports power
    on/reset and reading the system monitor channels.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> new file mode 100644
> index 0000000000000..a69c595ab5181
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c14.c

[ ... ]

> @@ -267,14 +267,14 @@ static int ads112c14_single_conversion(struct ads11=
2c14_data *data,
>  		if (ret)
>  			return ret;
>  	}
> =20
>  	ret =3D regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
>  			   ADS112C14_CONVERSION_CTRL_START);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D regmap_read_poll_timeout(data->regmap,
>  				       ADS112C14_REG_STATUS_MSB, reg_val,
>  				       FIELD_GET(ADS112C14_STATUS_MSB_DRDY, reg_val),
>  				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);

[Severity: High]
Does this polling loop exit prematurely when the device is still busy?

The data ready bit (~DRDY) is active-low (0 =3D ready, 1 =3D busy).

FIELD_GET(ADS112C14_STATUS_MSB_DRDY, reg_val) evaluates to true immediately
while the device is busy, causing the loop to exit before the conversion
has actually completed.

>  	if (ret)
>  		return ret;
> =20
>  	return i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA,
>  					     BITS_TO_BYTES(data->chip_info->resolution_bits),
>  					     buf);
>  }
> =20
>  static int ads112c14_read_raw(struct iio_dev *indio_dev,
>  			      struct iio_chan_spec const *chan,
>  			      int *val, int *val2, long mask)
>  {

[ ... ]

> @@ -304,18 +304,18 @@ static int ads112c14_read_raw(struct iio_dev *indio=
_dev,
>  		fsr_bits =3D data->chip_info->resolution_bits - 1;
>  	}
> =20
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW: {
>  		u8 buf[3];
>  		int ret;
> =20
>  		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>  		if (IIO_DEV_ACQUIRE_FAILED(claim))
>  			return -EBUSY;
> =20
>  		ret =3D ads112c14_single_conversion(data, chan, buf);
>  		if (ret < 0)
>  			return ret;

[Severity: Medium]
Can this leak uninitialized stack memory to userspace on a short read?

i2c_smbus_read_i2c_block_data() can return a positive short byte count if
the I2C transfer completes partially.

Since this code only checks if (ret < 0), a short read will proceed to deco=
de
the uninitialized bytes in buf:

drivers/iio/adc/ti-ads112c14.c:ads112c14_read_raw() {
    ...
    switch (data->chip_info->resolution_bits) {
    case 16:
        *val =3D get_unaligned_be16(buf);
    ...
}

Could this check verify that ret exactly matches the requested number of
bytes instead of just checking for negative errors?

> =20
>  		switch (data->chip_info->resolution_bits) {
>  		case 16:
>  			*val =3D get_unaligned_be16(buf);
>  			break;
>  		case 24:
>  			*val =3D get_unaligned_be24(buf);
>  			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-iio-adc-ti=
-ads122c14-v4-0-25f8e3084485@baylibre.com?part=3D6

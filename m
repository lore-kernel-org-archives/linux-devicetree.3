Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D096305693
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561599; cv=none; b=nPcPl+WWRfa9XCRvY0pxcpM1M7gPHACEbnad68JzVtbAJaWtzznwZ06ePdDPvdnWwtVIUKZtTNzMXak2DJZ3HmiznZSqk2uYtAJXuoySNUwK1bhChaDrJH5QEPiMNLXDSUbpVkJYPIuhSFdq2yJvm6zdZAzO2vWWVtLEqFRwbAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561599; c=relaxed/simple;
	bh=PgKs7atGGj2sfd8aM4R1froF0ZTEicfBYbDOJVq/xt4=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uF0uxxOMqr50aEumi9ZL5csz83LYiutDRDJOdEG5volGoFv+m2CEwqaPFIzZ4qVAwnCKFYzoBcLU/OM5nt5d56O/Cbf5WagFI4rGCs34Rrt/O5/KVM/VNeGWxqaRZiIQZTxNlsXRpzpUhF6lSEFXUZfTykyzVLIuoR5oUHuhptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVA6CQmv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVA6CQmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFDA1F000E9;
	Mon, 15 Jun 2026 22:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781561597;
	bh=QrPr45EaLPj0CVwCiXU/TpFRmXtK3IiDlTRkzukQGjU=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=hVA6CQmvdV7I4Lds0qE9vUfgjcEH6fYBjQlORt2XvacQXlG3ihIN2QmQOAtMkv3sq
	 mkx2035xNoGUg/XE6V4U07WTFHj0PpJoZ1ZqJ6KGFCHVGyhbuP0gqgvYlUxOxfwUwP
	 Rce94g9inKQMffbHXn7bAwY3kJnc6bPFm+aMqtwEvK+G44C3Ii5u89lIHKjnNO/g+b
	 hkKYPBN68ZeOZ2l9+gcRcZvs8Ts9vREjyY2OZtZiWzf7n45qCtjfXunu0N0mT8SqX/
	 Lg95Ac7gLpJifJ8U+G0lLwH7mcEOGzi19y/kzUrAD7UIbxZW0lr4hpQJz4vH9XrKLs
	 8Kld7ZmPGLCJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] iio: adc: ti-ads112c14: add measurement channel
 support
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-iio-adc-ti-ads122c14-v1-4-e6bdadf7cb2b@baylibre.com>
References: <20260615-iio-adc-ti-ads122c14-v1-4-e6bdadf7cb2b@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 22:13:17 +0000
Message-Id: <20260615221317.9FFDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] Heap buffer overflow in `ads112c14_populate_tables` due to inc=
orrectly incremented `data->num_measurements`.
- [High] Incorrect error check for `devm_regulator_get_enable_read_voltage`=
 causes valid probe successes to fail.
- [High] Uninitialized variable dereference in `ads112c14_read_raw()` for s=
ystem monitor channels.
- [High] Integer overflow in `ads112c14_populate_scale_available()` breaks =
scaling factor calculation on 32-bit platforms.

Pre-existing issues:
- [High] Probe exits early and silently fails to register the IIO device if=
 the reset command succeeds.
- [High] Short reads from I2C block reads leak uninitialized stack memory.
--

commit 6b05c003c593f091ad7d3f52a3dc20d0fab7fc26
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: ti-ads112c14: add measurement channel support

This patch adds support for parsing devicetree properties to dynamically
create measurement channels. It also adds the required algorithms and state
to do direct reads on these channels.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> index 202a449b4234f..d1297445025f7 100644
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c
[ ... ]
> @@ -383,7 +512,8 @@ static int ads112c14_read_raw(struct iio_dev *indio_d=
ev,
>  			return -EINVAL;
>  		}

[Severity: High]
This isn't a bug introduced by this patch, but can a short read from
ads112c14_single_conversion() leak uninitialized stack memory?

If i2c_smbus_read_i2c_block_data() returns fewer bytes than requested
(e.g., 1 instead of 3), the return value is a positive integer. The check
`if (ret < 0)` earlier in ads112c14_read_raw() passes, and extracting the
value will read uninitialized bytes from the stack-allocated buffer.

> =20
> -		*val =3D sign_extend32(*val, fsr_bits);
> +		if (!measurement || measurement->bipolar)

[Severity: High]
Can `measurement` be uninitialized when dereferenced here?

If the requested channel is a system monitor channel (`chan->channel >=3D 1=
00`),
the `measurement` pointer is left uninitialized at the start of
ads112c14_read_raw(). It is then evaluated in this condition, which could
lead to undefined behavior.

> +			*val =3D sign_extend32(*val, fsr_bits);
> =20
>  		return IIO_VAL_INT;
>  	}
[ ... ]
> @@ -519,26 +687,187 @@ static const struct iio_info ads112c14_info =3D {
>  	.read_label =3D ads112c14_read_label,
>  };
> =20
> +static int ads112c14_parse_channels(struct iio_dev *indio_dev,
> +				    bool *need_avdd_ref, bool *need_ext_ref)
> +{
[ ... ]
> +	data->num_measurements =3D device_get_named_child_node_count(dev, "chan=
nel");
> +
> +	data->measurements =3D devm_kcalloc(dev, data->num_measurements,
> +					  sizeof(*data->measurements), GFP_KERNEL);
> +	if (!data->measurements)
> +		return -ENOMEM;
> +
> +	data->num_measurements +=3D ARRAY_SIZE(ads112c14_sys_mon_channels);

[Severity: Critical]
Does this incorrectly inflate the measurement count?

By incrementing `data->num_measurements` by the size of the system monitor
channels here, the boundary for the measurements array becomes too large.
Later in ads112c14_populate_tables(), looping over `data->num_measurements`
will access `data->measurements` out-of-bounds, potentially corrupting
adjacent heap memory.

> +
> +	channels =3D devm_kcalloc(dev, data->num_measurements +
> +				ARRAY_SIZE(ads112c14_sys_mon_channels),
> +				sizeof(*channels), GFP_KERNEL);
[ ... ]
> +static void ads112c14_populate_scale_available(int scale_avail[][2],
> +					       u32 vref_uV, u32 fsr_bits)
> +{
> +	for (u32 i =3D 0; i < ARRAY_SIZE(ads112c14_pga_gains_x10); i++) {
> +		int *entry =3D scale_avail[i];
> +		u32 gain_x10 =3D ads112c14_pga_gains_x10[i];
> +
> +		entry[0] =3D div_u64_rem(div64_u64((u64)(NANO * 10 /
> +						       (MICRO / MILLI)) * vref_uV,

[Severity: High]
Does this calculation overflow on 32-bit platforms?

`NANO` is defined as a 32-bit unsigned long, so multiplying it by 10 overfl=
ows
before the cast to `u64`. This truncates the value used to compute the scale
factor, leading to incorrect scaling values on 32-bit architectures.

> +						 (u64)gain_x10 * BIT(fsr_bits)),
> +				       NANO, &entry[1]);
> +	}
> +}
> +
>  static void ads112c14_populate_tables(struct ads112c14_data *data)
>  {
>  	u32 vref_uV, fsr_bits;
> -	int i;
> +
> +	for (u32 i =3D 0; i < data->num_measurements; i++) {
> +		struct ads112c14_measurement *measurement =3D &data->measurements[i];

[Severity: Critical]
Does this loop cause an out-of-bounds access?

Because `data->num_measurements` was artificially inflated in
ads112c14_parse_channels(), this loop goes past the allocated elements for
`data->measurements`. Writing to `measurement->scale_available` further down
in the loop will result in a heap buffer overflow.

[ ... ]
> @@ -560,13 +892,75 @@ static int ads112c14_probe(struct i2c_client *clien=
t)
>  	data->chip_info =3D info;
>  	data->client =3D client;
> =20
> +	ret =3D ads112c14_parse_channels(indio_dev, &need_avdd_ref, &need_ext_r=
ef);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D devm_regulator_get_enable(&client->dev, "dvdd");
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get dvdd regulator\n");
> =20
> -	ret =3D devm_regulator_get_enable(&client->dev, "avdd");
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to get avdd regulator\n");
> +	if (need_avdd_ref) {
> +		ret =3D devm_regulator_get_enable_read_voltage(&client->dev, "avdd");
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to get avdd voltage\n");

[Severity: High]
Does this incorrectly fail on success?

`devm_regulator_get_enable_read_voltage()` returns the voltage in microvolt=
s on
success, which is a positive integer. Checking `if (ret)` will evaluate to =
true
and abort the probe when the voltage is successfully read. This same pattern
appears below for the 'refp' and 'refn' regulators.

[ ... ]
>  	data->regmap =3D devm_regmap_init_i2c(client, &ads112c14_regmap_config);
>  	if (IS_ERR(data->regmap))

[Severity: High]
This isn't a bug introduced by this patch, but does the probe fail to
register the device if the reset command succeeds?

Just below this context, during probe, a software reset is sent via
regmap_write() and the return value is checked with:

	if (ret !=3D -EREMOTEIO)
		return ret;

If the device acknowledges the write and regmap_write() successfully return=
s 0,
the check evaluates to true (`0 !=3D -EREMOTEIO`), causing the driver to
prematurely return 0 without ever calling devm_iio_device_register(), leavi=
ng
the device entirely unusable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-iio-adc-ti=
-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com?part=3D4

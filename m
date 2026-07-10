Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144103E9C31
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 23:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724892; cv=none; b=h/bLSPSN7ioooWaBj5qPXSslkz44iUjIHUkJfR2/trC8JN9/m3VxU0U2FhKUFWbBJCUFLZ7r3q03BPcOJfh6bZzxhnM2RovfD9Eod22OYKp3LRB18w1xX0SVJlgdJg6BWB+kE02VR0mTOuj8AtyaRkU3ihUm0hH50xLFISB4MjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724892; c=relaxed/simple;
	bh=xl5XwiIMMOykmHbvXDZnvY54Db/nM2wF/OGCG/y6FhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OlCo3mZNvLymh7+Wu957b78Fm0CGjt66+PK5YLhcE9IzzXju3eJqTynQLJWJvY5dK/1Sg+e4DTu4RukaAxfwAXz/VILRDfDeSMcTU8gHZ7efPn2exv6muj+NRqcjETtrdLqiotosN3axmNnosMhCM5nAmCQrDzoXYbPhmOwXcFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnwROqWd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnwROqWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C13A1F000E9;
	Fri, 10 Jul 2026 23:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783724890;
	bh=rmdN35sIDH5dhqWVfNgYorzn2L1XW/hSPuGxan3FRvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gnwROqWdfMrsyAWHAoSgmj0FgHeYzIQmCHRglpu3gofxLUCMi55vvirvIEHqfMOmd
	 jsv6SszPKELhM6QXA8e9Q6+TfDWVrsR8I4WYPEAOuLzmYXnJQXRdcZ6NpOsXh8V++/
	 LWZ3KxyiiOdVCUuZYwE3d4EySLM7h7OcbCtZXlav5iDPPqgpxxIqx7e4LH65OhEYou
	 3gAQYe/+GYelSs8TSjWoYVn3Q45Zo77tDhaHzoVoWzuHPj+qH7mPggOuVvqRkU5hJE
	 LmHEG+vyxy7ym3R31tRjOaXHjSmVHmlug4iO+6B3pWp4q3vDicj3YnPrmiRd8KThg5
	 OiZxwDn9Q766w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] iio: adc: ti-ads112c14: add measurement channel
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2aWQgTGVjaG5lciAoVEkp?= <dlechner@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-8-746d52cbf1d0@baylibre.com>
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-8-746d52cbf1d0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 23:08:09 +0000
Message-Id: <20260710230810.6C13A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The parsed `burn-out-current-nanoamp` Devicetree property is nev=
er applied to the hardware registers.

Pre-existing issues:
- [High] Short I2C block reads leak uninitialized stack memory to userspace.
- [High] Casting an `s64` array to `const int *` for `IIO_AVAIL_LIST` produ=
ces corrupted values on big-endian architectures.
--

--- Patch [8]: [PATCH v3 8/8] iio: adc: ti-ads112c14: add measurement chann=
el support ---
commit d188e14a67542447de91b1747691ed2a77615e7a
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: ti-ads112c14: add measurement channel support

Add support for parsing devicetree properties for measurement channels
and doing direct reads on these.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> index 2ce4411a0d86f..a310abd69d8fa 100644
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c

[ ... ]

> @@ -257,12 +302,113 @@ static const struct regmap_config ads112c14_regmap=
_config =3D {

[ ... ]

> +static int ads112c14_prepare_measurement_channel(struct ads112c14_data *=
data,
> +						 const struct iio_chan_spec *chan)
> +{
> +	struct ads112c14_measurement *measurement =3D &data->measurements[chan-=
>scan_index];
> +	u32 refp_buf_en, refn_buf_en, ref_val, ref_sel;
> +	int ret;
> +
> +	ret =3D regmap_update_bits(data->regmap, ADS112C14_REG_MUX_CFG,

[ ... ]

> +	ret =3D regmap_update_bits(data->regmap, ADS112C14_REG_DATA_RATE_CFG,
> +				 ADS112C14_DATA_RATE_CFG_GC_EN,
> +				 FIELD_PREP(ADS112C14_DATA_RATE_CFG_GC_EN,
> +					    measurement->global_chop));
> +	if (ret)
> +		return ret;
> +

[Severity: Medium]
Is the burn-out current setting being applied to the hardware?

In ads112c14_parse_channels(), the burn-out-current-nanoamp property is
parsed and stored in measurement->burnout. However, it does not appear
to be applied to the ADS112C14_REG_DEVICE_CFG register during this channel
configuration step, which might mean the feature remains unconfigured.

> +	refp_buf_en =3D !data->refp_is_avdd &&
> +		      measurement->vref_source =3D=3D ADS112C14_VREF_SOURCE_EXTERNAL;
> +	refn_buf_en =3D !data->refn_is_gnd &&

[ ... ]

> @@ -386,7 +534,8 @@ static int ads112c14_read_raw(struct iio_dev *indio_d=
ev,
>  			return -EINVAL;
>  		}
> =20
> -		*val =3D sign_extend32(*val, fsr_bits);
> +		if (!measurement || measurement->bipolar)
> +			*val =3D sign_extend32(*val, fsr_bits);
> =20
>  		return IIO_VAL_INT;
>  	}

[Severity: High]
This is a pre-existing issue, but does this sequence safely handle short I2C
block reads?

In ads112c14_read_raw(), an uninitialized buffer is declared on the stack
and passed for conversion:

ads112c14_read_raw()
    ...
    u8 buf[3];
    ...
    ret =3D ads112c14_single_conversion(data, chan, buf);

Inside ads112c14_single_conversion(), the read is performed:

    return i2c_smbus_read_i2c_block_data(client, ..., buf);

If the block data read returns a positive value less than the requested
number of bytes, checking ret < 0 will not catch the error. The partially
uninitialized stack memory in buf could then be parsed using
get_unaligned_be16() or get_unaligned_be24() and returned to userspace.

[ ... ]

> @@ -436,14 +592,29 @@ static int ads112c14_read_avail(struct iio_dev *ind=
io_dev,
>  {
>  	struct ads112c14_data *data =3D iio_priv(indio_dev);
> =20
> -	if (chan->channel =3D=3D ADS112C14_SYS_MON_CHANNEL_SHORT) {
> -		*vals =3D (const int *)data->sys_mon_chan_short_scale_available;
> -		*length =3D 2 * ARRAY_SIZE(data->sys_mon_chan_short_scale_available);
> -		*type =3D IIO_VAL_DECIMAL64_PICO;
> -		return IIO_AVAIL_LIST;
> -	}
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->channel < ADS112C14_SYS_MON_CHANNEL_BASE) {
> +			struct ads112c14_measurement *measurement;
> +
> +			measurement =3D &data->measurements[chan->scan_index];
> +			*vals =3D (const int *)measurement->scale_available;

[Severity: High]
This is a pre-existing issue, but will casting an s64 array to a const int *
cause incorrect scale values on big-endian architectures?

The IIO core reads this list as pairs of 32-bit integers, combining them
into an s64 by using the first integer as the lower 32 bits and the second
as the upper 32 bits.

On big-endian systems, the upper 32 bits of the s64 are stored first in
memory, meaning the halves could be swapped when read by the IIO core.

> +			*length =3D 2 * ARRAY_SIZE(measurement->scale_available);
> +			*type =3D IIO_VAL_DECIMAL64_PICO;
> +			return IIO_AVAIL_LIST;
> +		}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-iio-adc-ti=
-ads122c14-v3-0-746d52cbf1d0@baylibre.com?part=3D8

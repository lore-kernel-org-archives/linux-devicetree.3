Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2B423BD06
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425307; cv=none; b=hYo08rLtz4FPJhVZEjkDCSsFhSz3Y6LjPuI4nR3xYblapeTUKrS+4BqfbyDHm/DD28Y7FS3YhTg/u8iAFHqsMpVgeKxElWUJ7SdAy9euynuQeTe8AwHzwlLHbZe3mCCfWQQdwDlC4tRXRmtJniyQUxyGCZxO5kgCGGbk3lHViDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425307; c=relaxed/simple;
	bh=Aow1wsAu7iMwzJeOSkUU0A6YIg0feW/iC1O1p2V1MNs=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jDmm5evsjyHlduJnOQvoQ9KcaW0vUPNDGmdrJOOPBKikCoWG0j0MvcgAVbGQ2+lrtS9c7e3042NGCJaTxzZ5yMMKcp0jkanXGouDi/i2+vN4TBEuBlvkn7xZZoPiyeQ8hqI6mzaI7OEU55oVX4OipDFhkyIsB+HfHAsqwxgrCLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFnHEYqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFnHEYqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7323A1F000E9;
	Thu, 25 Jun 2026 22:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782425306;
	bh=Ts9rs3BRxh8ED0N1IJ6Y7W72226xzKLpW4YQk6aNVpI=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=LFnHEYqx1OWbbkxFkqqVK4DGiWe9G9144EBCjCgYIu4zBWiT4GqA/D/opnmTpk+sK
	 kZu8hbDJw/+SJPElrtofa7s6HusXvuE2PvrAHEYu2UB/aDY2neY/foYJphSkas5zME
	 5vv+yCUyp97r+oG6b8V1k83Ws5wwfbQwSuQHZNIHVpOymCZQnn3cYR2AFgVeR7RFaC
	 o5sNUBoPDrQ5pZnKQto7IY079qQ5bWBrwqcJ8PhiJBW+ngYlTJ/JkCmzsmGcU2TDyl
	 O131lmdBN23cViawmMR6DrkWyT6PgMgg4RrLUalLYb0yYdio8hcNjMTcQnTWQX/rVf
	 Er1nKXgW/eiXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] iio: adc: ti-ads112c14: implement gain on
 internal short SYS_MON channel
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-iio-adc-ti-ads122c14-v2-7-ceb9b0b561cb@baylibre.com>
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-7-ceb9b0b561cb@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 22:08:26 +0000
Message-Id: <20260625220826.7323A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unlocked concurrent accesses to `gain_val` variables can result =
in data races and potentially corrupted scale values being returned to user=
space.
--

commit d2600e3b47039aca86a7fafcbbec65c4180a38f5
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: ti-ads112c14: implement gain on internal short SYS_MON channel

Implement support for the programmable gain amplifier on the internal short
SYS_MON channel. This channel is used for calibration, so it is useful to be
able to set the PGA to the same gain as the external channels.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> index c61d472447325..0e775dbc8d50b 100644
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c
[ ... ]
> @@ -371,6 +401,17 @@ static int ads112c14_read_raw(struct iio_dev *indio_=
dev,
>  			return IIO_VAL_FRACTIONAL_LOG2;
>  		}
> =20
> +		if (chan->channel =3D=3D ADS112C14_SYS_MON_CHANNEL_SHORT) {
> +			u8 idx =3D data->sys_mon_chan_short_gain_val;
> +
> +			scale_avail =3D data->sys_mon_chan_short_scale_available[idx];
> +
> +			*val =3D scale_avail[0];
> +			*val2 =3D scale_avail[1];
> +
> +			return IIO_VAL_INT_PLUS_NANO;
> +		}
> +

[Severity: Medium]
Is it possible for a concurrent write from ads112c14_write_raw() to cause a
data race here?

Since this read side in ads112c14_read_raw() does not acquire the IIO direct
mode lock or use READ_ONCE(), the compiler could reload=20
data->sys_mon_chan_short_gain_val.

If the value gets reloaded between the assignments of *val and *val2, the
function might fetch the integer and fractional parts from different gain
configurations, returning a corrupted scale to userspace.

[ ... ]
> +static int ads112c14_write_raw(struct iio_dev *indio_dev,
> +			       struct iio_chan_spec const *chan, int val,
> +			       int val2, long mask)
> +{
[ ... ]
> +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;
> +
> +		for (u32 i =3D 0; i < ARRAY_SIZE(ads112c14_pga_gains_x10); i++) {
> +			if (val =3D=3D scale_avail[i][0] && val2 =3D=3D scale_avail[i][1]) {
> +				*gain_val =3D i;
> +				return 0;
> +			}
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-iio-adc-ti=
-ads122c14-v2-0-ceb9b0b561cb@baylibre.com?part=3D7

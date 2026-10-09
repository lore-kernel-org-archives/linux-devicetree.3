Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892862D2381
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536051; cv=none; b=MY8qwCOfBEVK+avUw1b0NX2NwK1RbK8XZedVFz8zi0bRfZv8hoFAr+01yYNfIne7wyfcKkd4m8sYo942zHvfgeH/agUSKmgfTj4pHBmaQIS5NUPBKrUqtbTpfHOQA/s+K8WGPvt7xfFGpAk8krNeJshOb3h3eAdTP3aOpKxJCyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536051; c=relaxed/simple;
	bh=Kk6iMul7Y2gZEtHd2NoJdvGC8YGSGiD9/jdBZy1P6UY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=G9oUdGIinBqJOdo62n9jp6PkQXPU63BHgDMQ5BII3OOntAQZWaXT5wkID7uWqjuXN5o7Okd6s7Mj4v0OrvMakjiH3LPqmlEIxpoqL2mE20cT8igKlzwmChBrVrz1AZOE4IHSJZdwbInGGIzcrS6ClAlCKA2mOC4g62XZRoHGxlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5699Mpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5699Mpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358DF1F000FF;
	Fri,  9 Oct 2026 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791536050;
	bh=r/Dl8mAgMO84/lF09k1kvFYO2KfKWZ2z0dLMZz6y1IA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S5699Mppi7+t26WN2vfASniE0QgTlG3+3SIkfAczYd5MTNxlh+wYwmvjI6ZY82W/9
	 dLxlMZuU03imPke4c4/79WYLzKNgsljJPADTSYJWW9ZdhvFx/jea7Cn3hdD3tuzacO
	 ABjLBjpqq2x+x2kDIf/0seeJFL2oD4MBiuGAcOz8XpCPvRyG+Y6kkXnadOqoESWfzl
	 63ukRj+BQlHVPUgxDikRsniv2lyw1rwu9d4f4/WVuYpKG+NKkWR0Fvl91sn8H1L9CR
	 W891jO0eZE/TrFJ6k1ENwXYy174C2kKJtf0pVXyJ6OMwf3XMnOiSa179qr/Bd/MHaL
	 hagRMkiGsQ7Zw==
Message-ID: <sashiko-outbox-165114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] iio: adc: ltc2497: add FA/FB line-frequency
 rejection selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Stancovici" <andrei.stancovici@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-submission-ltc2493-support-v1-v1-5-3dad1d4b152a@analog.com>
References: <20261009-submission-ltc2493-support-v1-v1-0-3dad1d4b152a@analog.com>
 <20261009-submission-ltc2493-support-v1-v1-5-3dad1d4b152a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:54:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] iio: adc: I2C DMA memory corruption via stack buffer in ltc2497_re=
sult_and_measure
- [Low] iio: data race on ddata->rejection in read_avail
--

commit 26aab6330d34e8191cc6202f7b5b3be69e9b0fb8
Author: Andrei Stancovici <andrei.stancovici@analog.com>
iio: adc: ltc2497: add FA/FB line-frequency rejection selection

This patch adds support for exposing the FA/FB line-frequency rejection
options of the LTC2499 through filter_mode on the voltage channels. It
allows selection of 50Hz, 60Hz, or both, and updates conversion times
accordingly.

Datasheet: https://www.analog.com/media/en/technical-documentation/data-she=
ets/2499fa.pdf

> diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-cor=
e.c
> index 816312bf0e90b..e5a8ab5681281 100644
> --- a/drivers/iio/adc/ltc2497-core.c
> +++ b/drivers/iio/adc/ltc2497-core.c
[ ... ]
> @@ -211,11 +218,13 @@ static int ltc2497core_read_avail(struct iio_dev *i=
ndio_dev,
>  				  const int **vals, int *type, int *length,
>  				  long mask)
>  {
> +	struct ltc2497core_driverdata *ddata =3D iio_priv(indio_dev);
> +
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SAMP_FREQ:
> -		*vals =3D ltc2497core_samp_freq_avail;
> +		*vals =3D ltc2497core_samp_freq_avail[ddata->rejection];

[Severity: Low]
Does this unguarded read of ddata->rejection in ltc2497core_read_avail() ra=
ce
with concurrent sysfs writes?

Concurrently, filter_mode sysfs writes can invoke
ltc2497core_set_filter_mode(), which modifies ddata->rejection while holding
the ddata->lock. While an out-of-bounds array access is structurally
prevented because the inner array size is fixed and resolved at compile tim=
e,
this unguarded read of shared mutable state violates kernel concurrency rul=
es
and will trigger KCSAN data race warnings.

> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> -		*length =3D ARRAY_SIZE(ltc2497core_samp_freq_avail);
> +		*length =3D ARRAY_SIZE(ltc2497core_samp_freq_avail[ddata->rejection]);
>  		return IIO_AVAIL_LIST;
> =20
>  	default:
[ ... ]
> diff --git a/drivers/iio/adc/ltc2497.c b/drivers/iio/adc/ltc2497.c
> index a655b04e2454b..0df2ad9b32437 100644
> --- a/drivers/iio/adc/ltc2497.c
> +++ b/drivers/iio/adc/ltc2497.c
[ ... ]
> @@ -86,32 +103,34 @@ static int ltc2497_result_and_measure(struct ltc2497=
core_driverdata *ddata,
[ ... ]
> -	if (ddata->chip_info->has_temp || ddata->chip_info->has_speed_mode) {
> +	if (ddata->chip_info->has_temp || ddata->chip_info->has_speed_mode ||
> +	    ddata->chip_info->has_rejection_mode) {
> +		u8 rejection_bits =3D ltc2497_rejection_bits(ddata->rejection);
>  		u8 cmd[2];
> =20
>  		if (address =3D=3D LTC2497_TEMP_ADDR) {
>  			cmd[0] =3D LTC2497_ENABLE | LTC2497_CONFIG_DEFAULT;
> -			cmd[1] =3D LTC2499_EN2 | LTC2499_IM;
> +			cmd[1] =3D LTC2499_EN2 | LTC2499_IM | rejection_bits;
>  		} else {
>  			cmd[0] =3D LTC2497_ENABLE | address;
> -			cmd[1] =3D LTC2499_EN2;
> +			cmd[1] =3D LTC2499_EN2 | rejection_bits;
>  			if (ddata->speed_2x)
>  				cmd[1] |=3D LTC2499_SPD;
>  		}
> =20
>  		ret =3D i2c_master_send(st->client, cmd, sizeof(cmd));

[Severity: High]
This problem wasn't introduced by this patch, but since the patch modifies
this exact block and relies on it, does this code pass an unaligned stack
buffer for DMA I/O?

In ltc2497_result_and_measure(), the 2-byte array cmd is allocated on the
stack and populated with configuration bits. This array is passed directly =
to
i2c_master_send(). If the underlying I2C master driver uses DMA for the
transfer, mapping a stack address is illegal (especially with
CONFIG_VMAP_STACK) and can lead to memory corruption, panics, or silent
failures.

The driver properly aligns its receive buffer (st->data) with
__aligned(IIO_DMA_MINALIGN), demonstrating awareness of this requirement, b=
ut
overlooks the transmit buffer.

>  		if (ret < 0) {
>  			dev_err(&st->client->dev, "i2c transfer failed: %pe\n",
>  				ERR_PTR(ret));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-submission=
-ltc2493-support-v1-v1-0-3dad1d4b152a@analog.com?part=3D5

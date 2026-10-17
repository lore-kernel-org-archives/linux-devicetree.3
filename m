Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDB3381EB4
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 02:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203394; cv=none; b=KVp+wy//qQbpEcDnE+2CArmKzncIj18pAMVBbWepZbYt5EIhHoMdg4UpxmROuoBMmk7sud5h8zqHQVRHdGSYUlQmDZiTT1oGicf4wuwKoHgE40/ofB12OKBie0ScFgN7UX7Ay4UQaY1F9rL5Kjn37KiCSf8xs0ig1ERZPxqAWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203394; c=relaxed/simple;
	bh=3HVZ4TtWfMf7n1Zi2cUtVxuMq6PdnxbhNerSbgZXak0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ve/LCg0czLBnTMsBWH+UJa6gssGu8UK+gnBlLKLuF5UcKHq8SrgwA/q0UsGyOBS+p33sgjnTua/KHQcFA8udO1P90XAkukVbI0VcVa6cLotepGCTFmKvirvuoNyWp9cgA/SttK/7WyxE0fvAUzuj1AMz07s/ssNpu5j7CRT0oOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HF3DkpKV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HF3DkpKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995FD1F000C4;
	Sat, 17 Oct 2026 02:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792203391;
	bh=R6st89F7q+Kt6Tr8JIOHWNpJ3Hz0z1k1fI9+DR971D0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HF3DkpKVX3Sg11TWjoWqXml1lIrPfNSPGkmF94EISZerlPpKfcw05pD3FnsfRAxk2
	 x9pzu9KGedhvSrQoPu2XS9IljCfod5ckjYILznPJEFOCAne/zCKRY+N+CGii/2nlKZ
	 GBWptWtn/et9eEczyBDFKL4aA3h6h1sMF+jz8r2hKHSPM2fLyEiQhqXlYYaX2gPlzL
	 qbTGw3EH4L/1kGQACsBCOMEkUmjiuCM2y3R1Itn6JJijE63nFEjA2w3dTTs1o/20w5
	 CMmCeCgMkuwfR1+OfY3p/M9PIG5p7PeDPcMMWfHktQKEQ9Q2+jwdh9hi3YzllX81AZ
	 3DMBntU9CjFaQ==
Message-ID: <sashiko-outbox-175200@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/15] iio: adc: ad4134: Add support for digital
 filter type selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <a547bfc6d0b41413818f7048d4a685fbb43b6537.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <a547bfc6d0b41413818f7048d4a685fbb43b6537.1792200021.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 02:16:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: adc: ad4134: undocumented sinc6 filter_type and sysfs ABI attr=
ibutes
--

commit f7364f2a84e232ee97a6956a54b434e35fd7f79d
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Add support for digital filter type selection

This commit adds per-channel digital filter type configuration for the AD41=
34
ADC by exposing filter_type and filter_type_available sysfs attributes via
IIO_ENUM.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 91a7c21077709..b245001d45517 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -80,19 +83,18 @@
[ ... ]
> +enum ad4134_filter_type {
> +	AD4134_WIDEBAND,
> +	AD4134_SINC6,
> +	AD4134_SINC3,
> +	AD4134_SINC3_REJ60,
> +};
> =20
> -static const struct iio_chan_spec ad4134_chan_set[] =3D {
> -	AD4134_CHANNEL(0),
> -	AD4134_CHANNEL(1),
> -	AD4134_CHANNEL(2),
> -	AD4134_CHANNEL(3),
> +static const char * const ad4134_filt_names[] =3D {
> +	[AD4134_WIDEBAND] =3D "wideband",
> +	[AD4134_SINC6] =3D "sinc6",
> +	[AD4134_SINC3] =3D "sinc3",
> +	[AD4134_SINC3_REJ60] =3D "sinc3+rej60",
>  };
> =20
>  struct ad4134_state {
> @@ -115,6 +117,73 @@ struct ad4134_state {
>  	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
>  };
> =20
[ ... ]
> +static const struct iio_enum ad4134_filter_type_enum =3D {
> +	.items =3D ad4134_filt_names,
> +	.num_items =3D ARRAY_SIZE(ad4134_filt_names),
> +	.get =3D ad4134_get_filter_type,
> +	.set =3D ad4134_set_filter_type,
> +};
> +
> +static const struct iio_chan_spec_ext_info ad4134_filter_type_ext_info[]=
 =3D {
> +	IIO_ENUM("filter_type", IIO_SEPARATE, &ad4134_filter_type_enum),
> +	IIO_ENUM_AVAILABLE("filter_type", IIO_SEPARATE, &ad4134_filter_type_enu=
m),
> +	{ }
> +};
> +
> +#define AD4134_CHANNEL(_index) {						\
> +	.type =3D IIO_VOLTAGE,							\
> +	.indexed =3D 1,								\
> +	.channel =3D (_index),							\
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),				\
> +	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),			\
> +	.ext_info =3D ad4134_filter_type_ext_info,				\
> +}

[Severity: Low]
In drivers/iio/adc/ad4134.c, ad4134_filt_names[] introduces "sinc6" as a new
filter_type string option when the driver probes and registers
ad4134_chan_set[].

In addition, attaching ad4134_filter_type_ext_info[] with IIO_SEPARATE to
indexed non-differential IIO_VOLTAGE channels in AD4134_CHANNEL() exposes
/sys/bus/iio/devices/iio:deviceX/in_voltageY_filter_type and
/sys/bus/iio/devices/iio:deviceX/in_voltageY_filter_type_available to
userspace.

Currently, Documentation/ABI/testing/sysfs-bus-iio only lists What entries
for filter_type, in_voltageY-voltageZ_filter_type, filter_type_available, a=
nd
in_voltage-voltage_filter_type_available, and its list of valid filter types
does not include "sinc6".

Should Documentation/ABI/testing/sysfs-bus-iio be updated to document the
"sinc6" filter option and the in_voltageY_filter_type and
in_voltageY_filter_type_available attributes?

> +
> +static const struct iio_chan_spec ad4134_chan_set[] =3D {
> +	AD4134_CHANNEL(0),
> +	AD4134_CHANNEL(1),
> +	AD4134_CHANNEL(2),
> +	AD4134_CHANNEL(3),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792200021.gi=
t.marcelo.schmitt@analog.com?part=3D8

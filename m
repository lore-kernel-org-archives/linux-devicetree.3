Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B138C40C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555895; cv=none; b=L5F508RhNmpHatPWLeZOFZIPbKv3TOI9H0G7srd5ELqePEn2YoWhyzmqpsn5VV7ZEHB724e/lel/JOEDXy07uHvLOMaQ+6FjcN3sq/g8dqpZoflqUhcyoQCHt/7g3pOAKxca1hFfZ7aNNb9E8MuiTnvA51Tk/n/t7sCKvMjKa20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555895; c=relaxed/simple;
	bh=ykpHhjJJvpxScyMoI/YXobUziGfo61PcdPzHkIPyVgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IISBT2lKqEP8vo8qgQHTN8E+SMO6JrBvTsLK/12K+Ki6H+huUgmAZyDHZkdCZ7J2fgDXuTvMCOO2JsO/hZBNH++9pdkM296vyAix2w2Au+VAQPV0wGkl6Az6S3zzyTI4y5beWnWLSMzn6jzT77CYo971W1U9eNN29yctPiRswGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouyBppb9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouyBppb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA771F00A3A;
	Mon, 20 Jul 2026 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555893;
	bh=x+Xb5Oi1bm6woSsV5aV94z5lZDnOhuBNfQFzUzi73Vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ouyBppb9Xg3K7UXFsuQmL/BFC5ff1eF4cf5ad7sDuImFt1H952ATVz3nAQ7OxJm5Z
	 EQIfCzRORU1/TEgqbenLgLKzeTitKG1yQtH3GXW0uB0KmnKQTHglqb3F/ybP8NeZf8
	 GK5oIolp+7RPU3hIrYV/8I3iAYnvLXL54DdRqx69VYbV7/wFUQPJVbeBFLHdnIqJgN
	 nfXkMYMV/Sk9ers5ZcBVTsravXKzEgDJW/tuTtBdoVxJuGiG6DyqBpNkMGl6bOIN29
	 JdzOZqyxgWlBrGId5EUyfrwrAGmOiG4Pn5S+Z9QlevSBv/HwpNr+c/5ha3pv25WI3A
	 DSgB90F3aA2Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ad4080: add support for AD4883
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720133707.103366-3-antoniu.miclaus@analog.com>
References: <20260720133707.103366-1-antoniu.miclaus@analog.com>
 <20260720133707.103366-3-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:58:13 +0000
Message-Id: <20260720135813.7EA771F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `ad4080_get_scale` function calculates the fractional part of =
the scale in micro units but returns `IIO_VAL_INT_PLUS_NANO`, causing the u=
serspace scale value to be off by a factor of 1000.
--

--- Patch [2]: [PATCH 2/2] iio: adc: ad4080: add support for AD4883 ---
commit 1f80e540484a260f71b5515f8af8d43748391d9e
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: adc: ad4080: add support for AD4883

This commit adds support for the AD4883, a dual-channel, 16-bit, 40 MSPS
SAR ADC. It shares the register map and SPI interface with the AD4080
family and provides two independent ADC channels.

> diff --git a/drivers/iio/adc/ad4080.c b/drivers/iio/adc/ad4080.c
> index c7ecf6971be45..543728c7e88c0 100644
> --- a/drivers/iio/adc/ad4080.c
> +++ b/drivers/iio/adc/ad4080.c

[ ... ]

> @@ -646,6 +652,16 @@ static const struct ad4080_chip_info ad4880_chip_inf=
o =3D {
>  	.lvds_cnv_clk_cnt_max =3D AD4080_LVDS_CNV_CLK_CNT_MAX,
>  };
> =20
> +static const struct ad4080_chip_info ad4883_chip_info =3D {
> +	.name =3D "ad4883",
> +	.product_id =3D AD4883_CHIP_ID,
> +	.scale_table =3D ad4080_scale_table,

[Severity: High]
This isn't a bug introduced by this patch, but looking at how the scale tab=
le
is used in ad4080_get_scale(), is there a mismatch in the units returned?

drivers/iio/adc/ad4080.c:ad4080_get_scale() {
	...
	tmp =3D (st->info->scale_table[0][0] * 1000000ULL) >>
		    st->info->channels[0].scan_type.realbits;
	*val =3D tmp / 1000000;
	*val2 =3D tmp % 1000000;

	return IIO_VAL_INT_PLUS_NANO;
}

Since the fractional part is calculated using modulo 1000000 (micro units)
but returned as IIO_VAL_INT_PLUS_NANO, the IIO core will format it as a
nano-scale value. Does this cause the scale exposed to userspace to be off
by a factor of 1000?

Should this return IIO_VAL_INT_PLUS_MICRO instead, or calculate with
1000000000ULL to match the NANO return type?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133707.1033=
66-1-antoniu.miclaus@analog.com?part=3D2

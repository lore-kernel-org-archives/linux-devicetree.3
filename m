Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05413A7F45
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214104; cv=none; b=C2FsFf0f+a+WnSuwvlgpKGyQdIrEnpSAvXVaSk/XL1/N/cqGw4mI6FJ4e+nsjYygW3GTgqckPGq3NepcwJ9feuv3MRsx39Z9gU8ZAxc0eqj2xxkmPw5gN4rxHn0GkpYW4v2Vsl/nRHKog7upntzBVoTmTXu/2Gi3URpYfihmwCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214104; c=relaxed/simple;
	bh=Hh/LRAxeEQIMUMuvMagzkxbkxylrS/4NwsNs6dpo6hU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FlHr16fr5bjd0ZScGpd1Plr/HJpi9xcoAVe3USgYdmys8Rz82NEgLEK8Sk2YAr9D89k44fGggCG0/6MtMT59ys7MVVWHYn6ZYhUK0Gv878PrR2Un6KihwK8DMqbm9HcIOS4qyTs4pFcjvDyIMNRuvNrDDYrSCWDuhAdILzdTaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVmp/729; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVmp/729"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA781F000E9;
	Tue, 23 Jun 2026 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782214103;
	bh=cRb5IXoCmrNe++7Hxpet5EZShce18Oi1bkBceawwAqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cVmp/729TdsnIE8yOrM5IGKZSO/92zygvVZ3C36A3MkovelcFrv1+lLCzmSW/bZHU
	 rnDnrk//qA7TjiSUlL4SjS9Xs06IRaeQjdc8eCaD4a0MadGNtQkogeopFmrMlQMEWI
	 wXtazgmWio5elRjpFZmZxiSHQ/WHJrpfSXHmDiEMqLuDDPCUNm2a9rRppKo44ZiYUn
	 YML89rW5VafK6bi+3igSj4TYS6SpcxwJXFvSJYFWtY0auG3Hy6Mrzs/46snetW5PBT
	 phmcbFCiq2xTbVGQDOl+0WU6BVGoGfrTN3qEq38F0SpAZxY5wZnSDvAGGP19Nksu6C
	 4bGtb0AwZ0ZwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/12] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623105944.128840-4-varshini.rajendran@microchip.com>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-4-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:28:22 +0000
Message-Id: <20260623112823.3AA781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized touch channel indices incorrectly configure regular =
channel 0 as a touchscreen channel, breaking IIO buffered reads.
- [High] Temperature channel scan_index (31) exceeds the defined max_index =
(25), breaking IIO bitmap validations and hardware triggers.
--

commit 2d567bf99b76168b7ea132082c84ddd5029c1706
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65

Add support for sama7d65 ADC. The differences are highlighted with the
compatible. The calibration data layout is the main difference.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index b569d175f4c3d..237d339f342a1 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
[ ... ]
> @@ -768,6 +778,24 @@ static const struct at91_adc_platform sama7g5_platfo=
rm =3D {
>  	.temp_calib_layout =3D &sama7g5_temp_calib,
>  };
> =20
> +static const struct at91_adc_platform sama7d65_platform =3D {
> +	.layout =3D &sama7g5_layout,
> +	.adc_channels =3D &at91_sama7g5_adc_channels,
> +	.nr_channels =3D AT91_SAMA7G5_SINGLE_CHAN_CNT +
> +		       AT91_SAMA7G5_DIFF_CHAN_CNT +
> +		       AT91_SAMA7G5_TEMP_CHAN_CNT,

[Severity: High]
This isn't a bug introduced by this patch, but inherited from the SAMA7G5
implementation. Does omitting the touch channel indices cause an issue for
channel 0?

By omitting touch_chan_x and similar fields, they default to 0. Later,
during probe, this zero-initialized value is used:

at91_adc_probe() {
    ...
    bitmap_set(&st->touch_st.channels_bitmask,
               st->soc_info.platform->touch_chan_x, 1);
    ...
}

Will this cause the driver to incorrectly set bit 0 in the touchscreen
bitmask, diverting regular channel 0 captures into the touchscreen logic
and breaking IIO buffered reads for that channel?

> +	.max_channels =3D ARRAY_SIZE(at91_sama7g5_adc_channels),
> +	.max_index =3D AT91_SAMA7G5_MAX_CHAN_IDX,

[Severity: High]
This is also a pre-existing issue inherited from the SAMA7G5 implementation,
but does this max_index configuration conflict with the temperature channel?

The max_index is configured to 25 (AT91_SAMA7G5_MAX_CHAN_IDX), but the
temperature channel has a scan_index of 31. This mismatch appears to break
IIO bitmap validations and hardware triggers.

For instance, in the hardware enablement path:

at91_adc_active_scan_mask_to_reg() {
    ...
    for_each_set_bit(bit, indio_dev->active_scan_mask,
                     indio_dev->num_channels) {
    ...
    return mask & GENMASK(st->soc_info.platform->nr_channels, 0);
}

This applies a 26-bit mask, which permanently ignores the temperature chann=
el
at index 31. Does this structurally break the temperature channel for IIO
buffered reads by causing the core to expect data that the driver never
fetches?

> +	.hw_trig_cnt =3D AT91_SAMA7G5_HW_TRIG_CNT,
> +	.osr_mask =3D GENMASK(18, 16),
> +	.oversampling_avail =3D { 1, 4, 16, 64, 256, },
> +	.oversampling_avail_no =3D 5,
> +	.chan_realbits =3D 16,
> +	.temp_sensor =3D true,
> +	.temp_chan =3D AT91_SAMA7G5_ADC_TEMP_CHANNEL,
> +	.temp_calib_layout =3D &sama7d65_temp_calib,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623105944.1288=
40-1-varshini.rajendran@microchip.com?part=3D3

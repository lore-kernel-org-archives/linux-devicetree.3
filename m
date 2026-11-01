Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543047;
	b=GKGBoFCeLLOkUbJ8L5ouXFX01IP2M0AhwbcJmO1Luw1el8l2Xt6v491b41MJEMzE6zQe
	 je4Gi9066D65ecNacFXGg7GIWzWphZR07dUIfJzqfgADhBm9nRYCVQdbB4MA0U+lGptTG
	 r0JHv8Sl7ihFZr3fovmTsgJZe0cEduoDA2fmYGJFshi/jm1K2j0OUfaVk4lVXGTBI0FA1
	 N9Sdgusuqg9RBzMkPxiPkTCiGBabKtxjrPZLWKdtkZFGjU/BB37XBEjc2fYnLVHX9im+3
	 ez1vObBbSnCY/Hvn2Qns2Q/fFjxJezu1ed69qPSAiBYfhWFLwU8cksqffEKFR8MZ8gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543047;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N3ZziCSifm9zfTJgDFlF/rZ371T2KLzvwFUrfN4eMo4=;
	b=yjF/FCobObLwEwYGCT47iAL4eFgy8QXYpng9+cCvrshsq3aaEiYgvSadomLOpvlzaoWL
	 3viKbOuaRZyWQTghB+pweR+M8+N+dwDbFj1hP9sxoZQCFEFNAMMvwEQW+9nyk5cuyZg4W
	 aBQSTsMKT54R5vGn4SFbrAAjrtDVZCJOSXYz8RTHRvewWF6/m41Wud2+I6hMsxlxc+raG
	 TRSXpgVcsTKqpMmteKTpxF7DbUBaQpuVZLo0IoCkHtW6/3paBrFYFiPX+Wk+segjVBwHe
	 3uZKTEUiX+TYHEoX51Jht+caoCkrjHHEE41q68PnQxq3LW452rWGFWROI584rWVemcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgbV+9iX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AD606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgbV+9iX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673741F000C1;
	Sun,  1 Nov 2026 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793543046;
	bh=N3ZziCSifm9zfTJgDFlF/rZ371T2KLzvwFUrfN4eMo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IgbV+9iXxe/kdMNyd7HWd/B0xtGa2QFakEJXkdVoMm5VtIkBWr+QSJ0VwWXn42B3R
	 da0yIViJ9y0TehztEFe3DMuM9QLVDWhC7f6DGGO5OD233xKIxU6MTVvXUbaqAr5fKC
	 AQ89UhoZVE1qyV/lUKxMm2BTKDBKuVopMqqMJa8bPK1HUhE3vy367/t7cTTXOoU/Ji
	 BYEkQkpAgdoxanUwp4jo3dhoiQ6tl2fUjG0vRuizQlZHI+s78QUpzM6utR4PEqcy6O
	 dFKG9IZTdIJuCvFU6Gaufn4ORFS5xhhqahvrmNpWIrytuxq3pvuNBiuwRrFcwvJZWV
	 j3ye3XdI2XgxA==
Message-ID: <sashiko-outbox-192447@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101141507.119186-3-clamor95@gmail.com>
References: <20261101141507.119186-1-clamor95@gmail.com>
 <20261101141507.119186-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 14:24:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iio: light: ltr501: scan_index mismatch breaks ltr501_trigger_hand=
ler()
- [Medium] iio: light: ltr501: missing IIO_CHAN_INFO_SAMP_FREQ in ltr659_ch=
annels
- [Medium] iio: light: ltr501: unconditional ALS register accesses in ltr50=
1_init()
--

commit c2f0d77abdcaeb0f7ea57d758703f90ae8398569
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

This commit adds support for the Lite-On LTR-659PS-01 proximity-only sensor
to the ltr501 IIO driver.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 302be2fc314c5..5cc1141322ad5 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -649,6 +650,26 @@ static const struct iio_chan_spec ltr301_channels[] =
=3D {
>  	IIO_CHAN_SOFT_TIMESTAMP(2),
>  };
> =20
> +static const struct iio_chan_spec ltr659_channels[] =3D {
> +	{
> +		.type =3D IIO_PROXIMITY,
> +		.address =3D LTR501_PS_DATA,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index =3D 0,

[Severity: High]
Does assigning scan_index 0 here break triggered buffer capture for ltr659?

In ltr501_trigger_handler(), active_scan_mask bits 0 and 1 are hardcoded for
the ALS channels, while only bit 2 is treated as the proximity channel:

	if (test_bit(0, indio_dev->active_scan_mask) ||
	    test_bit(1, indio_dev->active_scan_mask))
		mask |=3D LTR501_STATUS_ALS_RDY;
	if (test_bit(2, indio_dev->active_scan_mask))
		mask |=3D LTR501_STATUS_PS_RDY;

	ret =3D ltr501_drdy(data, mask);
	if (ret < 0)
		goto done;

	if (mask & LTR501_STATUS_ALS_RDY) {
		ret =3D regmap_bulk_read(data->regmap, LTR501_ALS_DATA1,
				       als_buf, sizeof(als_buf));
		if (ret < 0)
			goto done;
		if (test_bit(0, indio_dev->active_scan_mask))
			scan.channels[j++] =3D le16_to_cpu(als_buf[1]);

When buffered capture is enabled on ltr659, bit 0 is set in active_scan_mask
and bit 2 is never set, so ltr501_trigger_handler() waits on
LTR501_STATUS_ALS_RDY and reads LTR501_ALS_DATA1 instead of reading
LTR501_PS_DATA.

> +		.scan_type =3D {
> +			.sign =3D 'u',
> +			.realbits =3D 11,
> +			.storagebits =3D 16,
> +			.endianness =3D IIO_CPU,
> +		},
> +		.event_spec =3D ltr501_pxs_event_spec,
> +		.num_event_specs =3D ARRAY_SIZE(ltr501_pxs_event_spec),
> +		.ext_info =3D ltr501_ext_info,
> +	},
> +	IIO_CHAN_SOFT_TIMESTAMP(1),
> +};
> +
>  static int ltr501_read_info_raw(struct ltr501_data *data,
>  				struct iio_chan_spec const *chan,
>  				int *val)
> @@ -1178,6 +1199,12 @@ static struct attribute *ltr301_attributes[] =3D {
>  	NULL
>  };
> =20
> +static struct attribute *ltr659_attributes[] =3D {
> +	&iio_dev_attr_in_proximity_scale_available.dev_attr.attr,
> +	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
> +	NULL
> +};

[Severity: Medium]
Should ltr659_channels also set BIT(IIO_CHAN_INFO_SAMP_FREQ) on the
IIO_PROXIMITY channel?

ltr659_attributes exposes sampling_frequency_available in sysfs, and
ltr501_read_raw() and __ltr501_write_raw() support IIO_CHAN_INFO_SAMP_FREQ =
for
IIO_PROXIMITY, but ltr659_channels only sets BIT(IIO_CHAN_INFO_RAW) and
BIT(IIO_CHAN_INFO_SCALE). Without BIT(IIO_CHAN_INFO_SAMP_FREQ) in the chann=
el
spec, no sampling_frequency sysfs attribute is created for ltr659.

[ ... ]

> @@ -1283,6 +1330,15 @@ static const struct ltr501_chip_info ltr501_chip_i=
nfo_tbl[] =3D {
>  		.channels =3D ltr501_channels,
>  		.no_channels =3D ARRAY_SIZE(ltr501_channels),
>  	},
> +	[ltr659] =3D {
> +		.partid =3D 0x09,
> +		.ps_gain =3D ltr559_ps_gain_tbl,
> +		.ps_gain_tbl_size =3D ARRAY_SIZE(ltr559_ps_gain_tbl),
> +		.info =3D &ltr659_info,
> +		.info_no_irq =3D &ltr659_info_no_irq,
> +		.channels =3D ltr659_channels,
> +		.no_channels =3D ARRAY_SIZE(ltr659_channels),
> +	},
>  };
> =20
>  static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 p=
s_val)

[Severity: Medium]
The commit message notes that ALS registers are marked as reserved on the
LTR-659PS-01 and interactions with them are discouraged, but won't
ltr501_init() and ltr501_write_contr() still read and write those registers?

During probe, ltr501_init() unconditionally reads LTR501_ALS_CONTR, calls
ltr501_read_intr_prst(data, IIO_INTENSITY, &data->als_period) which reads t=
he
ALS persistence field and LTR501_ALS_MEAS_RATE, and then calls
ltr501_write_contr():

static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 ps_v=
al)
{
	int ret;

	ret =3D regmap_write(data->regmap, LTR501_ALS_CONTR, als_val);
	if (ret < 0)
		return ret;

	return regmap_write(data->regmap, LTR501_PS_CONTR, ps_val);
}

ltr501_write_contr() also writes LTR501_ALS_CONTR during ltr501_powerdown()
and ltr501_resume(). Should these ALS register accesses be skipped when
chip_info->als_gain is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101141507.1191=
86-1-clamor95@gmail.com?part=3D2

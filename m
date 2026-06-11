Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CD38E11C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 22:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217650; cv=none; b=uOH4hkaj+elSEDlxM4S/yAviCOx/x5sBc/gRx9R5eebwqKZ6z7Ye8hehOkG+u0heeL904rVVjwTuZfPUGw9DqEKKlPtmTSfX9IHA8Cs7C5tvEDN6lZL6M23nTATFD8Npc0ILMHjYIU8WbvOgOr4TpQZoSs4R/Tkk9NhMp2o0D6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217650; c=relaxed/simple;
	bh=LPaifwzr1kwIKRE1G1X9Je3Cc5jEXcXKcCEkGYlpgLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FTNgpTYLJ5j3zJJb9SN67ai5Z35A7lc+t0rKCaeB3inHUqtfxBuMK16w2pqH16Cz7gKf9p3oli7H5nVJmdWkXF+MrytP1N7kqUZBGPpT4D2flGY+IrHR3ISiKE5TNQ3bojOs+4QEqkBgrm2veSyMO1XBsJnWeYMiyTqoopUhoXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyM+0i2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyM+0i2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087441F000E9;
	Thu, 11 Jun 2026 22:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781217648;
	bh=9rL3ON7ka7V+G4vyGCumFrNG1a8fevznknFV6f73Wt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kyM+0i2T6/CQQZklOZzby8GFxAh0J5c9SktdD4L1bPynC/n8Os7vU6m3vdg4DX4pf
	 kMrHX+846BjR9c6dLyD9agJeg/+uwez/fynGDgr2ZyxhWQSlY1ub2wI6/LQrkmVnTD
	 uvy6fW2PrVImBm8lnGYmhkdrD0ZROjdz6F/l+1p9AZ7PbDgkASbCK/qUEkwrA3IuDP
	 a3S4XXd+h0URLKCT5FzcD9D33k1rnEOvmsQninijs9fG+qolrYNcBeL2Y8TDy9A3aM
	 28eqJeZW8zwAI6uevT+RNZhgEw+8KKCh7TOwXPjkzQsSlA8pHFCrOs8LyLg8pxW5F1
	 qcs/w9J6Gfc5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611222738.2035062-6-salih.erim@amd.com>
References: <20260611222738.2035062-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 22:40:47 +0000
Message-Id: <20260611224048.087441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Inconsistent IIO UAPI and incorrect attribute scoping for oversa=
mpling ratio.
- [Medium] Software cache of the oversampling ratio is out of sync with har=
dware state.
--

commit 274d65ae0591be4c40c4e7a8107c4b94a62ac67c
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support
   =20
Add support for reading and writing the oversampling ratio through
the IIO oversampling_ratio attribute. The hardware supports averaging
2, 4, 8, or 16 samples, plus a ratio of 1 (no averaging).

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 20fd3a87d448e..fa8f0dc868af2 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c

[ ... ]

> @@ -857,7 +996,11 @@ static int sysmon_parse_fw(struct iio_dev *indio_dev=
, struct device *dev,
>  			.address =3D SYSMON_TEMP_SAT_BASE +
>  				   (reg - 1) * SYSMON_REG_STRIDE,
>  			.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
> -			.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),
> +			.info_mask_shared_by_type =3D
> +				BIT(IIO_CHAN_INFO_SCALE) |
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
> +			.info_mask_shared_by_type_available =3D
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
>  			.datasheet_name =3D label,

[Severity: Medium]
Does this inconsistently expose the oversampling attribute?

The commit adds BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) to
info_mask_shared_by_type for the dynamic satellite temperature channels her=
e,
but it appears to be omitted from the statically defined core temperature
channels (temp_channels_no_events and temp_channels_with_events).

Because of IIO's attribute merging behavior, if no satellite channels are
defined in the Device Tree, the in_temp_oversampling_ratio attribute might
not be created at all.

Furthermore, if satellite channels are present, the attribute is created and
appears to apply to all in_temp channels, including the core sensor. Howeve=
r,
the hardware register configured (SYSMON_CONFIG_TEMP_SAT_OSR) seems to
indicate oversampling only applies to the satellite sensors.

Could this create an inconsistent UAPI that either hides the feature when no
satellites are present, or misleadingly claims it applies to the core
temperature sensor?

[ ... ]

> @@ -904,6 +1047,8 @@ int sysmon_core_probe(struct device *dev, struct reg=
map *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Are these software cache variables out of sync with the actual hardware sta=
te?

The driver initializes the software cache to 1 (no averaging) here, but it
does not appear to read the actual hardware configuration from the
SYSMON_CONFIG register, nor does it explicitly write this default state of 1
to the hardware.

If the device was previously configured by a bootloader, firmware, or a pri=
or
kernel to use a different oversampling ratio, will the sysfs attribute
incorrectly report 1 while the hardware actively averages multiple samples?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611222738.2035=
062-1-salih.erim@amd.com?part=3D5

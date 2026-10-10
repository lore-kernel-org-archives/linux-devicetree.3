Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD243B0AED
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616060; cv=none; b=OeVGYaJlW6joUdUjjloNrOh5//CIQSV2SqHJkaZLCh79GaDRtdOjpPttt4KXgVLduItp95Yjelix6xiOwmjGHjgrlWPb00Ix36i+KuDHfFGXVhKq0NugB4xQsCqvU0lI7mfnT5EnrhdYrkLnyg/rtF/zTqaIMNvhYsBeirDVXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616060; c=relaxed/simple;
	bh=rDBppS0h2L+sU4QMBoht41wNj9mhPyXFPARNm8iXrQs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MHyjOvx1lECu1FUA1yCnmNynhJoQaD74T5ux8zlJgBbQvLvfooNHPsCFoJ+YQwUFOGVZc01DFcsDLACMl+QCWyaxTuchMpB3Y7QM9nxBM4oMArSUUvM5Mlw7qKeOImvcU7LpCf4Ol/TKTQJ2v/2wMNLAf3UyYeTGK/l25qIVYR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3OyuP3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3OyuP3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731731F000FF;
	Sat, 10 Oct 2026 07:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791616058;
	bh=vt/MzOpjgmnkcOGZCmTRzbgBL0op5DKrZE48IHjnAm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N3OyuP3wKPul7glIo8xOs8IZv5UEQFS3W+J4kARLYpv27+nMkxWWVuyTODrTk+eM9
	 sTkD8voThSiwCH/L1e3kHRQwTG9fllSTMdT8tHvStjG6Z0/gWRcdg7BJUQRRl0jDLw
	 RLxvekKDDFBtOw1i7Jem2atfpOqKLT63URJjh2vFxWc3aQaRkDjbIxpMryvVso072H
	 VOIHzQljeiW4opfW6R7EgjQUUqKoxyLBawpVgF0UIWNTvj6EyCVnun+Dbq+RreKKou
	 qBOM7BowwZdNpfOJO5GEovoosHqzk5qkZCpdEwCuRIPaULlqKLASEaicj8Z1a0TFcF
	 xJ4an/qjMuQ6A==
Message-ID: <sashiko-outbox-166294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/10] iio: adc: ti-ads1262: support per-channel
 sampling frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261010-ads126x-v5-4-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
 <20261010-ads126x-v5-4-49e331cb2fed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 07:07:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: adc: ti-ads1262: out-of-bounds access on st->channels for tim=
estamp channel
--

commit 7618e3d1bfd0f75640c3a335d284574aab75861b
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support per-channel sampling frequency

This commit adds per-channel sampling frequency support to the
ti-ads1262 driver. It also assigns the "available" attribute
per-channel in preparation for per-filter availability support.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index a54f78e88012c..7a6fa009ddadc 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> @@ -436,11 +513,19 @@ static int ads1262_wait_for_conversion(struct ads12=
62 *st)
>  static int ads1262_channel_enable(struct ads1262 *st,
>  				  const struct iio_chan_spec *spec)
>  {
> +	struct ads1262_channel *chan =3D &st->channels[spec->scan_index];
> +	int ret;
> +

[Severity: High]
Does this cause an out-of-bounds array access if this function is called for
the soft timestamp channel?

Because st->channels is allocated without space for the timestamp channel,
the timestamp channel is assigned a scan_index equal to st->num_channels,
which is one element past the end of the array.

When triggered buffer sampling is introduced in the follow-up patches,
iio_for_each_active_channel() iterates over all bits in the active scan mas=
k,
including the soft timestamp channel if enabled by userspace.

If the timestamp channel is passed to the preparation functions and reaches
here, it looks like this will read out-of-bounds to get chan->data_rate,
and then send corrupted configuration commands to the hardware via
regmap_update_bits().

>  	guard(mutex)(&st->xfer_lock);
>  	guard(mutex)(&st->chan_lock);
> =20
> +	ret =3D regmap_update_bits(st->regmap, ADS1262_MODE2_REG,
> +				 ADS1262_MODE2_DR_MASK,
> +				 FIELD_PREP(ADS1262_MODE2_DR_MASK, chan->data_rate));
> +	if (ret)
> +		return ret;
> +
>  	return regmap_update_bits(st->regmap, ADS1262_INPMUX_REG,
>  				  ADS1262_INPMUX_MUXN_MASK |
>  				  ADS1262_INPMUX_MUXP_MASK,
[ ... ]
> @@ -744,9 +951,18 @@ static int ads1262_parse_channels(struct iio_dev *in=
dio_dev)
>  	if (!chan_specs)
>  		return -ENOMEM;
> =20
> +	st->num_channels =3D num_fw_channels + ADS1262_MON_CHANNEL_COUNT;
> +	st->channels =3D devm_kcalloc(dev, st->num_channels, sizeof(*st->channe=
ls),
> +				    GFP_KERNEL);
> +	if (!st->channels)
> +		return -ENOMEM;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ads126x-v5=
-0-49e331cb2fed@gmail.com?part=3D4

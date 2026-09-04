Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E64AEBD6
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533118; cv=none; b=YQzQHCdUON5lGhT3VrwPe+Ge4JdhxTERVi8QSUbY0WoLctzrzZ2DSnAIUCvtkrgh2Negbrtn6MXJuvb3CYP+WtMJsMIzy6hGggBtj9ToCmmpBPd7tIRR8UVMWaD1mgtGO/5yEI7oBQ9mR7lWG4XOq6rr4fSRegDwrS4O8+MsZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533118; c=relaxed/simple;
	bh=5V15Ws05yKIg1hoFH+PitlmvLjw4j9foTYCESi9P8TQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KHaAi/O9h6wro5T2blV77Dx1a+MZ2/63qPYQoOdkcJzbQV0BTjc7LrdVSMfiuKACQjLHA4GtNBfcTwdAP8m3BRKtnfPqCUeH3VybuSywZ22ruwgmcypEVFFkNR+C08ylnVj/2YXfJdh1l9ARHKxYM0bzk6n/d3WGqvIQmoA5RRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Df5/SdWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Df5/SdWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787F61F00A3D;
	Fri,  4 Sep 2026 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533115;
	bh=SjsY4zxwRBBNUwX/R45Z/vofCmesEk0B36GP8LjelGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Df5/SdWGW4Qr9XxFoznwwws2X/CRYfb9K0SYdYDSNOsWamASWpGxRlTKjlAwLzIS+
	 zXohfH8xVv9iZhg9RUsvpfgDnQM0EYiCSYv8+86jTcM1OGHjjK2grY4VI+nUfCIUnH
	 /emAeD7byydhjuK0CKl8SijcRkzTvI+KyBMlecqyP2khrso14O/UwO8N6kY7qvD5yO
	 nE4FoSObcaFARXmCmcHdLiw4XvGinKOxm2Tnss5HY/IcLfS4sRVID3ZdbqdoLRYV+A
	 q320oRNqxCZ3MYLgE9WheLsfPsu1YTqrl3bUhKWoJpsiKmlsUTE1v0VF9R/PixNONA
	 3pu6N4zn03zVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/17] iio: adc: ad7768: Configure channel sampling
 profiles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260904-ad7768-driver-v6-9-e4378f946bfb@analog.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-9-e4378f946bfb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:45:14 +0000
Message-Id: <20260904144515.787F61F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ad7768_channel_mode_mask() ambiguously combines logical and phys=
ical channel bitmasks, potentially writing to reserved or unmapped hardware=
 bits.
--

commit d77a0cc3ec50f3f6a3dbf446c22f27d8fae9209d
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: ad7768: Configure channel sampling profiles
   =20
At buffered capture setup, select the fastest compatible power mode for
the enabled channel rates. Group channels into the two hardware mode
profiles and program their decimation, mode selection, and data clock.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> index 2020156eb6b61..868130ebcc8f1 100644
> --- a/drivers/iio/adc/ad7768.c
> +++ b/drivers/iio/adc/ad7768.c

[ ... ]

> @@ -204,6 +209,11 @@ static u8 ad7768_channel_mask(const struct ad7768_st=
ate *st, u8 ch)
>  	return BIT(st->chip_info->chan_map[ch]);
>  }
> =20
> +static u8 ad7768_channel_mode_mask(const struct ad7768_state *st, u8 ch)
> +{
> +	return BIT(ch) | ad7768_channel_mask(st, ch);

[Severity: Medium]
Does this bitwise OR inadvertently combine the logical channel index and the
physical channel mapping?

When this is applied to the AD7768_REG_CH_MODE_SEL register, it could result
in writing to reserved or unmapped hardware bits, which might lead to
unpredictable hardware state.

> +}
> +
>  static u8 ad7768_all_standby_mask(const struct ad7768_state *st)
>  {
>  	return GENMASK(st->chip_info->num_channels - 1, 0);

[ ... ]

> @@ -478,11 +544,66 @@ static int ad7768_update_scan_mode(struct iio_dev *=
indio_dev,
>  	if (st->clock_source =3D=3D AD7768_CLOCK_SOURCE_XTAL)
>  		__clear_bit(st->chip_info->num_channels / 2, &standby_mask);
> =20
> +	for_each_set_bit(c, scan_mask, st->chip_info->num_channels) {
> +		unsigned int mask;
> +		int mode;
> +
> +		mode =3D ad7768_find_matching_mode(mode_used, mode_freq,
> +						 st->ch_freq[c]);
> +		if (mode < 0)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Over %d channel modes required\n",
> +					     AD7768_NUM_CHANNEL_MODES);
> +
> +		mode_freq[mode] =3D st->ch_freq[c];
> +		mode_used[mode] =3D true;
> +
> +		mask =3D ad7768_channel_mode_mask(st, c);
> +		ret =3D regmap_assign_bits(st->regmap, AD7768_REG_CH_MODE_SEL,
> +					 mask, mode);

[Severity: Medium]
This applies the multi-bit mask to the hardware configuration register.

Could this configure unintended channels or interfere with device compatibi=
lity?

> +		if (ret)
> +			return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-ad7768-dri=
ver-v6-0-e4378f946bfb@analog.com?part=3D9

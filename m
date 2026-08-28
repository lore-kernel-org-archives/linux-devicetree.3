Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66B3CC33F
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900624; cv=none; b=m0yXnaHIQYPR2fYjSFER6KQW/RRTGy5MMgL8iy2HX9yz6vjFWhX13aYDZsIEA3KuMDYzPhksfPzGGhgsj1tg+neGC0qOMyswf0FlokvF9z5CbGoF4UDBuJ0hnPBCay5vwBtHh2JiV/FqMAloFub3iXYXNSqZ/XbieHBbhUBDMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900624; c=relaxed/simple;
	bh=MevgHrUlKIx2JtHNofNCIblFSRQFiWNoWNNISSmG9uc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N7FRIyjmiEXCleBeVnszQQgH/vOenCenXhFKqSfNPeMT/bxrTFnU/e0FHIBtqVaQIjazAG7gqPI8bySwViBDAVeBZ8rqsGS2x5TrhPxa8RtBAFVJ2MrCW2JCDq57dNBcc2Ab3Lr9zA9lFPTOV63ekY/NFkuXr3Ih44oGb0+p3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgVIh2U/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgVIh2U/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF6D1F00A3D;
	Fri, 28 Aug 2026 07:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900622;
	bh=YBauIVA1Urs0yPwFYHrJJRo8nO78K+DG+n8/rejo74g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WgVIh2U/FfxfiDgzDKrsinbWX6Tn2EZax/pP7F+eG7/RzTqnith05VxYlMSfMyRxl
	 4yr1AECALrskCKs6AyAc2szyx0TAP7wHFAiDrcCnZ7cLPjxdPmCUqhgEC6VzypGg4r
	 KtaChyIlxD0Qqry2WPWj+Da3fhwUWBnpRS46k14DtK8ExHHWAyzu7b3kYn3w8o+Kh7
	 dKy5JK1dhw1VKchvc4uwTeeF5kNEPBluMr0N5nMwtuF72R2TtgypSnz6XbxlOwPmHY
	 9D8aJBB+n4epGAto3xd1eixuDkZkeHAbhzn0UVqcqznNKrzim6g6AWEgAW+E+bFK4s
	 aV7wl+WfQVEqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/10] iio: adc: ti-ads1262: support per-channel
 sampling frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828-ads126x-v4-4-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-4-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 07:03:41 +0000
Message-Id: <20260828070342.2CF6D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Out-of-bounds array read when accessing the soft timestamp channel.
--

commit dd8f25ef4ef94f53753566f6a544d3947f644a0f
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support per-channel sampling frequency
   =20
This commit adds per-channel sampling frequency support by introducing a
channel-specific configuration array and assigning the available attributes
per-channel.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index d919144c23cb2..86ea9b6232d8f 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> @@ -375,9 +449,18 @@ static int ads1262_wait_for_conversion(struct ads126=
2 *st)
>  static int ads1262_channel_enable(struct ads1262 *st,
>  				  const struct iio_chan_spec *spec)
>  {
> +	struct ads1262_channel *chan =3D &st->channels[spec->scan_index];
> +	int ret;
> +
>  	guard(mutex)(&st->xfer_lock);
>  	guard(mutex)(&st->chan_lock);

[Severity: High]
If a user enables the IIO timestamp channel (in_timestamp_en=3D1) alongside
other channels, could spec->scan_index exceed the allocated size of
st->channels here?

The IIO core includes the timestamp channel in indio_dev->active_scan_mask.
In the later commit "iio: adc: ti-ads1262: support triggered buffer samplin=
g",
the driver iterates over active_scan_mask and passes each channel to this
function without skipping the timestamp channel.

Looking at how the array is allocated:

> @@ -763,8 +970,15 @@ static int ads1262_parse_channels(struct iio_dev *in=
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

Because st->channels is sized to strictly exclude the timestamp channel, the
timestamp channel's scan_index will equal st->num_channels.

Will this cause an out-of-bounds read when preparing the SPI transmission,
potentially sending garbage data to the ADC hardware and causing the driver
to hang waiting for an interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-ads126x-v4=
-0-1dc27e9c0260@gmail.com?part=3D4

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7202381B1B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711979; cv=none; b=g3/GvMnDauFOCaPgu2mrHYjNgZcqBS6GWRpDl7NiCSWVxcXWsLYGY6LIAT+zC7L+y4BPMDPuvbfLATl/seYsGWzZDuyzSXWi/8/1wIZrP4tTFvhphXlIYi/vRm9pS1666N6ICa+0d4HJmfD2tnWeFW8fOWPKm1T+XggywGX9nb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711979; c=relaxed/simple;
	bh=DZUS9vpbfdaPYEwgf4pxexBE6EeAqOtwLnzzDaHR/gI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nRtqKg2RPAvWOafrXskL0K8tzZ+QuRbM0UWaFyy130a+mt+DWLWUU7TieoP0G08Bi1QXQsx4DLPuK2hNmPxS88yOw3z8klsmQr27+g9NoHHf8lQPzAsGVpvqYDfHH8HI52b+aaMrcq/gP6RxmZN/nyIz40TN+fkUTn255tdz5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOw5bHFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOw5bHFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF28E1F000E9;
	Mon, 25 May 2026 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779711978;
	bh=pR38G2sRJqIJb/VViOvmph4ISbl38Hy5/NZ52RzP/1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOw5bHFTufqNGpvWmN4RbW/zZ8cJdNXKPihZguJWEih+GF5vhRONTfVJfBnpZKtOW
	 WaM+lSYcP385gKu8fS+vzP4accCpPVwjqy1XWI4c2yoQUUu2RlhH3Pep9UbFs02zcY
	 vtXklV14lp8eYhRf2frUt1Cg0JUTcXSt2GOebxKFy1vRG/hflM/w12O5qcc5IY76Tw
	 dimJS4YYDTQYrflVhU0CW6+oONIKctZMP+ml9oW5PKypeWelhaRXqcvshd88Wbbsu6
	 eux8EGnHZlHcwHFJWLw0IDZxrEgkE/c7b3lVRJX0BW7AnNfK/4F3l4PFRZPqUxBvEv
	 sn4R3XNYZhyQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/6] iio: adc: ad4691: add SPI offload support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-ad4692-multichannel-sar-adc-driver-v13-4-1b7626d3b35c@analog.com>
References: <20260525-ad4692-multichannel-sar-adc-driver-v13-4-1b7626d3b35c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 12:26:17 +0000
Message-Id: <20260525122617.CF28E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced C macro `AD4691_OFFLOAD_CHANNEL` incorrectly u=
ses `.format =3D 'u'` instead of `.sign =3D 'u'` for the `struct iio_scan_t=
ype` designated initializer. `struct iio_scan_type` does not have a `format=
` member, which causes a build failure.
--

commit 93cce4b8ea73bcfdca8b9d9c533e462db205a412
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add SPI offload support

This patch adds SPI offload support to the AD4691 ADC driver to enable
DMA-based, CPU-independent data acquisition using the SPI Engine framework.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index 2b7bb6717e574..6563488ab8b89 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> @@ -139,6 +150,30 @@ struct ad4691_chip_info {
>  		},							\
>  	}
> =20
> +/*
> + * Offload path (bits_per_word=3D16): the SPI Engine assembles received
> + * bits into native 16-bit words before DMA, so samples are in
> + * CPU-native byte order (IIO_CPU). storagebits=3D16 matches the 16-bit
> + * DMA word size.
> + */
> +#define AD4691_OFFLOAD_CHANNEL(ch)					\
> +	{								\
> +		.type =3D IIO_VOLTAGE,					\
> +		.indexed =3D 1,						\
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),		\
> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_SCALE)	\
> +				    | BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
> +		.info_mask_shared_by_all_available =3D			\
> +				      BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
> +		.channel =3D ch,						\
> +		.scan_index =3D ch,					\
> +		.scan_type =3D {						\
> +			.format =3D 'u',					\

[Severity: Low]
Does this struct initialization cause a build failure? It looks like struct
iio_scan_type does not have a member named .format, and this should probably
be .sign instead.

> +			.realbits =3D 16,					\
> +			.storagebits =3D 16,				\
> +		},							\
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ad4692-mul=
tichannel-sar-adc-driver-v13-0-1b7626d3b35c@analog.com?part=3D4

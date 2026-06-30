Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAF42314A
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828919; cv=none; b=Tx1FNyjHesJUrq9vOglrer7JmEO2iq1DsndRjZsRv1dC5xy9drHbijOaWd4C8IwaCI7FvwyO1FTTN5p8Ml1TAHnV6wety8uUzjjz0kyA7ecEMxJtdHKYtZtqJire1UxhoQ25sErIrm1sWnRnDnXnpf7Q6Zf+LW+47G0vV6ACnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828919; c=relaxed/simple;
	bh=I7B2D3wlolQ4edf96TPt1BbNnwYIMnJA6EycfFvUty4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FIulN2P4ByVGHssMxSukdUE0SJIUlZ50PQ4Yrg7/kVtFeEeAWUlu+equC3Rcnt11KginArcuwXlH+712peZpdUk21V2JMXk6GTl9Opp6NuFbBJtIuAbu076E6IGPsIF39CgqBA002G+l1TPRt9QNqp35qiBNEKuKSEAvvfRhOEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahE3sfmk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahE3sfmk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DB41F000E9;
	Tue, 30 Jun 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782828917;
	bh=Bd8XNXNC5gYL1k9xtI1QJ3vSL/1QYmyJ+ZGoOsA24uI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahE3sfmk8s1sEyTE1xYDwBg9ZSUSgJh3lA8nfXoXjfQGjaosI8vUoVAsbPDX6exBI
	 LsqVSQskK+R2HCQQy5A8RJn9bGnuXJAsxQJYvyPrkkFwDoNecdOj3Q2HYe56rdKSbi
	 MsC4U15EYwHDz+CNiwWt+WdCP+fTzQF5w1CGh4TMlJx1Zh97Quo+gC/WCXElFPs37l
	 Uqf5d9HN5tlxe5HPDjI1oQ16WnNJxGazTefFtrqTgOYKa1m3q4F+wh4rXGQwUkzBbM
	 jJuCYtZ7CRdOnv9JFqLOVTEEBUg0RWB604ZjlR+vAaJV1NJhkXaG3RnsOeeVSLNq9c
	 4DSIEW6QWPGKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1298: add ADS1299 EEG ADC family
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630140311.1473031-2-shofiqtest@gmail.com>
References: <20260630140311.1473031-1-shofiqtest@gmail.com>
 <20260630140311.1473031-2-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 14:15:16 +0000
Message-Id: <20260630141517.85DB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The ADS1299 chip family detection condition will always evaluate t=
o false, rendering the ADS1299 support unreachable dead code.

Pre-existing issues:
- [High] Lack of upper bound validation on the device-provided channel coun=
t leads to array out-of-bounds reads and heap buffer overflows.
- [High] The driver reads PGA gain settings from static arrays using an unv=
alidated hardware-provided index, leading to out-of-bounds memory reads and=
 potential division by zero panics.
- [High] The driver fails to cancel in-flight asynchronous SPI transfers on=
 device unbind, leading to a Use-After-Free.
--

commit bae6bfa79577c0e4b004da3b94f146ed2ea3105d
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

    iio: adc: ti-ads1298: add ADS1299 EEG ADC family support

This patch adds support for the Texas Instruments ADS1299 EEG ADC family. It
adds the necessary device IDs and detection logic to distinguish the ADS1299
from the ADS1298 family and configure the appropriate PGA settings and
voltage references.

> diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
> index ae30b47e45142..5aae67a60519e 100644
> --- a/drivers/iio/adc/ti-ads1298.c
> +++ b/drivers/iio/adc/ti-ads1298.c
[ ... ]
> @@ -43,6 +44,20 @@
>  #define ADS1298_MASK_ID_CHANNELS		GENMASK(2, 0)
>  #define ADS1298_ID_FAMILY_ADS129X		0x90
>  #define ADS1298_ID_FAMILY_ADS129XR		0xd0
> +/*
> + * ADS1299 family is identified by bits [4:3] =3D 0b11.  Bits [7:5] enco=
de
> + * the silicon revision and vary between production lots, so only bits [=
4:3]
> + * are checked for family identification.
> + */
> +#define ADS1299_MASK_ID_FAMILY			GENMASK(4, 3)
> +#define ADS1299_ID_FAMILY_EEG			GENMASK(4, 3)

[Severity: High]
Does this define the comparison constant as an unshifted bitmask, which mak=
es
the equality check impossible to satisfy?

[ ... ]
> @@ -289,12 +308,15 @@ static int ads1298_get_scale(struct ads1298_private=
 *priv,
>  			return ret;
> =20
>  		*val =3D ret / MILLI; /* Convert to millivolts */
> +	} else if (priv->is_ads1299) {
> +		/* ADS1299 internal reference is always 2.4V */
> +		*val =3D 2400;
>  	} else {
>  		ret =3D regmap_read(priv->regmap, ADS1298_REG_CONFIG3, &regval);
>  		if (ret)
>  			return ret;
> =20
> -		/* Reference in millivolts */
> +		/* ADS1298 reference in millivolts: 2.4V or 4V */
>  		*val =3D regval & ADS1298_MASK_CONFIG3_VREF_4V ? 4000 : 2400;
>  	}
> =20
> @@ -302,7 +324,8 @@ static int ads1298_get_scale(struct ads1298_private *=
priv,
>  	if (ret)
>  		return ret;
> =20
> -	gain =3D ads1298_pga_settings[FIELD_GET(ADS1298_MASK_CH_PGA, regval)];
> +	gain =3D (priv->is_ads1299 ? ads1299_pga_settings : ads1298_pga_setting=
s)
> +		[FIELD_GET(ADS1298_MASK_CH_PGA, regval)];

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to an
out-of-bounds array read and potential division by zero?

The ads1298_pga_settings and ads1299_pga_settings arrays both contain 7
elements. FIELD_GET(ADS1298_MASK_CH_PGA, regval) extracts the PGA index from
the hardware register, yielding a value from 0 to 7. If the hardware regist=
er
value is 7, it reads past the end of the array.

The read out-of-bounds byte is then used as a divisor. If the byte happens =
to
be 0, it can trigger a kernel panic via division by zero.

[ ... ]
> @@ -598,20 +621,39 @@ static int ads1298_init(struct iio_dev *indio_dev)
>  	if (ret)
>  		return ret;
> =20
> -	/* Fill in name and channel count based on what the chip told us */
> -	indio_dev->num_channels =3D 4 + 2 * (val & ADS1298_MASK_ID_CHANNELS);
> -	switch (val & ADS1298_MASK_ID_FAMILY) {
[ ... ]
> +	/*
> +	 * Detect chip family from the ID register.  The ADS1299 EEG family
> +	 * is identified by bits [4:3] =3D 0b11; the ADS1298 ECG family uses
> +	 * bits [7:3] for family identification.
> +	 */
> +	if (FIELD_GET(ADS1299_MASK_ID_FAMILY, val) =3D=3D ADS1299_ID_FAMILY_EEG=
) {

[Severity: High]
Will this condition always evaluate to false?

FIELD_GET() extracts bits 4 and 3 and shifts them right, yielding a value
between 0 and 3. However, ADS1299_ID_FAMILY_EEG is defined as GENMASK(4, 3)
which evaluates to the unshifted integer value 24 (0x18).

Comparing a shifted value to 24 will prevent ADS1299 detection, causing val=
id
devices to fall through to the ADS1298 logic and fail to probe with an
Unknown ID error.

> +		/*
> +		 * ADS1299 family: channel count from bits [1:0].
> +		 * 00 -> 4ch, 01 -> 6ch, 10 -> 8ch.
> +		 */
> +		priv->is_ads1299 =3D true;
> +		indio_dev->num_channels =3D
> +			(FIELD_GET(ADS1299_MASK_ID_CHANNELS, val) + 2) * 2;

[Severity: High]
This is a pre-existing issue, but does calculating num_channels directly fr=
om
the hardware ID register without upper bounds validation lead to overflows?

If a faulty SPI device returns an unexpected ID, num_channels could exceed
ADS1298_MAX_CHANNELS (8). This unbounded value can cause priv->rdata_xfer.l=
en
to exceed the fixed sizes of tx_buffer and rx_buffer configured in
ads1298_probe(), resulting in out-of-bounds DMA transfers and heap buffer
overflows when demuxing data.

[ ... ]

[Severity: High]
This is another pre-existing issue, but does the driver fail to cancel
in-flight asynchronous SPI transfers on device unbind?

Looking at ads1298_rdata_release_busy_or_restart() in
drivers/iio/adc/ti-ads1298.c:

    spi_async(priv->spi, &priv->rdata_msg);

If the driver is unbound and resources are released without cancelling the
transfer, the pending SPI transfer can outlive the unbind. The SPI core
would then invoke the completion callback:

    ads1298_rdata_complete(void *context) {
        struct iio_dev *indio_dev =3D context;
        ...

This would dereference the freed indio_dev pointer, leading to a
use-after-free memory corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630140311.1473=
031-1-shofiqtest@gmail.com?part=3D2

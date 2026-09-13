Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519122FE59C
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290596; cv=none; b=EfXQ9QFYmXBHg7QiB8pzIKuTpAk1kRiDWj5QwmymaPZSi9R4/cR/Kk1pqZtEOpaMaycxlcmWPU2H79BVJJeG4H+gLbjisE2Ne3W2yaPnfG6lsxG86LTRs2edIOAUrz5JJnGD/X3cbDOzLkQtGcoIy8hzQ6iqgfdH4mCKUhtxiMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290596; c=relaxed/simple;
	bh=ysHpZgikw/o7bPu4m9S0EH7sPxEgqJ0AdOMO2F7Nmbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NLTwz8rv4d9y2tNghtN9SdNCrACsdYdZQAEIClm6qqNujHptJocHCDpBfG0hOxCOQ05tPI7Af/pkZtElRXxRM1PISoej2/nlGV9SpoajVl8zjdYTef2BMovkrLYfihs+Djf9Tr5gt6WX/zEnkuqzewnpO71TuIAgJeaTr5hY5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/c+ZXv2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/c+ZXv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D691F000FF;
	Sun, 13 Sep 2026 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789290595;
	bh=yGgBVEXUXbrCkfFYK8cp69lFEF8aRRGw49jLFCAdaas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h/c+ZXv2m1jAmIDn50UNUU51mnO2KHxK4kPt2m8Gs6Kk6ge/KtxWe+5z8uboz2HtX
	 nGzsQVUFEX1mgVZibv9NGIsJRa9Fu/ALVmRhI/6ECNKGK3+1SX2/EiM9AILjvR0H2P
	 Ul3209rkDaK9w8rTOpmwyhWnwbb1kO37EApjaSLjS7fDVllU3ZBk+s8pyC9ixaI0qG
	 ZgUArBOh5ICQhfeYRIXLmAxN3AuMWXIEl9LeaPZ78sZ0Xnp2nHpzHGtntiaB7kos4r
	 4fjwbaYisALcrDodIiJJV95piwWNsgJ5FgUnj8glwZaF/TBxWwLAmbJAMhYvHCZI1n
	 4nQ4+l/5lUOhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] iio: accel: adis16201: add ADIS16203 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shehryar Ahmad" <shehryar.amd@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260913085307.13846-5-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
 <20260913085307.13846-5-shehryar.amd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 09:09:54 +0000
Message-Id: <20260913090954.A8D691F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Channel array is not sorted by scan_index, causing mismatched buff=
er data
--

commit e8653b6ce4ef8334200ed8d297acf21b7bdc91a8
Author: Shehryar Ahmad <shehryar.amd@gmail.com>

iio: accel: adis16201: add ADIS16203 support

Add ADIS16203 from staging to mainline ADIS16201. ADIS16203 shares same
SPI protocol and register addresses. Differing parameters are handled by
adis16201_chip_info structure.

> diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
> index b0b549408d56d..6deafe63d4c14 100644
> --- a/drivers/iio/accel/adis16201.c
> +++ b/drivers/iio/accel/adis16201.c

[ ... ]

> @@ -232,6 +233,15 @@ static const struct iio_chan_spec adis16201_channels=
[] =3D {
>  	IIO_CHAN_SOFT_TIMESTAMP(7)
>  };
> =20
> +static const struct iio_chan_spec adis16203_channels[] =3D {
> +	ADIS_SUPPLY_CHAN(ADIS16201_SUPPLY_OUT_REG, ADIS16201_SCAN_SUPPLY, 0, 12=
),
> +	ADIS_TEMP_CHAN(ADIS16201_TEMP_OUT_REG, ADIS16201_SCAN_TEMP, 0, 12),
> +	ADIS_AUX_ADC_CHAN(ADIS16201_AUX_ADC_REG, ADIS16201_SCAN_AUX_ADC, 0, 12),
> +	ADIS_INCLI_CHAN(X, ADIS16201_XINCL_OUT_REG, ADIS16201_SCAN_INCLI_X,
> +			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
> +	IIO_CHAN_SOFT_TIMESTAMP(7),
> +};

[Severity: High]
This is a pre-existing issue, but by copying the channel layout from
adis16201_channels into the new adis16203_channels array, this propagates
a bug where the channels are not sorted by scan_index.

Can this cause data corruption during IIO core demultiplexing?

The array defines the channels in this order: SUPPLY (scan_index 4),=20
TEMP (scan_index 6), AUX_ADC (scan_index 5), INCLI_X (scan_index 2), and=20
TIMESTAMP (scan_index 7).

The IIO ADIS library's adis_update_scan_mode() iterates over the
indio_dev->channels array sequentially to build the SPI transfer list, so
the raw buffer memory is populated in array order.

However, the IIO core demux logic iterates over the active channels using
for_each_set_bit(buffer->scan_mask) in iio_buffer_update_demux(). This
processes bits from least significant to most significant, which means it
expects the buffer data in ascending scan_index order.

Because the raw buffer layout does not match the scan_index order, won't
the IIO core extract data from the wrong byte offsets, mapping data from
one physical channel to a completely different IIO channel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913085307.1384=
6-1-shehryar.amd@gmail.com?part=3D4

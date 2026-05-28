Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA563AF677
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988866; cv=none; b=CIo9fXCECYIODgPbr+Ndt/CX0zNGXgoQFlP9aSg+QAS+7xXBTK2qt6JaEVC+ZHJbR6H6zSiqcpPstuvCpvx7hnx2TbREkwYyfGzEskLWyLt0GCnTv29tyoD/eyElQHO+iJt/rg+v6QeiB1Df7IejrG0Aqvw7O5X/Iw1yusl9TLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988866; c=relaxed/simple;
	bh=jOppa0nTvqKtNau/ZoXxRgMQR3070qwcnCpfftGFxIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PbARxYgcF4a8UHP6skV6pGaOUUHrz83DEcPBaOsTkM3ISwJ0xsWq/oSGokD9kDTfq5K2b1L7E9ujznjNJTBwimUmbiHvKp4rDFdqSzEeFAN9Oo+GTvVDHuRPB7vMjJtoyIWOIBCLHug4vrOlGNKnk63LK6ulpzTy8MAx/rYvths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLbOS8vG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLbOS8vG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08851F000E9;
	Thu, 28 May 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779988865;
	bh=CC7KpohrjhpInsPafOuYfqPisS3mYzDsMFV/OoGwHj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cLbOS8vGpou99/kzYiC7ofobax2D5qkXbenUczrV75mHrFGJP1WtwSvDpaTePDbCs
	 TJbcoLJT8AIAmJNh0iVkqmQ35TQJMPFTE+57viWWlDIAlr23gL0RO6pXr3XU103EJx
	 2M09UcpSh6w3PBvNfCZZfaVqBf6UPmyEF5kB5mTY0rWW+JLIXq8jW4sxOdFcENX9FF
	 kBIhw4dFpVCmZx5132RyIOdQOoscRL4Y0Q3EpTm48bsafhbQt+tFF5K0l+NHSrefqb
	 a/Vgv2HGet/kIy/go2SsuvcHWqaVf86HfgteX6WOxIG2xtK1U/vFzUDUpRDbhED/KN
	 N3odFXWgzst2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] iio: adc: ltc2378: Enable triggered buffer data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <dc235f0b036a9eb33b37b0970815a95c9da52414.1779976379.git.marcelo.schmitt@analog.com>
References: <dc235f0b036a9eb33b37b0970815a95c9da52414.1779976379.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 17:21:04 +0000
Message-Id: <20260528172104.F08851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `ltc2378_scan` structure is allocated on the stack but not ful=
ly initialized, leaving fields like `endianness`, `shift`, and `repeat` wit=
h garbage values. This leads to out-of-bounds array reads in the IIO core, =
data corruption, and potential information disclosure.
--

commit 9e45014ec9c648942b0872f2dcaabf867779b73e
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable triggered buffer data capture

This commit adds support for triggered buffer data captures to the
LTC2378 ADC driver. It implements a trigger handler and configures the
scan type for both SPI offload and fallback triggered buffer cases.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> index 6b01d8e96cc60..514645b847f0b 100644
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> @@ -314,17 +337,27 @@ static int ltc2378_probe(struct spi_device *spi)
>  	st->chans[0].type =3D IIO_VOLTAGE;
>  	st->chans[0].info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
>  					  BIT(IIO_CHAN_INFO_SCALE);
> +	st->chans[0].scan_index =3D 0;
> =20
>  	struct iio_scan_type ltc2378_scan;
> =20
>  	ret =3D ltc2378_offload_buffer_setup(indio_dev, spi);
>  	if (ret =3D=3D -ENODEV) {
>  		/* SPI offloading is unavailable. Fall back to triggered buffer. */
> -		dev_dbg(dev, "triggered data capture not supported\n");
>  		ltc2378_scan.format =3D st->info->twos_comp ? IIO_SCAN_FORMAT_SIGNED_I=
NT :
>  							    IIO_SCAN_FORMAT_UNSIGNED_INT;
>  		ltc2378_scan.realbits =3D st->info->resolution;
>  		ltc2378_scan.storagebits =3D st->info->resolution > 16 ? 32 : 16;

[Severity: High]
Does this leave fields in ltc2378_scan uninitialized?

It looks like ltc2378_scan is allocated on the stack but not fully
initialized. Only format, realbits, and storagebits are assigned here,
leaving fields like endianness, shift, and repeat with stack garbage.

When st->chans[0].scan_type is later assigned from this struct, the
uninitialized endianness field could cause an out-of-bounds array read in
iio_show_scan_type() when indexing into iio_endian_prefix.

The garbage repeat value could also result in miscalculated IIO buffer
chunk sizes.

Could ltc2378_scan be zero-initialized to prevent these issues?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779976379.gi=
t.marcelo.schmitt@analog.com?part=3D4

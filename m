Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F2A34A3AB
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237320; cv=none; b=d917mBX1ePYxircNFJtWlBVotVwqYS6sGWJcb2BNORtTbu0WrtmCuUs1vKupoJ8y00Ih2Wu2+1GlzQYUZFALHl8ReOZ9esaPPKrQRYBIAb9oVq7mfZyKUijoKg/VvvOwhCH7f8S0cppNRw7M/r3e46D/uToziu/e4LL2gw+TXjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237320; c=relaxed/simple;
	bh=eVW1FX/o1J1V51pt/koYfBZv9wxbAmzy887C3TP3ODY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bm8egs/ifPJgjVQsyeLp+zjTOKwDknm+9pyB6r0bNKIsI6Uhn+SqlkjaF4mcpJtrqClTTUVptesrViIxaJllFFC2kSbj4RKzHxCPEpJNiven34K+a8MtpsuMC5QIvp0uBtDk4DQ/He4NYmt5moEXRnOTh7DIDjoO1713Ux7fO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaxilI/H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaxilI/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B3F1F000E9;
	Thu, 16 Jul 2026 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237319;
	bh=+eDaN4gSmbaO01DsKCGQcYOOVlD41y/UXWd5dN+6Z1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LaxilI/HXgcEhuHS7++lJn30oxZdf+oD7zMj5jD4g0jw60QHCjO2Tkf45c2YGg7X1
	 34s8j8qXw/VYHp9YKP59GRSdHndWwNsZBouFf2jzTkZyxAvZIBQpOAEY4GwZK+1Ot8
	 ygoxfxx0opA+0O5UEOiuJhQ0r3ujWM5si0kuYPDLML9ubko4QNb2g/ZCDwISn5+V/m
	 L9ixyfFp/mqd5bfe2FmpF+xnA5GMoALSCPZOSWxvHXbKJBRoKyGXpB/W92c631L6rM
	 e5as9T2AeTKyr2O1sGqHGA9xVCbt/6jINw4DSZq+DdPzVD9ZaWnRMFntznsiTBRX8y
	 bEszy18vNlw/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
 <5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:28:38 +0000
Message-Id: <20260716212838.95B3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `LTC2378_DIFF_CHANNEL` macro defines an IIO channel that is =
intended to be differential but lacks the `.differential =3D 1`, `.indexed =
=3D 1`, `.channel =3D 0`, and `.channel2 =3D 1` attributes.
--

--- Patch [2]: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20=
 and similar ADCs ---
commit 5710d5f25b45906977e2522567c1964b1d3219f8
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs

This commit adds a new driver for the Analog Devices LTC2378-20 and
similar analog-to-digital converters.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> index 0000000000000..5600c820c7f45
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c
> @@ -0,0 +1,416 @@
[ ... ]
> +#define LTC2378_DIFF_CHANNEL(_sign, _real_bits, _storage_bits)			\
> +{										\
> +	.type =3D IIO_VOLTAGE,							\
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |				\
> +			      BIT(IIO_CHAN_INFO_SCALE),				\
> +	.scan_index =3D 0,							\

[Severity: Medium]
Does this macro need to set .differential =3D 1, .indexed =3D 1, .channel =
=3D 0,
and .channel2 =3D 1? The name suggests these are differential channels, but
without these attributes, the IIO ABI will expose them as single-ended
(e.g., in_voltage_raw instead of in_voltage0-voltage1_raw).

> +	.scan_type =3D {								\
> +		.format =3D _sign ? IIO_SCAN_FORMAT_SIGNED_INT :			\
> +				  IIO_SCAN_FORMAT_UNSIGNED_INT,			\
> +		.realbits =3D _real_bits,						\
> +		.storagebits =3D _storage_bits,					\
> +		.shift =3D _storage_bits - _real_bits,				\
> +		.endianness =3D IIO_BE,						\
> +	},									\
> +}
> +
> +#define LTC2378_BIPOLAR_DIFF_CHANNEL(_real_bits)				\
> +	LTC2378_DIFF_CHANNEL(1, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> +
> +#define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
> +	LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784235595.gi=
t.marcelo.schmitt@analog.com?part=3D2

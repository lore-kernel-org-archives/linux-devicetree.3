Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAFD348C65
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201311; cv=none; b=QrzRJ8bxq3VUHEq5AY+pm7Nmqfj2uMaVQ2qrPkj46Onn+bgXKXvaMGFeClLn7rQa1+wVYQTptwlvarrsiZIKnUrqtKq4ZHrR6iznALQvV2kstHdHin8oAgr0cuqcySfJM680yE+FQbRgyQgzlDO2grw0Ito4xYQOejFtcu1Q2X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201311; c=relaxed/simple;
	bh=6gYC7EjZbkCSS89q2GyExt577ViuLwIsQ7ysxKvb0+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SQq0YNu2iiRV2diNK/6jqkDnCZkRaCfuxYtT8bshPFs/vKB5Lwo1x9Oy/iHjDpf4G6OtTybfT5rF/smTcFQf4WSHY8qJvvKqJ3XlVhMFygFhLCmjzQWLsWTr6IjjSF5qMnqvvJWj8bJ1cDLNHfOtoOsfPJLPhxl+2lnQSopZIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yqf/Nwrg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yqf/Nwrg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C00C2BCB3;
	Tue, 19 May 2026 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779201311;
	bh=6gYC7EjZbkCSS89q2GyExt577ViuLwIsQ7ysxKvb0+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Yqf/Nwrglx8LS+CRGWss13oFICHOrB7hDpmXOmInW1D46Sy6oFmEQGXqrXhOegUBt
	 I02xLQEsdRDqiWQiBGAon0OjNA2Nw+RHFUeRo0R2ynJZg0kCXwwkRNxwAPDmATPy8h
	 V6xc+16gomAG+FD5JKYFP44PUS2TYKIESO26PSqG/xclynIAWIYAu71EtuoP6cDR/I
	 yKcSUVHbUaY3tzliOXT+xD1QcqJgBFkGlmDuWHZA1gTBosz9U5cDUQOF11TVQpL0UK
	 a62HqjRsdT5aeA1NNx+KD7nims7OWScWOF4wUx14h9/I6Jqdl5Zt42UT6+QXHk7/vr
	 POmd2PIg6Upzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/6] iio: adc: ad4691: add SPI offload support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260519-ad4692-multichannel-sar-adc-driver-v12-4-5b335162aa51@analog.com>
References: <20260519-ad4692-multichannel-sar-adc-driver-v12-4-5b335162aa51@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 14:35:10 +0000
Message-Id: <20260519143510.E1C00C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Invalid field '.format' in struct iio_scan_type initializer.
- [Low] Comment claims scan_tx_reset length differs between paths, but code=
 uses length 4 in both.
--

commit 7490ce5c597707ce10e439240d92b62db62380e0
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add SPI offload support

Add SPI offload support to enable DMA-based, CPU-independent data
acquisition using the SPI Engine offload framework.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index ed60ed5b488c2..a6588292f3c18 100644
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
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW)		\
> +				    | BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
> +		.info_mask_separate_available =3D				\
> +				      BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_SCALE),	\
> +		.channel =3D ch,						\
> +		.scan_index =3D ch,					\
> +		.scan_type =3D {						\
> +			.format =3D 'u',					\

Does this cause a build failure? It looks like the member in struct
iio_scan_type is called sign, not format. Initializing .format here
will likely cause the compiler to complain about a missing member.

> +			.realbits =3D 16,					\
> +			.storagebits =3D 16,				\
> +		},							\
> +	}
> +
[ ... ]
> @@ -876,6 +1005,218 @@ static const struct iio_buffer_setup_ops ad4691_cn=
v_burst_buffer_setup_ops =3D {
[ ... ]
> +static int ad4691_cnv_burst_offload_buffer_postenable(struct iio_dev *in=
dio_dev)
> +{
[ ... ]
> +	/*
> +	 * State reset: single 4-byte write [addr_hi, addr_lo, STATE_RESET_ALL,
> +	 * OSC_EN=3D1]. ADDR_DESCENDING writes byte[3]=3D1 to OSC_EN_REG (0x180=
) as
> +	 * a deliberate side-write, keeping the oscillator enabled.
> +	 * scan_tx_reset is shared with the non-offload path (len=3D4 here vs
> +	 * len=3D3 there) since the two paths are mutually exclusive at probe.
> +	 */

Is this comment accurate regarding the lengths?

The non-offload path in ad4691_cnv_burst_buffer_preenable() also appears
to use a 4-byte transfer for scan_tx_reset, setting up all 4 bytes before
passing it to the transfer.

> +	put_unaligned_be16(AD4691_STATE_RESET_REG, st->scan_tx_reset);
> +	st->scan_tx_reset[2] =3D AD4691_STATE_RESET_ALL;
> +	st->scan_tx_reset[3] =3D 1;
> +	st->scan_xfers[2 * k].tx_buf =3D st->scan_tx_reset;
> +	st->scan_xfers[2 * k].len =3D sizeof(st->scan_tx_reset);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-ad4692-mul=
tichannel-sar-adc-driver-v12-0-5b335162aa51@analog.com?part=3D4

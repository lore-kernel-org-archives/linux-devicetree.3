Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64B2F4A0C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573556; cv=none; b=QQZMSscx59RME5yG8iPY5RzczHfGtTepX1XDPraNxFRrBoxWM70mgGYMaHjL2jCh2KSLDlxhR5Ll0bt+qIQSAhY7fgHn6oowZqp3K5oHUE7gxeTBSS8TlX6KUvZxbEpRY+nb3H9VFvi3FPrLQP0g8BG9QNGPTMDsKREgUIr+hH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573556; c=relaxed/simple;
	bh=MFTASB5vW3Ptx00lmFCIR/z8TFN0m1ELQKRbmcDXALE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hk6aDDtmrORkOeGzdQGVB+Ha3WXZGPlQObttMSn5oMhegH3aD0nc4WoTFkNkZVK2Nl/gY2nikJCBN4py+xLxgAU3+URpHwBrInuBFE2h1bujRomvcekXy+RxKmOXxr2a4XDurw/jzgqfOkJvtOjyvyRzgmbfUmlv4563XOa3y34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWGPpxNG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWGPpxNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DB5C2BCB0;
	Tue, 12 May 2026 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778573556;
	bh=MFTASB5vW3Ptx00lmFCIR/z8TFN0m1ELQKRbmcDXALE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JWGPpxNGA2GQk8eILuZKxg6j0rpG0wh4VxO3mR1pzrI+fmf4puu2jUvrzLvaJiBU3
	 DS0VmBaw6bxIcpX/MkwZ53YYf8dSzzJcrtIaoQvvgpBESJsxzxxOzFPNhW8hQdr0fD
	 R5AMrk/acQWH4uMARYuDP1w0+SRu5jFdy7Rt2m3j8oKFwttM85/1iJX+YjUTVZFYuF
	 h9cwzOPrrK60sdwF/fPagbhckiUD6+rFx3iHEKW8oic4NPPSq4NdWtixL9OXmB7hXL
	 rpIMBxeqB7bjfIVk+o/Vz5QDTeY+EaOg9X8YM1M4PGFaPEk1vl0u1/JUJlJ/NjYdeD
	 +iGjEOTRv8/ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/6] iio: adc: ad4691: add SPI offload support
Reply-To: sashiko@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-ad4692-multichannel-sar-adc-driver-v10-4-e1fbb1744e38@analog.com>
References: <20260511-ad4692-multichannel-sar-adc-driver-v10-4-e1fbb1744e38@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 08:12:35 +0000
Message-Id: <20260512081235.C0DB5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The software-triggered buffer and SPI offload paths produce memory=
 buffers with differing endianness, but they share the exact same IIO chann=
el `scan_type`, corrupting data on Little-Endian hosts for one of the paths.
--

commit 7a6cc358e39a6b61c1d3018b7172b6303e1f28e5
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add SPI offload support

This commit adds SPI offload support to enable DMA-based, CPU-independent
data acquisition using the SPI Engine offload framework. It supports both
CNV Burst Mode and Manual Mode, sharing the channel scan_type between the
software-triggered and offload paths.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c

[ ... ]

> @@ -847,6 +924,223 @@ static const struct iio_buffer_setup_ops ad4691_cnv=
_burst_buffer_setup_ops =3D {

[ ... ]

> +static int ad4691_cnv_burst_offload_buffer_postenable(struct iio_dev *in=
dio_dev)
> +{

[ ... ]

> +	iio_for_each_active_channel(indio_dev, bit) {
> +		st->scan_tx[k] =3D 0x8000 | AD4691_AVG_IN(bit);
> +
> +		/* TX: address phase, CS stays asserted into data phase */
> +		st->scan_xfers[2 * k].tx_buf =3D &st->scan_tx[k];
> +		st->scan_xfers[2 * k].len =3D sizeof(st->scan_tx[k]);
> +		st->scan_xfers[2 * k].bits_per_word =3D bpw;
> +
> +		/* RX: data phase, CS toggles after to delimit the next register op */
> +		st->scan_xfers[2 * k + 1].len =3D sizeof(st->scan_tx[k]);
> +		st->scan_xfers[2 * k + 1].bits_per_word =3D bpw;
> +		st->scan_xfers[2 * k + 1].offload_flags =3D SPI_OFFLOAD_XFER_RX_STREAM;
> +		st->scan_xfers[2 * k + 1].cs_change =3D 1;
> +		k++;
> +	}

Will this offload RX stream configuration result in different endianness
compared to the software-triggered path?

In the software-triggered path, the SPI RX uses the default bits_per_word
of 8, meaning the ADC's MSB-first 16-bit samples are stored byte-by-byte in
memory as Big-Endian.

However, here in the offload path, bits_per_word is set to 16. The SPI
engine will reconstruct the 16-bit frames, and the DMA controller will
write them to memory as native 16-bit words, which will be Little-Endian
on LE hosts.

Since both paths share the same IIO channel scan_type definition (which
lacks an explicit endianness and defaults to IIO_CPU), won't one of the
paths produce incorrectly decoded data for userspace on Little-Endian
systems?

It is understood that a subsequent commit ("iio: adc: ad4691: add
oversampling support") adds an endianness of IIO_BE to the channel
definitions to address the software path. Since the offload path still
shares these definitions, this would cause IIO to advertise the offload
data as Big-Endian even though it provides CPU-endian data.

It appears the driver might need separate channel arrays for the offload
path with endianness set to IIO_CPU, or it needs to byte-swap the software
buffer to CPU endianness before pushing it to IIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-ad4692-mul=
tichannel-sar-adc-driver-v10-0-e1fbb1744e38@analog.com?part=3D4

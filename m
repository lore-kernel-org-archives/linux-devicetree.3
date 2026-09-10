Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D673DC4D8
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031672; cv=none; b=gNE2QEW0UIuvKGwm0c8KSznfYKGfBJTAlicjjVzkVgJkunXdpduIdVCCo/DXUhbki5Z8YKvOEb/V+JHccngh1KzJ4TJfIlfwm9ckjn0ATS3iA2foBXCWdNMJsfnZDQSQSk/GW4n/Hf8aJ8ZpnC5RkdYVRluLsAL24r1gwLZZM7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031672; c=relaxed/simple;
	bh=c9D2/nHDAqK5FoksXQT86Fo/UpMFe70pB7tHxCU4N2g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MIy01oHDArPBkKSZxsmZgwOK1Uc71d0dld9LrLYwumSDLHCB8f6P+m2PGeB46Klo/5JjlXQr7iS5lClXLCc1FMDDtJPb6ACa0c+tl2i6IrT6Lle8DXNPY+g+6V98HNLunl517sKBRxlTlK7A1geoYyRH/c8vW9Rw8MX98/p4pps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeHRSH8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeHRSH8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F25F1F000FF;
	Thu, 10 Sep 2026 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789031667;
	bh=A9yGQw1GD4y4Pq8/OwHQUqdbJojgI2NMFhjlthG5IO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GeHRSH8SdQJvFFPLCeqcbyxAYuncnFl+9wbiPXASPt0xPQwJs0NswVhaNiH21lVY9
	 73Sz7xbe//OWB0Lu8EghmBwdrz+D9sc5D0qoC95WSyEAyrq7Vqao3lqs/jjJNU6iwv
	 rPLXObPYrZuhsSKnIhVE9ASJvztHA/1bLUQJJgxKAufjyMfJCrlLi1mkVzbLAKOtLx
	 vvy+wI/xjEBzBWqEOSkhHKw49Ne6kr/6FqJ2Taw9kn0Ki8xf302K9qT6BCp9pMFrw4
	 Kios2ShSZiYqzkn0U6hJnvypxqmPZga/Tyveb5eNvABdw6hInFHlCpB4Za/R+gzYo0
	 GFCqbvt42UQ1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] dt-bindings: iio: adc: renesas,r9a09g077-adc:
 document DMA support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910085430.3173166-8-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260910085430.3173166-8-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:14:26 +0000
Message-Id: <20260910091427.4F25F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IIO channel specifies `IIO_CPU` endianness for the DMA buffer,=
 but the driver copies the raw hardware samples without converting them to =
native CPU endianness.
--

commit 7eb4eed24fc9164ecef6de1efee2ea6e90c109dc
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

iio: adc: rzt2h: implement DMA buffer support

Implement buffered capture using a cyclic DMA transfer into a kfifo
buffer to support continuous high-rate sampling.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 95bcebdc02cb3..0460dffe189e2 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c

[ ... ]

> @@ -151,6 +186,263 @@ static int rzt2h_adc_calibrate(struct rzt2h_adc *ad=
c)
>  	return 0;
>  }
> =20
> +static void rzt2h_adc_push_period(struct iio_dev *indio_dev, u16 *period,
> +				  dma_addr_t addr)
> +{
> +	struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> +	u16 *dst =3D adc->buf;
> +	u16 *src =3D period;
> +
> +	dma_sync_single_for_cpu(adc->dev, addr, adc->dma.period_bytes,
> +				DMA_FROM_DEVICE);
> +
> +	for (unsigned int sample =3D 0; sample < RZT2H_ADC_DMA_PERIOD_SAMPLES; =
sample++) {
> +		for (unsigned int i =3D 0; i < adc->dma.gather_len; i++)
> +			dst[i] =3D src[adc->dma.gather[i]];

[Severity: High]
Does this code copy the raw hardware samples into the IIO buffer without
converting them to native CPU endianness?

If a user-space application enables the IIO buffer and reads samples from t=
he
ADC on a big-endian architecture, the hardware writes little-endian 16-bit
words to DMA memory. This function appears to copy those raw little-endian
bytes verbatim.

[ ... ]

> @@ -192,6 +489,12 @@ static const struct iio_chan_spec rzt2h_adc_chan_tem=
plate =3D {
>  	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
>  			      BIT(IIO_CHAN_INFO_SCALE),
>  	.type =3D IIO_VOLTAGE,
> +	.scan_type =3D {
> +		.sign =3D 'u',
> +		.realbits =3D 12,
> +		.storagebits =3D 16,
> +		.endianness =3D IIO_CPU,
> +	},
>  };

[Severity: High]
Does setting endianness to IIO_CPU incorrectly inform the IIO core and
userspace that the buffered data is in native CPU endianness?

Because the channel is marked as IIO_CPU here, the IIO core and userspace
assume the data is natively ordered. Combined with the verbatim copy in
rzt2h_adc_push_period(), they might interpret the little-endian bytes
incorrectly on big-endian CPUs, potentially leading to data corruption where
applications read swapped bytes.

Should the little-endian data be converted to CPU endianness before being
pushed to the buffer, or should the scan type reflect the actual endianness
of the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910085430.3173=
166-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D7

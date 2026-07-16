Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995D419D89E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205143; cv=none; b=sHXI7jqFY8FlbB51YhIF7ZmmXfSVTEqZiELJPecx0PSkQdgoNsowHKG3L7Nc8k/rLjWXyU2j8inmAaDS6vLi1n7d76SmhbPjS/wY85vyaBUpCmcXTNaZlj/5YjebST00qtDwnzPPqf9uKIvUNtcv1fZ7f136gU4JUhAW/7UC9eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205143; c=relaxed/simple;
	bh=pLjRunqtzdKfXAD0ErFs4Qsk76cPsu7I9iZbNmjkuBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tppSWioHr6f964n7StsHxc39U9NVkaS4BWc/JG37VZBJhG7k5NyTCmlPICNlIFOvj9wFsPHR5jh7aDQR98pXciRp/ktfWIqmFlS/n6de4PTGFSGgsTAgVCHE8bK0XyRxj0yj1TFPQYN0ovdkks37QBFiP16U8ssHQ7Q33fu4DCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRF7L+Pr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRF7L+Pr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37681F000E9;
	Thu, 16 Jul 2026 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784205142;
	bh=W0Oden4jsfvnuyJhr3xZtjr05qUl0WI/fNEhp///3pc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bRF7L+PragfsFfNWCWL4vW6Lr4/XaV4OoBE/OLl3np+j1yALL8dYGGKL5k4JJEE/h
	 EJ23ZSZ57HFvpaDlsygS+TjkN1P2l7VCiOWsUG2eAbL8gmmJbyUGdqJkqfQA0v1Tqi
	 8zP/tVlaVg1Fk8cDmi+2CajiginHFB/63pVfY3K0GB1Asn/4dRo8Xx5b299JNtAJAx
	 g2119BSaY3FGOf0npfdz9NbUTcmDYTYu1QM2jsJPxzj2YuPplofRGzWwLS9Xxc1jZ+
	 B/FF4fIX1c0xp658vm3maQD8xPktRHJI4veCJxWPd0wncBeKK59HxqySrk17DVDAUz
	 05zSxMXadeIfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/8] iio: dac: ad5686: implement new sync() op for
 the spi bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-ad5686-new-features-v8-5-ebb0051af5e5@analog.com>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
 <20260716-ad5686-new-features-v8-5-ebb0051af5e5@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 12:32:21 +0000
Message-Id: <20260716123221.E37681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Use of the C++ / C23 `auto` keyword for type inference causes a com=
pilation error in standard Linux kernel C.
--

--- Patch [5]: [PATCH v8 5/8] iio: dac: ad5686: implement new sync() op for=
 the spi bus ---
commit 6524307465bd775ca4dd7375ae2bb7b554ff6dde
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: implement new sync() op for the spi bus

This commit introduces a new sync() operation for the SPI bus to handle
multiple channel DAC writes more efficiently. It stores SPI transfers in
a message and flushes them to the platform driver during the sync operation.

> diff --git a/drivers/iio/dac/ad5686-spi.c b/drivers/iio/dac/ad5686-spi.c
> index d3b64b4361d51..2cb836038821f 100644
> --- a/drivers/iio/dac/ad5686-spi.c
> +++ b/drivers/iio/dac/ad5686-spi.c
[ ... ]
> @@ -13,59 +13,101 @@
>  static int ad5686_spi_write(struct ad5686_state *st,
>  			    u8 cmd, u8 addr, u16 val)
>  {
> -	struct spi_device *spi =3D to_spi_device(st->dev);
> -	u8 tx_len, *buf;
> -
> +	struct ad5686_spi_data *bus_data =3D st->bus_data;
> +	struct spi_transfer *xfer;
> +
> +	if (bus_data->size >=3D bus_data->capacity)
> +		return -E2BIG;
> +
> +	/*
> +	 * This function stores spi transfers to a spi message to be sent over
> +	 * the bus when sync() op is called. If there are already transfers in
> +	 * the spi message, set the cs_change flag on the last transfer to
> +	 * ensure that the chip select is deasserted between transfers. If this
> +	 * is the first transfer, initialize the spi message. Later on, the
> +	 * current transfer is added to the message with spi_message_add_tail().
> +	 */
> +	if (bus_data->size)
> +		bus_data->xfers[bus_data->size - 1].cs_change =3D 1;
> +	else
> +		spi_message_init(&bus_data->msg);
> +
> +	xfer =3D &bus_data->xfers[bus_data->size];
> +	auto buf =3D &st->data[bus_data->size];

[Severity: Low]
Will this cause a compilation error? Standard GNU C11 used in the Linux ker=
nel
does not support the C++ or C23 auto keyword for type deduction.

>  	switch (st->chip_info->regmap_type) {
>  	case AD5310_REGMAP:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-ad5686-new=
-features-v8-0-ebb0051af5e5@analog.com?part=3D5

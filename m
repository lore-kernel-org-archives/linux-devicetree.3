Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C2383994
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370947; cv=none; b=onLY6Uxugzo5vwNw774RhtMlRW39iTlljzD6RUEJrZJwCSxa9YGmAGyEmrbiNZ2DaEHbW9VGyhK2f1ulLkpk/CbWG/FpTXVvXft8oM5jDZG5NhdmN+IaGF/BIZEB+qzK5uUoVQTmRpyKCRJVWdxzkZUH51gXP1arYnL7MOflgOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370947; c=relaxed/simple;
	bh=lB3gnO5kBYL2s0rs2/HSyFJe/SJpZ5qRngQdrIk4wHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PztxofiUT9Mr+JRQ0D9BJwBMbvQRIfICKGVmOFJat5PeS/IoFlEe26mUpmneQYCR4pLeM+YSDs/OasO81zs6pyLaLCAb+DM5RvL/k/2RgoLurz+ARc/xS7OtDk8eqMfgn5bgriBLVOXzaYYww1tVsCArnBuq4BhCg8pCPi4n0Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJZw7bco; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJZw7bco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAAF1F000E9;
	Wed,  2 Sep 2026 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370945;
	bh=D0a6QoJpyDHxbm2fDkslssZIfQi/+tEzu0Nip1D7OZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJZw7bco1bpnaLLsK7uDF3++SgkAFXvcAvATWLsXHNhRkYdR8B3kLNh2NmTBXWPHc
	 ldQn6kybISp0Uf3Vr7828cPpbxAb416fX7TcD8yFZXI3AYw8RfQ4ctBQPFX6xPOpHY
	 yCxGf3FjofV6SD3KhWxpujdrDw6C64BVStGGTbYke8hjFfQSvOP/wfIQ98YnnlA3Vz
	 ethb5p4MM46iuOs6Dt3ZObm5kurHgFwK45KYlBvubcoF/a+ISvy3TxNQv8Hr8B6XBP
	 419HEvWl9ZYYoNMJODmDXMVXYDw8oLKl/SfuWiGPRkLScBo3l+mhQiBLRLXiNLPEy6
	 Hz/tD32CT6NQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 05/13] iio: adc: ad4134: Run shorter transfers when
 CRC is disabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <e7f106f7cfae15675a3c04a57d486b478b182705.1788368334.git.marcelo.schmitt@analog.com>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <e7f106f7cfae15675a3c04a57d486b478b182705.1788368334.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:42:25 +0000
Message-Id: <20260902174225.BCAAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The TX and RX SPI buffers (`tx_buf` and `rx_buf`) share the same c=
acheline, violating the DMA API constraints for concurrent bidirectional ma=
pping and causing potential memory corruption.
- [Medium] Incorrect SPI CRC verification logic compares the received respo=
nse CRC against the transmitted command CRC, causing spurious validation fa=
ilures and rendering the CRC check useless.
--

commit 6e10b7a255a6c4b304554d7ef28e9e98a2139736
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Run shorter transfers when CRC is disabled

When AD4134 has its SPI CRC feature enabled, one extra byte (the CRC code)
is sent through SPI for both ends to verify the integrity of data
transfers. Though, when CRC is not enabled, SPI transfers can be shorter.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 3460ecf4cafd4..7da6734d4609f 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
> @@ -102,6 +102,7 @@ struct ad4134_state {
>  	unsigned long sys_clk_hz;
>  	struct gpio_desc *odr_gpio;
>  	int refin_mv;
> +	bool crc_en;

[Severity: High]
This is a pre-existing issue, but does struct ad4134_state force tx_buf
and rx_buf to share a cacheline?

Looking at the struct definition, rx_buf is annotated with
__aligned(IIO_DMA_MINALIGN), which aligns its start address:

	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN] __aligned(IIO_DMA_MINALIGN);
	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];

Because rx_buf is only 3 bytes long and tx_buf immediately follows it
without its own alignment, tx_buf resides in the exact same cacheline.

When both buffers are passed simultaneously to spi_sync_transfer() during
ad4134_reg_write() or ad4134_register_read(), they are mapped concurrently.

Will performing a simultaneous flush for tx_buf and invalidate for rx_buf
on the same cacheline violate DMA API rules and cause memory corruption
on non-coherent architectures?

>  	/*
>  	 * Synchronize access to members the of driver state, and ensure
>  	 * atomicity of consecutive register access operations.

[ ... ]

> @@ -170,7 +171,7 @@ static int ad4134_reg_write(void *context, unsigned i=
nt reg, unsigned int val)
>  	if (ret)
>  		return ret;
> =20
> -	if (st->rx_buf[2] !=3D st->tx_buf[2])
> +	if (st->crc_en && st->rx_buf[2] !=3D st->tx_buf[2])

[Severity: Medium]
This isn't a bug introduced by this patch, but is the CRC validation logic
comparing the correct values?

In ad4134_reg_write(), the outgoing command CRC is calculated over the
instruction and stored in st->tx_buf[2]. The incoming response CRC computed
by the device is placed in st->rx_buf[2].

Because the transmitted data differs from the received data, won't comparing
the response CRC directly against the command CRC result in constant
mismatch failures?

>  		dev_dbg(&st->spi->dev, "reg write CRC check failed\n");
> =20
>  	return 0;

[ ... ]

> @@ -231,7 +232,7 @@ static int ad4134_register_read(struct ad4134_state *=
st, unsigned int reg,
>  	*val =3D st->rx_buf[1];
> =20
>  	/* Check CRC */
> -	if (st->rx_buf[2] !=3D st->tx_buf[2])
> +	if (st->crc_en && st->rx_buf[2] !=3D st->tx_buf[2])

[Severity: Medium]
This is a pre-existing issue, but does this comparison render the CRC check
useless for register reads?

Similar to the write path above, st->tx_buf[2] holds the CRC for the
outgoing command (including a dummy data byte), while st->rx_buf[2] holds
the device's CRC over the read response (which includes the actual register
value).

Since the response data is mathematically unrelated to the outgoing command,
will this always produce false-positive CRC check failures rather than
actually validating incoming data integrity?

>  		dev_dbg(&st->spi->dev, "reg read CRC check failed\n");
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788368334.gi=
t.marcelo.schmitt@analog.com?part=3D5

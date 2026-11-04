Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797513;
	b=JrXPL1E0qWBN6MXTZztM+rfVKlsgSsMSDSKtdmja1iDVP+B8gFkpOh5+jJ4e/5dNW51N
	 QkE1DbT8jtLNYQezxleATI/NduICGVK63zF2ncbfokN5qQ/hwZh3Gz8TtfhDdpKKTyKPt
	 KlGPvvsdKHHWxczwOk6c2LR8deKktsRHHV8SapIZfHs6RBH2Y+6kPdHvuPF0wYkwgK/EW
	 WoMi/R0Y95jh7AbSSOCGI7ZhPBouFSwHKuCcx9nOScpAameUx1M3ryY+TXPXYaXnivwUz
	 kQWQ4TeGFI9oipO/MSNeLJdhlpXonEGm++2xX8jDoLVDChTU8J1KjQvb1/fp3pHLgkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797513;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IqFHdQqTeC55AVEaBOxNpTv1qImYGDhiNSZ3liTb2BU=;
	b=tnVpaPmaHzyNe4UxDekcKX8/EBJNJh5T2RhedByjc7ZEcoyPRJifCz58MaVrnTbY9Ksh
	 unZnkPfc14Kk5RlWA+ko7HzZxEIzf3f+ODPn091MMKTkpIvsjdC3zS30oEBaEdb3AcJrf
	 zkm/WFj3vmnlX8jppOXx4kqjrr7jBgN4QgssLIgvmf86g/2e8tk8zlFC5kXcaV2KaYKnN
	 sIeXKYxVln6sPnQqmz9bUJYbAbE36Jklyyug3ockI3hAaGj1AQYbe0vc5rRz9hLUeDPIt
	 JVkecdh9aRSKbP14jyl61TSwIwMGy8lZWpHrqwpxchzNj/IR2vZ8hHg7cfDo3DYN3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVYaE9XG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26933606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVYaE9XG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2221F000C1;
	Wed,  4 Nov 2026 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797512;
	bh=IqFHdQqTeC55AVEaBOxNpTv1qImYGDhiNSZ3liTb2BU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TVYaE9XGGZz94j1yZaurWbn9SdP5mOGtoAe4XAT5QybgDvBkSvZa/t+EA2/8jVctt
	 uKNzjRj+13GBjaChgGeBz8HAPJLty8YGWgRVcJBptMUgY8lsHaq47sBdoJFvIBdipA
	 Hmax4uB6PkxqP971r84I4xPzuDa4P+3KFCt+kmRPnHLyiuVDePKqxw95o5kUhnUvf2
	 xC7O89Q6WfIuHzNAKTzh/zRds+6azyAVVwtkBZhRfiqhHaoBUrh/Wpu03NWUeVeijU
	 lIHxSpJ0g0xdUkJJBz5iHMqTd8FqDJlrngtIIx17ksiKizaFAMx/CDgpaVx7MZZ9Oq
	 AhE7eyCV5bSgg==
Message-ID: <sashiko-outbox-197324@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104125726.1754980-3-maxime.chevallier@bootlin.com>
References: <20261104125726.1754980-1-maxime.chevallier@bootlin.com>
 <20261104125726.1754980-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:05:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: adc: ti-tla2528: uninitialized stack read in tla2528_read()
--

commit 533ebab68a73de725d753757faa2921e38e9ba64
Author: Maxime Chevallier <maxime.chevallier@bootlin.com>

iio: adc: add driver for Texas Instruments TLA2528 adc

This commit adds an IIO ADC driver for the Texas Instruments TLA2528 8-chan=
nel
12-bit I2C ADC, supporting direct-mode raw channel reads and scale reportin=
g.

> diff --git a/drivers/iio/adc/ti-tla2528.c b/drivers/iio/adc/ti-tla2528.c
> new file mode 100644
> index 0000000000000..ec754ec43d7c0
> --- /dev/null
> +++ b/drivers/iio/adc/ti-tla2528.c
> @@ -0,0 +1,215 @@

[ ... ]

> +static int tla2528_read(struct tla2528 *tla2528, u8 channel, int *val)
> +{
> +	__be16 data;
> +	int ret;
> +
> +	guard(mutex)(&tla2528->lock);
> +
> +	ret =3D regmap_update_bits(tla2528->regmap, TLA2528_CHANNEL_SEL_ADR,
> +				 TLA2528_CHANNEL_SEL_MANUAL_CHID, channel);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D i2c_master_recv(tla2528->client, (char *)&data, sizeof(data));
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D be16_to_cpu(data) >> 4;
> +
> +	return 0;
> +}

[Severity: Medium]
As reported by Sashiko on v2 [1], in drivers/iio/adc/ti-tla2528.c, can
tla2528_read() return uninitialized stack memory from data to user-space wh=
en
tla2528_read_raw() reads a channel?

i2c_master_recv() calls i2c_transfer_buffer_flags(), which calls
i2c_transfer() for 1 message:

drivers/i2c/i2c-core-base.c:i2c_transfer_buffer_flags() {
	...
	ret =3D i2c_transfer(client->adapter, &msg, 1);

	/*
	 * If everything went ok (i.e. 1 msg transferred), return #bytes
	 * transferred, else error code.
	 */
	return (ret =3D=3D 1) ? count : ret;
}

If the adapter's master_xfer callback returns 0 messages transferred (or fe=
wer
than sizeof(data) bytes are received), i2c_master_recv() returns a
non-negative value other than sizeof(data) without populating data.

Since tla2528_read() only checks for ret < 0, should it also return -EIO wh=
en
ret !=3D sizeof(data)?

[1] https://lore.kernel.org/r/20261030164705.297354-3-maxime.chevallier@boo=
tlin.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104125726.1754=
980-1-maxime.chevallier@bootlin.com?part=3D2

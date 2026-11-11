Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371724;
	b=swJRoMLJSRABNVqPi7yW8SNf12LMIbPDVqZcIFp0uf2+rSrt4/++R3L6dVV/GvHHDCmP
	 At/eQql0iC157GaUalti5NbYaBoUiC5oecY6GWmHli7usEEzDDbbNQgi5ys7AQyJco4rs
	 6D2GmJSjFFpMMlqkhEXy/WaK5rGX9IVQPiBcncXUNv2FU76d82y7AfZD5uLd11B1lWWaa
	 N1tnBsnC9BwUZ3Yd3Xc74nKoFeSd/IdRGA4bJpg9miKBDDnAtotmd4ccxFzP7jhrSDAKK
	 BRfnNUeMF51Up+MsNWVKgByuxp/1rBu6ZMSGsjjSCJQi47zZQRGYCrItIj4u9bsAFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371724;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1XLRYG1y/hi0Gq8iGe1P6YMeKpym6owbaGYvlkX+KAs=;
	b=zoZilJ7xBAbwBN93+sMudUs1lgE/9LtriVCywkfipHQq7FkOaq7JKW5iAcUWxfBCUA1j
	 X4HjBLhefFV3FBXV5YOw/IU1t1WYK8Lm4nEAHcS2WxXyDPmo9XagktpzXgJ52AQoXC8dB
	 sVI2b2YvOLbwI1mnZ38fJ0QmfRQqv3NDiA8ddkI2FYeLoT9NMKhL+6/Td8yKrfixM0D9W
	 wGMPpvW8rJPXKK83OSW+l1plWOlsynvd3HJ6XTaJOluIQG8VrUzwDSLVEfmfxZkg4e6Pd
	 pOtLDlYQznYBeZhyVlpwKwxhJ/fhjbsVND0LdGmFWUckflpk8aw3v04YoMy8c5gikTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VaQ/csBG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB4606A32D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VaQ/csBG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382061F0093C;
	Wed, 11 Nov 2026 04:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371724;
	bh=1XLRYG1y/hi0Gq8iGe1P6YMeKpym6owbaGYvlkX+KAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VaQ/csBGT6vRG4dGzwECsN/6IeCyTNx3gl+7CZPnM3yZopXNzmYwWfV7HVKc/90+L
	 SYdecDdUzC+f4nMAkOO7EK/XlmAWL8qg0vDNvMrEd8MMmCEGERjlEWe4LeG+6V9HFO
	 LtaBK5Bjv2AOZu2zCHbVLpbK02ap0MA5PY9XYinVzDojezpDv/eN6A8PTLyiwTFhh4
	 jaTcVlx38uGtRTXOGKXayQunrFLPZUaIlqHyJX9BzHCRZI8fgzaaPuS6dzDNZRmupO
	 5IZf9BP7fTNht7KZ3LSMHRux9RwS29MMVT9vUQVph1ac6HSh85VTjPSNaX1p96tBnm
	 3ZezazG2WHrkA==
Message-ID: <sashiko-outbox-208299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] i3c: mipi-i3c-hci: Program AST2700 IBI
 termination threshold
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:35:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] i3c: mipi-i3c-hci: lost IBI threshold in
  i3c_hci_do_reset_and_restore()
--

commit 8e158c24faa65911afb5d2dc115124fa69c5c4f7
Author: Billy Tsai <billy_tsai@aspeedtech.com>

i3c: mipi-i3c-hci: Program AST2700 IBI termination threshold

This commit adds HCI_QUIRK_IBI_PAYLOAD_THLD and programs the AST2700
ASPEED_I3C_MST_MRL register to grow and enable the IBI payload
termination threshold when payload IBIs are requested.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/aspeed.c b/drivers/i3c/maste=
r/mipi-i3c-hci/aspeed.c
> index 3aa910e786f8e..4a73e0180a108 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/aspeed.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
> @@ -136,6 +136,26 @@ void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, =
u32 val)
>  	writel(val, to_aspeed_vendor_data(hci)->inhouse_regs + reg);
>  }
> =20
> +void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi=
_max_len)
> +{
> +	u32 mrl, cur_len;
> +
> +	/*
> +	 * The termination threshold is controller-wide while IBI requests
> +	 * for different devices can run in parallel, so serialize the
> +	 * read-modify-write.
> +	 */
> +	guard(spinlock_irqsave)(&hci->lock);
> +
> +	mrl =3D aspeed_i3c_read(hci, ASPEED_I3C_MST_MRL);
> +	cur_len =3D FIELD_GET(ASPEED_I3C_IBI_TERMINATE_LEN, mrl);
> +
> +	ibi_max_len =3D max(ibi_max_len, cur_len);
> +	aspeed_i3c_write(hci, ASPEED_I3C_MST_MRL,
> +			 ASPEED_I3C_IBI_TERMINATE_EN |
> +			 FIELD_PREP(ASPEED_I3C_IBI_TERMINATE_LEN, ibi_max_len));
> +}

[Severity: Medium]
Does i3c_hci_do_reset_and_restore() lose the ASPEED_I3C_MST_MRL threshold
when DMA recovery resets the controller?

When hci_dma_recovery() -> i3c_hci_reset_and_restore() ->
i3c_hci_do_reset_and_restore() runs, it reprograms the in-house
ASPEED_I3C_CTRL and interrupt registers and restores the DAT entries
(including DAT_0_IBI_PAYLOAD), but nothing caches or restores
ASPEED_I3C_MST_MRL:

drivers/i3c/master/mipi-i3c-hci/core.c:i3c_hci_do_reset_and_restore() {
	ret =3D i3c_hci_reset_and_init(hci);
	if (ret)
		return -EIO;

	if (hci->quirks & HCI_QUIRK_VENDOR_BUS_SETUP)
		aspeed_i3c_bus_setup(hci);
	...
	mipi_i3c_hci_dat_v1.restore(hci);

If the reset clears the in-house registers, payload IBI termination is left
disabled for already-registered devices, and a later i3c_hci_request_ibi()
with a smaller max_payload_len will read cur_len =3D=3D 0 from hardware and
program a threshold smaller than what other devices requested.  Caching the
grown threshold in struct aspeed_i3c_vendor_data and restoring
ASPEED_I3C_MST_MRL during reset recovery would preserve it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-b4-i3c-hci=
-ast2700-v2-0-4d8fff5c5196@aspeedtech.com?part=3D7

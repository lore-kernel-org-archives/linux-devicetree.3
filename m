Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038478;
	b=0Jiw68mEp1JjMF/eQeD1MoBtj+yEy3cjTnNVHTLww1jixyBWdqk48iyhfJgrpWBrTa8f
	 CIqC2IIwML/FoZKEY8yokgaqkj6tPEvfz0Uuemjc3XxCpOkJZ3RNuEHe9Ru20PkR7kAmz
	 21iqKnYfdPOlJJeF+l9NLORPQw6eDtyX+ipnkjXz++F32Inn/Mc7FOFPo/TRirrihPpMs
	 1u+PNos8VtULr1i3q58xesavKms7LzmKZsZjYo5tfS70noJKcyaMcRaFjlbSUGeYSmRD6
	 LXnvGL3jV7AJDIMdNN0tsVC9CdsO4xKl+QGEHI1OlqnwS5Yu4yutZ8EFz1ye++3OaHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038478;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fl5wkpTUBLeUi9bcbFclRYjm8YxHwT66isDZ4a7J77g=;
	b=h4k3Gszz6HRL+WRbgNmtikJDIKnXh4k2FCXBcOtVPIvyzAkUxnyYu9jM1YSOfMaf3Hos
	 KTZDlBi1U56ihVmp4Ezp8ri9yh7caFC8yVqhQJIP3WE9AVKJwMQDZ7lJqHsEt3o2XLsiy
	 dM4Q9J9Ohe1AsKC5MJTlnDS0EwpDSIenfaH7yW2dbPDPizg8HkRRlb/8SP4gXarfSWUB/
	 XbxZDMU7AeWlfyY+GvueCD2rrfNxNaiU/x+yhMcKWtxp25mt3kYBzVN2lqwpuKAFF2zbn
	 vxFZ5+lTh49vYCXm0LhhRKqVvtSyM7sYBP07xI4xkJdeN8f3v9Zy3rvVbuduYSQAcbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFT7GdB3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE09606A32C
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFT7GdB3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589B71F0089F;
	Sat,  7 Nov 2026 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794038477;
	bh=fl5wkpTUBLeUi9bcbFclRYjm8YxHwT66isDZ4a7J77g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFT7GdB31EWmFcRzht943UArfkzXS64ztyaxXwkljCyn3fU/535uHfzttUoyPr3uu
	 ODyZoXfbI1vaFqPGJpigHJrndRkvU1+Lq5TIv5q5x9h5Zf/tV/Jdc8jSVLJtBgLPJQ
	 Nz2calRF+CE0ZMi3OrjHLSM0UVqTL55qvM/N4+Hb/CZOABRl3OjkTXvpXCBUtbiMlO
	 fugeor4FfV/FDr2ixTgZty75zHka1NtoHSK2sAkRzufV+/T+6lXjB67WYZe0MZllUk
	 ZFzvPI7gc8JtJWxK4Ft5ykm3R05t7n1AdYyRWD9aTFzMo3X0czZVA8XhPiKb57muo4
	 cpT0AM2GUxyZA==
Message-ID: <sashiko-outbox-202730@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: cdns,xspi: Add DMA properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107072044.17574-2-jszhang@kernel.org>
References: <20261107072044.17574-1-jszhang@kernel.org>
 <20261107072044.17574-2-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:01:16 +0000
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
- [Medium] spi: dt-bindings: cdns,xspi: misuse of dmas property for
  memcpy channel
--

commit bdaf74eae564e5ab96700c90ad51b7fb6c7c0da6
Author: Jisheng Zhang <jszhang@kernel.org>

spi: dt-bindings: cdns,xspi: Add DMA properties

This commit adds dmas and dma-names properties to the Cadence XSPI
device tree binding to describe a DMA memcpy channel.

> diff --git a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml b/Docum=
entation/devicetree/bindings/spi/cdns,xspi.yaml
> index 38a5795589de2..b19c2e051e189 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
> @@ -40,6 +40,19 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  dmas:
> +    maxItems: 1
> +    description: |
> +      Optional DMA memcpy channel for transfers between memory and the S=
lave
> +      DMA data port. The channel is shared by reads and writes.
> +
> +  dma-names:
> +    const: memcpy
> +
> +dependencies:
> +  dmas: [dma-names]
> +  dma-names: [dmas]

[Severity: Medium]
Should a software-triggered DMA_MEMCPY channel be described with dmas and
dma-names in the device tree binding?

The dmas property in dma-common.yaml describes hardware DMA request lines
routed between a peripheral and a DMA controller. The Cadence XSPI Slave
DMA data port is a memory-mapped aperture driven by the controller's SDMA
trigger interrupt and memory-to-memory DMA_MEMCPY transfers, with no
hardware DMA request signal.

Requesting this channel through devm_dma_request_chan(dev, "memcpy") goes
through of_dma_request_slave_channel() and the DMA controller's
of_dma_xlate() callback, which expects hardware slave request specifiers
in #dma-cells and fails or requires fabricated specifiers on controllers
that validate slave request IDs or only expose DMA_MEMCPY channels.

Other drivers with memory-mapped ports and DMA_MEMCPY transfers, including
the sibling Cadence HPNFC driver in
drivers/mtd/nand/raw/cadence-nand-controller.c and
drivers/spi/spi-cadence-quadspi.c, allocate the channel in the driver via
dma_request_chan_by_mask() with DMA_MEMCPY instead of adding dmas =3D
"memcpy" to the binding. If a platform does wire a hardware DMA request
line to the SPI controller, spi-controller.yaml names a shared channel
"rx-tx" rather than "memcpy".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107072044.1757=
4-1-jszhang@kernel.org?part=3D1

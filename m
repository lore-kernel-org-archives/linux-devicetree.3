Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869DD372B41
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712900; cv=none; b=uCQUZNKlU7us5SsKXIQHb3+jFpgRe6wCQCoUVVBizXoij2ladYRbc8LhsuZDmnMxVbM9b5cMvkAiiHkWfsGpOL+bP572FiLBXuji04EM62PXDf//S6n7DwuwzotmaKi3RbZPLVvrA1afuVEuqvgsMKbgY8xttvQg5LoP/Rnijjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712900; c=relaxed/simple;
	bh=FI7Hel6RilWpNyO9SGshWxOzdfmuwQ+CO9gVexwqpnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pP4fdQIG7h/CBfw0wQL6cUXGrTZ/USNIgL/gh00kqnDN7XEvxEKI0bz77m3Qq0KoTOmT2jLmTFkPKyd825lyA1lL37RMoZzJhtaBOb8pRN235p+TW/vPwvEx3kCs5ZXC8zoG202yz0V7sf89ibQnCOTRtZN1O7rgB9I2f2PRNms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIXtnt7b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIXtnt7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA1D1F00A3A;
	Wed, 22 Jul 2026 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784712897;
	bh=HHamKZVvHXunz+MiHM1wCGlJXZlA0d0jnG0gYE+UpLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hIXtnt7bwW8pF+HscNimhgnyi8g3qsc3VVjPoQA/d+dyNsk+eglJlSS4GAszuRGSB
	 YN1JXx9CUiYw5ALb/IpIOv0E79oR/sbMXwm7vsbyea3AXUkZ3EXkWtn7EyFchlV746
	 neKkIzj38CTv4fBhUf9Td5o5c2Q8vDBIfDKt86b7R8bg/jOHxL/AzJkJYWyjTAEMv+
	 xWavL659SVrT1OqYf/FQUugCHRlUZGeZySqXrqXhDOqvfHl5vHtzBLu2eE6lYsufN/
	 bE5D7kOTzYqhcjkd3lhs/4le8h5WQfZfqKZFlClUhGvDr4qqua+egSmtZWtNn4pof8
	 ir/pF50Ic/5pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] ARM: dts: stm32: Use DMA FIFO mode for all spi in
 stm32mp151
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-3-6ef611523232@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
 <20260722-spi_arm_stm32_dt-v1-3-6ef611523232@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:34:57 +0000
Message-Id: <20260722093457.6CA1D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The SPI driver uses register accessors (`writel_relaxed`/`readl_re=
laxed`) instead of stream accessors for FIFO data buffers, causing inconsis=
tent byte ordering between PIO and DMA transfers on big-endian systems.
--

--- Patch [3]: [PATCH 3/6] ARM: dts: stm32: Use DMA FIFO mode for all spi i=
n stm32mp151 ---
commit d73fb38e89c8770514f3125ef0d74a5af311d84e
Author: Alain Volmat <alain.volmat@foss.st.com>

ARM: dts: stm32: Use DMA FIFO mode for all spi in stm32mp151

When used, configure the DMA in FIFO mode (instead of Direct) for all
SPI instances of stm32mp151.dtsi

> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/=
stm32mp151.dtsi
> index 84f68e8563d85..e7fec8b49ae16 100644
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
[ ... ]
> @@ -943,8 +943,8 @@ spi2: spi@4000b000 {
>  				interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&rcc SPI2_K>;
>  				resets =3D <&rcc SPI2_R>;
> -				dmas =3D <&dmamux1 39 0x400 0x05>,
> -				       <&dmamux1 40 0x400 0x05>;
> +				dmas =3D <&dmamux1 39 0x400 0x01>,
> +				       <&dmamux1 40 0x400 0x01>;

[Severity: High]
This is a pre-existing issue, but this change to use DMA FIFO mode highligh=
ts
a potential inconsistency in the SPI driver. Does this driver produce
inconsistent byte ordering between PIO and DMA transfers on big-endian
systems?

Looking at stm32h7_spi_write_txfifo() and stm32h7_spi_read_rxfifo() in
drivers/spi/spi-stm32.c, register accessors are used for FIFO data buffers:

drivers/spi/spi-stm32.c:stm32h7_spi_write_txfifo() {
    ...
    writel_relaxed(*tx_buf32, spi->base + STM32H7_SPI_TXDR);
    ...
}

drivers/spi/spi-stm32.c:stm32h7_spi_read_rxfifo() {
    ...
    *rx_buf32 =3D readl_relaxed(spi->base + STM32H7_SPI_RXDR);
    ...
}

Because writel_relaxed() and readl_relaxed() perform CPU-to-LE byte swapping
on big-endian CPUs, PIO transfers will output a reversed byte order compared
to DMA transfers, which transfer memory exactly as-is without byte swapping.
Should these use stream accessors like writesl() and readsl() instead to
preserve byte order for FIFO buffers?

>  				dma-names =3D "rx", "tx";
>  				access-controllers =3D <&etzpc 27>;
>  				status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-spi_arm_st=
m32_dt-v1-0-6ef611523232@foss.st.com?part=3D3

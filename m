Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004E192D97
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887774; cv=none; b=NnyoDMft0SHTDdLtbG0CH765C7HdI87i0AA1oVhLytcmwgWTbHCgmlJ7NY+MDJAaiNVycg4SHl6HVeRmSbfV1AXhnA9iSE5nmZh1mPkwR8q6Zr9nJGY8+gOiI3zpVqt6i3S7740UaPUQX3qsNNsIHhYa6dqw6RiKZZGlYNYO6vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887774; c=relaxed/simple;
	bh=oVQSnFANYVtICnG044r6lXcCF2/sy2mAzFlzljcUVFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GWdstu9d2DJia6yIOrfFFm2SMH9rn3mAzulwDVHd2BdtZp2bTI3SX/WaOayaU7vjGI6W6ZaOdHovghYH9ZHcgKhZ3v/ld6Iq0kazG7MX77hxZvAG2bS1OkShcUR7huDfiTg4a1n96pAkXVk2CZeR95ZAmyTkp1DRiG7FzpKBWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsRbfiJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsRbfiJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BC51F00893;
	Mon,  8 Jun 2026 03:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780887772;
	bh=qfBPKX0coFA0YWNicPUkr1szsz4j7lIvv6De/Dqr+zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YsRbfiJ1ZVJEpisPxG28NYz6mA07fKYWfo7SuS0yEkIx4RVH0p4AtEVCd72aDqhPK
	 dVQ3M2ECTBPxxUeTJVDK4Ev8xdIBUhzyhc6y2p8WG8VI0boDGSi+DjRJvjc3kJ+MyR
	 vjHtdD1WQYNLsdlXSTT8CwafHBrFSWmi23atMtRsuG5QaGHECBDKcusGqLVyvCFhHs
	 OraQBARCxafJZAY7to/3Y0A60D2osjfQSDjJ3gu2SUO5GJTDD2FH6iSUfnbF3XrKXZ
	 DinAFCQ/j5TJOSvzGDA+QQyD2SxQu0JLInZe0nhPwYT9iBEo9d6rWGKe5zFK2qvHzA
	 kuY/eyJWHfL8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608025009.1504971-3-cwweng@nuvoton.com>
References: <20260608025009.1504971-3-cwweng@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 03:02:52 +0000
Message-Id: <20260608030252.B9BC51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The TX/RX loop unconditionally waits for the RX FIFO to fill, stal=
ling and timing out during half-duplex transmit-only phases (Quad/Dual OUT).
- [High] A fast-read race condition exists in nuvoton_qspi_reset_fifo where=
 the status bit is polled before the hardware asserts it.
- [Medium] SPI_CS_HIGH support is fundamentally broken due to omission from=
 ctlr->mode_bits.
--

commit 822bfa8b5549aa56a2619eaa2c69adefdc89e29f
Author: Chi-Wen Weng <cwweng.linux@gmail.com>

spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support
   =20
Add SPI controller driver support for the Nuvoton MA35D1 Quad SPI controlle=
r.

> diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
> new file mode 100644
> index 0000000000000..93b60b6142e53
> --- /dev/null
> +++ b/drivers/spi/spi-ma35d1-qspi.c

[ ... ]

> +static int nuvoton_qspi_reset_fifo(struct nuvoton_qspi *qspi)
> +{
> +	u32 val;
> +
> +	val =3D nuvoton_qspi_read(qspi, NUVOTON_QSPI_FIFOCTL_OFFSET);
> +	val |=3D NUVOTON_QSPI_FIFOCTL_TXRST_MASK |
> +	       NUVOTON_QSPI_FIFOCTL_RXRST_MASK;
> +	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_FIFOCTL_OFFSET);
> +
> +	/* FIFO reset is extremely fast, safe to keep atomic for this micro-wai=
t */
> +	return readl_poll_timeout_atomic(qspi->regs + NUVOTON_QSPI_STATUS_OFFSE=
T,
> +					 val,
> +					 !(val & NUVOTON_QSPI_STATUS_TXRXRST_MASK),
> +					 1, NUVOTON_QSPI_TIMEOUT_US);
> +}

[Severity: High]
Could this read a stale 0 before the hardware has time to assert the
TXRXRST_MASK bit?

If the IP takes a few clock cycles to propagate the reset and assert the
bit to 1, this polling might return success prematurely on the very first
iteration. This could lead to data loss if we start writing to the FIFOs
while they are still mid-reset.

[ ... ]

> +static void nuvoton_qspi_set_bus_width(struct nuvoton_qspi *qspi,
> +				       unsigned int buswidth,
> +				       enum spi_mem_data_dir dir)
> +{
> +	u32 ctl =3D 0;
> +
> +	if (buswidth =3D=3D 4)
> +		ctl |=3D NUVOTON_QSPI_CTL_QUADIOEN_MASK;
> +	else if (buswidth =3D=3D 2)
> +		ctl |=3D NUVOTON_QSPI_CTL_DUALIOEN_MASK;
> +
> +	if (buswidth > 1 && dir =3D=3D SPI_MEM_DATA_OUT)
> +		ctl |=3D NUVOTON_QSPI_CTL_DATDIR_MASK;

[ ... ]

> +static int nuvoton_qspi_txrx(struct nuvoton_qspi *qspi, const void *txbu=
f,
> +			     void *rxbuf, unsigned int len)
> +{

[ ... ]

> +	/*
> +	 * Use conservative word-by-word PIO access. This keeps the initial dri=
ver
> +	 * simple and avoids relying on FIFO threshold interrupts or DMA suppor=
t.
> +	 */
> +	for (i =3D 0; i < words; i++) {
> +		ret =3D nuvoton_qspi_wait_tx_not_full(qspi);
> +		if (ret) {
> +			dev_err(qspi->dev, "TX FIFO full timeout\n");
> +			return ret;
> +		}
> +
> +		nuvoton_qspi_write(qspi, nuvoton_qspi_tx_word(txbuf, i,
> +							      qspi->bits_per_word),
> +				   NUVOTON_QSPI_TX_OFFSET);
> +
> +		ret =3D nuvoton_qspi_wait_rx_not_empty(qspi);

[Severity: High]
Will this loop stall and time out during half-duplex transmit-only phases?

When the bus width is > 1 and direction is OUT, NUVOTON_QSPI_CTL_DATDIR_MASK
is set in nuvoton_qspi_set_bus_width(). This typically places the controller
in an OUT-only state and disables the RX path so no data enters the RX FIFO.

Because the loop here unconditionally calls nuvoton_qspi_wait_rx_not_empty()
for every transmitted word, it seems this will stall until the 10,000 us
timeout is reached, causing multi-IO transmit operations to fail.

[ ... ]

> +static void nuvoton_qspi_mem_set_cs(struct spi_device *spi, bool enable)
> +{
> +	struct nuvoton_qspi *qspi =3D spi_controller_get_devdata(spi->controlle=
r);
> +	bool assert =3D enable;
> +
> +	if (spi->mode & SPI_CS_HIGH)
> +		assert =3D !assert;
> +
> +	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), assert);
> +}

[ ... ]

> +static int nuvoton_qspi_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ctlr->bits_per_word_mask =3D SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
> +				   SPI_BPW_MASK(32);
> +	ctlr->mode_bits =3D SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST |
> +			  SPI_RX_DUAL | SPI_TX_DUAL |
> +			  SPI_RX_QUAD | SPI_TX_QUAD;

[Severity: Medium]
Does the omission of SPI_CS_HIGH from mode_bits prevent active-high devices
from probing?

The driver implements logic to support active-high chip selects in
nuvoton_qspi_mem_set_cs() by inspecting spi->mode & SPI_CS_HIGH.

However, since SPI_CS_HIGH is not included in ctlr->mode_bits, the SPI
core subsystem's spi_setup() will immediately return -EINVAL if a device
tree node requests spi-cs-high. This renders the active-high logic
unreachable dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608025009.1504=
971-1-cwweng@nuvoton.com?part=3D2

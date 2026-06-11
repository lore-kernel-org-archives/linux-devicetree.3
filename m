Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1EC3A6F0A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170071; cv=none; b=u17ql6kTIN3e/ib+qy8Zlpm5GEQJMkYvMAJBzZe0laUptOWlB14lGRJ8A3kVMUjU3ZvshOV2+losE3Vbu2KDlBTcdGDrl6dmZTBq5sptyv5KTWETJzUciECnrmMppBDdgV+n9pDWrQr+p02bzeX6Ef7GdX4DPAL9j58W6fhNfA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170071; c=relaxed/simple;
	bh=eFbEf1pKkCcVCy2wKi+vmF3PeJUCFxf8kW5/nPEY920=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PzJ66O9W+KrIck1UF0fKa1Glo2RhLQeyQ8GL8v+IYmX1KX5mokfije/nHfhu8kQnJeNepzEOURRYVCnIH07FMpNZW50rA/o+RMsMfF3LKs1uA3qqIZoFBRxrWFjMG2B+d/55QrnvLr+SvagprSYeQgOj1ls6mKAcy0xO2lNinmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1ZPwn0X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1ZPwn0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1DE1F00893;
	Thu, 11 Jun 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781170070;
	bh=ZTqoYPa77YmZtEe2VsbKeXPULHSxypICbbyldN4EmoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B1ZPwn0XflpGtIh22W3Kh4NCs1YKxyk1SGdTEmbFydY6X1YUqF4qiW2ynkG2Yg3+P
	 cVhtgtq9GnMsYqS89GZYEIN3N3BPmVgBHmNJ/noDD4Y5LeBgzzW7WW9VPH7ub2ZbDe
	 RBZmUhi1LRWDsW+Kb00xFob6j4DW5U6iPIU/wmbbVlTWQ0Ba2ADQTZOKPL3/EqSjRZ
	 i6jIb2W5CeZSfCc8hR4CalHDcE9nDMNNnAQJV5rEfmkPPeOEyImaIXPVgzPgSOKXuS
	 F6bnf6nBt2J+lxL+ubTzoLKebFOmwebPifyi1yorHB0v/aP2kbzLgbLIJ7kw+It3MQ
	 pSRGa0gxA7Gcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611091246.2070485-3-cwweng.linux@gmail.com>
References: <20260611091246.2070485-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:27:49 +0000
Message-Id: <20260611092750.1C1DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Inconsistent chip-select polarity logic between SPI core and spi-m=
em operations leads to inverted CS levels.
- [High] Data race on the Slave Select Control (SSCTL) register due to conc=
urrent `spi_setup()` and transfers.
- [High] The PIO transfer loop uses atomic polling for bulk data transfers =
without yielding the CPU, risking soft lockups on large memory operations.
--

commit 870f4cc6d9d6ab3e7f64bb28977c07e0fcfd4027
Author: Chi-Wen Weng <cwweng@nuvoton.com>

spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support

Add SPI controller driver support for the Nuvoton MA35D1 Quad SPI
controller. The controller supports standard SPI transfers and spi-mem
operations in single, dual, and quad modes.

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
new file mode 100644
index 0000000000000..d3e687b6a06d7
--- /dev/null
+++ b/drivers/spi/spi-ma35d1-qspi.c
[ ... ]
> +static int nuvoton_qspi_txrx(struct nuvoton_qspi *qspi, const void *txbu=
f,
> +			     void *rxbuf, unsigned int len)
> +{
> +	unsigned int bytes_per_word =3D DIV_ROUND_UP(qspi->bits_per_word, 8);
> +	unsigned int words;
> +	u32 val;
> +	int ret;
> +	int i;
> +
> +	if (!len)
> +		return 0;
> +
> +	if (len % bytes_per_word)
> +		return -EINVAL;
> +
> +	words =3D len / bytes_per_word;
> +
> +	ret =3D nuvoton_qspi_reset_fifo(qspi);
> +	if (ret) {
> +		dev_err(qspi->dev, "FIFO reset timed out\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Use conservative word-by-word PIO access. This keeps the initial dri=
ver
> +	 * simple and avoids relying on FIFO threshold interrupts or DMA suppor=
t.
> +	 *
> +	 * The MA35D1 QSPI controller pushes one RX FIFO entry for each TX word=
 in
> +	 * single, dual-output and quad-output modes. Drain RX after every TX w=
ord
> +	 * and discard the value for TX-only transfers to avoid RX FIFO overflo=
w.
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
Will this loop trigger kernel soft lockups on large memory operations?

The wait helpers nuvoton_qspi_wait_tx_not_full() and
nuvoton_qspi_wait_rx_not_empty() use readl_poll_timeout_atomic(), which
busy-waits without yielding the CPU.

Since the driver does not set max_transfer_size limits, the SPI framework
can pass down arbitrarily large buffers (e.g., several megabytes for firmwa=
re
flashes or filesystems).

Does this loop need a cond_resched(), or should the controller set
appropriate transfer size limits to prevent CPU stalls?

> +		if (ret) {
> +			dev_err(qspi->dev, "RX FIFO empty timeout\n");
> +			return ret;
> +		}
> +
> +		val =3D nuvoton_qspi_read(qspi, NUVOTON_QSPI_RX_OFFSET);
> +		if (rxbuf)
> +			nuvoton_qspi_rx_word(rxbuf, i, val, qspi->bits_per_word);
> +	}
[ ... ]
> +static void nuvoton_qspi_set_cs_level(struct nuvoton_qspi *qspi,
> +				      unsigned int cs, bool assert)
> +{
> +	u32 mask;
> +	u32 val;
> +
> +	switch (cs) {
> +	case 0:
> +		mask =3D NUVOTON_QSPI_SSCTL_SS0_MASK;
> +		break;
> +	case 1:
> +		mask =3D NUVOTON_QSPI_SSCTL_SS1_MASK;
> +		break;
> +	default:
> +		dev_warn(qspi->dev, "invalid chip select %u\n", cs);
> +		return;
> +	}
> +
> +	val =3D nuvoton_qspi_read(qspi, NUVOTON_QSPI_SSCTL_OFFSET);
> +
> +	if (assert)
> +		val |=3D mask;
> +	else
> +		val &=3D ~mask;
> +
> +	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_SSCTL_OFFSET);

[Severity: High]
Can this unprotected read-modify-write corrupt the active chip-select state?

The SPI core invokes spi_set_cs() directly during spi_setup() without holdi=
ng
controller-level locks.

If a transfer is active for CS0, and a concurrent setup call occurs for CS1
(such as an ioctl(SPI_IOC_WR_MODE) from spidev), could this read-modify-wri=
te
on the shared SSCTL register race and cause silent data corruption or abort=
ed
transfers?

> +}
> +
> +static void nuvoton_qspi_set_cs(struct spi_device *spi, bool enable)
> +{
> +	struct nuvoton_qspi *qspi =3D spi_controller_get_devdata(spi->controlle=
r);
> +
> +	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), enable);
> +}
> +
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

[Severity: High]
Does this cause contradictory chip-select polarity between standard SPI
transfers and SPI memory operations?

The SPI framework passes the physical level to drive to ctlr->set_cs(),
where false means drive low and true means drive high. nuvoton_qspi_set_cs()
passes this directly to nuvoton_qspi_set_cs_level().

However, nuvoton_qspi_mem_set_cs() treats its enable parameter as a logical
assertion flag and performs a manual inversion.

For an active-low device, will one of these paths end up driving the
chip-select line with the wrong polarity?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611091246.2070=
485-1-cwweng.linux@gmail.com?part=3D2

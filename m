Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F326E6F3
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694054; cv=none; b=gj7LmmZ7lPCdvlYedULv004vjPGsJUmDkGk5E6MHi3zKs7a2pQUrhs81Mf1yt49mNMCZ0LyOMCK1iYp2wzUIIdCqJM20vKRchWgk7AdQrTVALZPyS/ai3X7uGYsx8tnFqHvR0iksCwFBwOZD8b2yXP0P3Ecpv/96eR+jxWhJ6A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694054; c=relaxed/simple;
	bh=fbCZWrrnxyX3UOpy1kS0k0np+WQRfl9quRkwn+yl9JI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YmkjvoAWv621tbiYc7nyMgpIKoMea97XH2SJrZojnjN+Oz+t+UOptOCaLYqMlezJv5eFuxFeXjmTlxSsVUlfFLUo9oceRjGNFNNWsL9LawkjzhjXZRUAFi/uIBqhM2X7OqERHKjqqmCIBWMwSjE0KVEaDbGkUL3sf4nOWZygd2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tt9mI5Jf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tt9mI5Jf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566861F000E9;
	Mon, 25 May 2026 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779694052;
	bh=qvkqjgMBFw6RMy6l8MpL1fw0aEtgmtCmBLx7d6gc4cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tt9mI5JfHTghJS0vE5XRvC8+wTiPA4240qUy9PehZ7p90vQoaeARDuVQ/vFwXyEW/
	 StdTNTr5IoOyyv8D96Kx+FAVDhB82PCQfF3baYp3tCBY0F+IKVEBKEZv8oHZ2swuZh
	 lT+kEl6xzaXniIX45a/cg08zS52Xm8GDifL2pfcGJsM7nEqYBuc7yYX+Jop5MxOeKL
	 B/Fv/FGKnXIqJbZKCsO+3/f9o781kc1Fgp6xeSNhVTzS3Myi6J5ZLlGchifHHNFKbs
	 8CzxC6aQkgGNEnwOcZY6QMLEnXJgsYbr/t7mfJJUbR4OOZU4XaX2o6Sv/xu+rEdVoH
	 JpEZjrFIIdPtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] spi: tegra210-quad: Allocate DMA memory for DMA
 engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525-tegra194-qspi-iommu-v2-1-a11c53f804b2@gmail.com>
References: <20260525-tegra194-qspi-iommu-v2-1-a11c53f804b2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:27:31 +0000
Message-Id: <20260525072732.566861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional DMA unmapping in tegra_qspi_dma_unmap_xfer() causes =
invalid unmaps for unpacked transfers.
- [High] The error path in tegra_qspi_dma_map_xfer() unmaps tx_dma without =
verifying if tx_buf was provided.
- [High] Aligning the DMA transfer length up to a multiple of 4 bytes can c=
ause the DMA engine to write out of bounds.
- [High] DMA mappings are leaked when the transfer times out or when DMA se=
tup fails.
--

commit 78250c2468331b7f824d5bbb2690d151a21edc13
Author: Aaron Kling <webgeek1234@gmail.com>

spi: tegra210-quad: Allocate DMA memory for DMA engine

When the SPI controllers are running in DMA mode, it is the DMA engine
that performs the memory accesses rather than the SPI controller. Pass
the DMA engine's struct device pointer to the DMA API to make sure the
correct DMA operations are used.

> diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-q=
uad.c
> index db28dd556484b..588a929a97850 100644
> --- a/drivers/spi/spi-tegra210-quad.c
> +++ b/drivers/spi/spi-tegra210-quad.c

[ ... ]

> @@ -574,15 +576,15 @@ static int tegra_qspi_dma_map_xfer(struct tegra_qsp=
i *tqspi, struct spi_transfer
>  	len =3D DIV_ROUND_UP(tqspi->curr_dma_words * tqspi->bytes_per_word, 4) =
* 4;

[Severity: High]
This isn't a bug introduced by this patch, but could aligning this length up
to a multiple of 4 bytes cause the DMA engine to write out of bounds?

If the client requested a transfer length that is not a multiple of 4 bytes,
the DMA engine will write up to 3 bytes past the end of the client's buffer.

If the buffer lacks sufficient alignment padding, could this cause memory
corruption?

> =20
>  	if (t->tx_buf) {
> -		t->tx_dma =3D dma_map_single(tqspi->dev, (void *)tx_buf, len, DMA_TO_D=
EVICE);
> -		if (dma_mapping_error(tqspi->dev, t->tx_dma))
> +		t->tx_dma =3D dma_map_single(tqspi->tx_dma_dev, (void *)tx_buf, len, D=
MA_TO_DEVICE);
> +		if (dma_mapping_error(tqspi->tx_dma_dev, t->tx_dma))
>  			return -ENOMEM;
>  	}
> =20
>  	if (t->rx_buf) {
> -		t->rx_dma =3D dma_map_single(tqspi->dev, (void *)rx_buf, len, DMA_FROM=
_DEVICE);
> -		if (dma_mapping_error(tqspi->dev, t->rx_dma)) {
> -			dma_unmap_single(tqspi->dev, t->tx_dma, len, DMA_TO_DEVICE);
> +		t->rx_dma =3D dma_map_single(tqspi->rx_dma_dev, (void *)rx_buf, len, D=
MA_FROM_DEVICE);
> +		if (dma_mapping_error(tqspi->rx_dma_dev, t->rx_dma)) {
> +			dma_unmap_single(tqspi->tx_dma_dev, t->tx_dma, len, DMA_TO_DEVICE);

[Severity: High]
This isn't a bug introduced by this patch, but does this error path safely
unmap tx_dma?

If t->tx_buf is NULL during a half-duplex RX-only transfer, t->tx_dma is
never mapped.  If the rx_dma mapping then fails, we will attempt to unmap an
uninitialized DMA address here.

Could this corrupt the IOMMU state and trigger faults?

>  			return -ENOMEM;
>  		}
>  	}
> @@ -597,9 +599,9 @@ static void tegra_qspi_dma_unmap_xfer(struct tegra_qs=
pi *tqspi, struct spi_trans
>  	len =3D DIV_ROUND_UP(tqspi->curr_dma_words * tqspi->bytes_per_word, 4) =
* 4;
> =20
>  	if (t->tx_buf)
> -		dma_unmap_single(tqspi->dev, t->tx_dma, len, DMA_TO_DEVICE);
> +		dma_unmap_single(tqspi->tx_dma_dev, t->tx_dma, len, DMA_TO_DEVICE);
>  	if (t->rx_buf)
> -		dma_unmap_single(tqspi->dev, t->rx_dma, len, DMA_FROM_DEVICE);
> +		dma_unmap_single(tqspi->rx_dma_dev, t->rx_dma, len, DMA_FROM_DEVICE);

[Severity: High]
This isn't a bug introduced by this patch, but can this cause invalid DMA
unmaps for unpacked transfers?

For unpacked transfers, tegra_qspi_start_dma_based_transfer() skips mapping
client buffers and uses a pre-allocated bounce buffer instead.

Since this function is called unconditionally and only checks for the prese=
nce
of t->tx_buf and t->rx_buf, it will call dma_unmap_single() on the
uninitialized t->tx_dma and t->rx_dma fields when tqspi->is_packed is false.

>  }
> =20
>  static int tegra_qspi_start_dma_based_transfer(struct tegra_qspi *tqspi,=
 struct spi_transfer *t)

[Severity: High]
This isn't a bug introduced by this patch, but are DMA mappings leaked when
the transfer times out or when DMA setup fails?

When tegra_qspi_dma_map_xfer() dynamically maps client buffers, if subseque=
nt
steps like dmaengine_slave_config() fail in this function, the driver retur=
ns
immediately without unmapping the buffers.

Additionally, if the DMA transfer times out in
tegra_qspi_transfer_one_message(), it jumps to the exit label and returns
without calling tegra_qspi_dma_unmap_xfer().

Could this permanently leak mapped DMA addresses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-tegra194-q=
spi-iommu-v2-0-a11c53f804b2@gmail.com?part=3D1

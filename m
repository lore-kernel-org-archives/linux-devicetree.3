Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75B3D88F6
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679165; cv=none; b=eBnW+QaIbpHnkND09PYlBtVeyjGKCgS29ss+O7F8pT5Fl+YMElDpE/Aqf9zbuin9USG+dgwaWXuVL0JbnSsmAQPE4DcHNBNRcOk2DIgXbzs0tAq12520X8830JTcxemWdo0JgWIh6U2JNwxXMthfX3TCb4FI9i67SmABJdJIcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679165; c=relaxed/simple;
	bh=fDhhJ8Au6ZQ5cr+7Gipyc35gk/JJaZ3Tc3Dm61Z7MxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GjjbaqTlmflWqt4acwSdG9nGZxJp/T021vEP+Oc7CfwagI7+wKAtDcswKpDpTl6w2GQ3R2rX6e0nSxgjEvR0jxi6JeOr5oeKnJVKuUdqsVSekq79HEFC7Q4PqAevbElxGcD+h+AP1q8mDgQLdZ9gQpZkulJy2DsliCogPHVjMrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnEcc5JX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnEcc5JX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF62F1F000E9;
	Tue, 25 Aug 2026 17:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679153;
	bh=FtX9EOYfsJ1x/A4bEpn1pMvAyKbXrp+E6vrN6KBet4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnEcc5JXNMKM2KUEAD8paR9rkA8M3z6cfK5OY6kicvXrhagPylEAuVF/K11VOLNHt
	 1Jz4G5iGIFBmwsJSyXJ+0kf0A9FuMN7tHflHmnh1sTJuHkDIS7hKcAh0mlD4+pWzDD
	 4pXz1Evt0tjXtHHIxGzMWAbWSCdCRD/ePVnuKr7rG5e6xz00ook31EU+xTqFWkH8G/
	 OSxxq9ZQbfrI63dR9O5FQcTl64nkANSA0LqJhDSn7yV5OFqlF10GG8OrWf7DMgUMu7
	 DxAy65ryNTf7BakCuxt/hYem+cLGgpwoK9VRDfwryByn0fFBtkxcMRrBVHzaQ9nE80
	 l6jrtbhjQ1zWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 11/18] spi: cadence-quadspi: enable PHY for direct
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Richard Weinberger" <richard@nod.at>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, devicetree@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825171737.776052-12-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-12-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:32:32 +0000
Message-Id: <20260825173232.DF62F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Bypassing PHY for unaligned or short direct reads at high frequenc=
y causes silent data corruption.
- [High] Modifying QSPI configuration registers before the controller is id=
le causes hardware race conditions.
--

commit 478fb069d36d7f959d00975130c0e1c3988aa09c
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for direct reads

This commit adds support for toggling PHY mode around DMA transfers in the
Cadence QSPI driver. It introduces cqspi_tune_phy() to manage the PHY DLL
settings and configuration, and falls back to non-PHY reads for unaligned or
small transfers.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 58bca15dbd6ec..d38a0253e4bda 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1075,6 +1075,109 @@ static int cqspi_tune_phy(struct cqspi_flash_pdat=
a *f_pdata, bool enable)

[ ... ]

> +	/* Disable path: execute unconditionally regardless of idle state. */
> +	cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
> +			       f_pdata->read_delay);
> +
> +	reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +	reg &=3D ~(CQSPI_REG_CONFIG_PHY_EN |
> +		 CQSPI_REG_CONFIG_PHY_PIPELINE);
> +	writel(reg, reg_base + CQSPI_REG_CONFIG);

[Severity: High]
Does modifying active configuration registers before waiting for the contro=
ller
to become idle cause a hardware race condition?

When a successful direct read completes its DMA transfer, cqspi_tune_phy() =
is
called to disable the PHY. Because the QSPI prefetches data in direct mode,
the SPI bus may still be actively receiving data when the DMA finishes,
potentially violating IP requirements if the controller is not idle.

[ ... ]

> @@ -1630,6 +1741,7 @@ static int cqspi_direct_read_execute(struct cqspi_f=
lash_pdata *f_pdata,
>  	loff_t from =3D op->addr.val;
>  	size_t len =3D op->data.nbytes;
>  	u_char *buf =3D op->data.buf.in;
> +	int ret;
> =20
>  	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
>  	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN) {
>  		cqspi_memcpy_fromio(op, buf, cqspi->ahb_base + from, len);
>  		return 0;
>  	}

[Severity: High]
Can bypassing the PHY for short direct reads at high frequencies cause sile=
nt
data corruption?

If a subsystem issues a short read that falls back to cqspi_memcpy_fromio(),
the read will execute at the high post_config_max_speed_hz (e.g., 200MHz DT=
R)
but without DQS or PHY DLL timing, capturing garbage data.

> -	return cqspi_direct_read_dma(f_pdata, buf, from, len);
> +
> +	if (!cqspi_use_tuned_phy(f_pdata, op, post_config_max_speed_hz))
> +		return cqspi_direct_read_dma(f_pdata, buf, from, len);
> +
> +	if (!IS_ALIGNED(from, 16) || !IS_ALIGNED(from + len, 16))
> +		return cqspi_direct_read_dma(f_pdata, buf, from, len);

[Severity: High]
Does this unaligned fallback also risk silent data corruption for the same
reason?=20

Similar to short reads, falling back to cqspi_direct_read_dma() without the
PHY enabled means the controller executes the read at high speed without the
tuned PHY data-capture timing.

> +	ret =3D cqspi_tune_phy(f_pdata, true);
> +	if (ret)
> +		return ret;
> +	ret =3D cqspi_direct_read_dma(f_pdata, buf, from, len);
> +	ret =3D cqspi_tune_phy(f_pdata, false) ?: ret;

The race condition mentioned earlier triggers here. The DMA transfer comple=
tes
and immediately calls cqspi_tune_phy(..., false) without waiting for idle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D11

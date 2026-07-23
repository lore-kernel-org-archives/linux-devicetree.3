Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918554746D5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807379; cv=none; b=RPEJmfukoO1tXkvhb5/9s4pxqqblmsKQKl4LUdFzvFgizZwr4C5DMg3BDYpMVwYTX/JaWy852blnH6oGWZZnP0rK4C8fPGBb2p2b+azntQOI4cynpfudxdV+68EYMcru+tIXiz1EhLoMgAwtjuZfFrE6MyqdWvm3fTuzx57Mt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807379; c=relaxed/simple;
	bh=qQhck4gkMBxCHbE8AczLlEVnvOWAQbTF8MsBU0C4uew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IaNheB+IyqTrDVeKE0vkEetxa3N57YEI88IeuhyIRF9eM7vxwO0LSytvk6QWLWENcHcfV1AuLoIy4U3S9IEDoOZwxHQj+sTAU3Dj6NUTJw6jTsFMMavinJYM+UYXEZck6SmyX1jlebcWqLOM+9mBe14zBeFUDfIsZc6e+7XclZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdvXzkkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdvXzkkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5CE1F00A3A;
	Thu, 23 Jul 2026 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784807342;
	bh=mwrC4kSteXEWCheKXntAg/RjNsbOpv9AVoNEWR914M4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DdvXzkkWR2aX8+j6e/YNhlkNd3lh0lv5bcjo0kxW/tp0NW/MqppdsPdbtsGg68Y6r
	 PcAtmUl8q3R2YL7IBqfR+lyt1+HIkLcpXzYtXzj2OEghywAYbAt1endXKxC5abFpvX
	 lk8T2WFGfHGqTa/A8COOmSo40B538PThITPDsCG7tNO5tAmP+wQ9GVUzP0RiSk4xTW
	 G+CDq+kxUkrFkB5lvgxf6SUc4DBtQGm970GY0CwG/nnoE1WXj/LwMsizSgH98Uk8fX
	 onbLf2Ch7s7+ggfv98xdLBrl9WF1XXAct4m1L7RUU0b6aScE0Bohq5AEhC7hq9XGdH
	 mZJn3VXuFhN1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/17] spi: cadence-quadspi: reprogram CS timing on
 every chip-select switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Michael Walle" <mwalle@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>, conor+dt@kernel.org, robh@kernel.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260723110219.3180747-14-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-14-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:49:00 +0000
Message-Id: <20260723114901.BE5CE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware timing delays are silently truncated and can overflow, le=
ading to near-zero delays and data corruption.
--

--- Patch [13]: [PATCH v6 13/17] spi: cadence-quadspi: reprogram CS timing =
on every chip-select switch ---
commit cfd5fbcbe64f53f00c899f4f86da36ebc0b596a7
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: reprogram CS timing on every chip-select switch

This patch updates the cadence-quadspi driver to reprogram per-device CS
timing and read-capture registers on any chip-select switch, preventing
devices on the same frequency from using stale timing parameters.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 542ad331ff167..8bf3a5a8bf43d 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1570,10 +1570,19 @@ static void cqspi_configure(struct cqspi_flash_pd=
ata *f_pdata,
>  		cqspi_chipselect(f_pdata);
>  	}
> =20
> -	/* Setup baudrate divisor and delays */
> +	/* Update baudrate only on clock change. */
>  	if (switch_ck) {
>  		cqspi->sclk =3D sclk;
>  		cqspi_config_baudrate_div(cqspi);
> +	}
> +
> +	/*
> +	 * Reprogram per-device CS timing and non-PHY read capture on any
> +	 * chip-select or clock switch. Without this, two devices at the same
> +	 * frequency would each see the other's timing parameters after a CS
> +	 * switch, since the lazy clock-only check would never trigger.
> +	 */
> +	if (switch_cs || switch_ck) {
>  		cqspi_delay(f_pdata);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the
hardware timing calculations when cqspi_delay() is called here.

If a large delay is specified in the device tree (like cdns,tshsl-ns) or
the system operates at a high reference clock, could the calculation in
calculate_ticks_for_ns() overflow a 32-bit integer?

drivers/spi/spi-cadence-quadspi.c:calculate_ticks_for_ns() {
    ...
    ticks =3D ref_clk_hz / 1000;
    ticks =3D DIV_ROUND_UP(ticks * ns_val, 1000000);
    ...
}

If the reference clock is high and the requested delay exceeds ~8.5
microseconds, the multiplication might overflow.

Additionally, in cqspi_delay(), the calculated ticks are masked rather
than clamped:

drivers/spi/spi-cadence-quadspi.c:cqspi_delay() {
    ...
    reg =3D (tshsl & CQSPI_REG_DELAY_TSHSL_MASK)
           << CQSPI_REG_DELAY_TSHSL_LSB;
    reg |=3D (tchsh & CQSPI_REG_DELAY_TCHSH_MASK)
           << CQSPI_REG_DELAY_TCHSH_LSB;
    ...
}

If the calculated tick count exceeds 255 (the mask limit), wouldn't the
masking cause the value to wrap around to a near-zero delay instead of
clamping to the maximum allowed 255 ticks? This might lead to inadequate
timing delays and silent data corruption.

>  		cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
>  				       f_pdata->read_delay);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D13

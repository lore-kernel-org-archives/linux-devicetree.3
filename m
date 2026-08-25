Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598F44756CD
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787678961; cv=none; b=U7SIw/aa+1NDlCRw5nLu+8ZNI4jpX0euERkLCdZbYnFfpEGXz2DPH3/bQknUcoDm30mRzK7HQW9taVTj9r2UbGdlUxNNGEpyY/DYdIfzS7071aKT7BcqnCbZP4OXue3HRnF5cf01j2N+9WNcQepTXyO9YneySygLyi9wohSCS5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787678961; c=relaxed/simple;
	bh=l4diE6U2/WrkVGjNJUeFsQ0k5FaZjrt5/qPfb8pDbgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uY5N8REsjCOmMxLK/lobfLO3kMZNZsvt3qdR7tth2gh7WvvXDzZ/0pVjZlE8ZoQiEmMgFG5Ej0n0wM93vwhtBtPVR/YpmEzyKF5Aw8TS7ETInfMz2cRyOAN2YubJvxgsaBEjpqgI1XZHY+gU07uUzF9pnAuATnDgfKyhQC66RuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX7lnYsq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX7lnYsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7941F000E9;
	Tue, 25 Aug 2026 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787678958;
	bh=jE40dZ/URuiJ9zRWztJ12XP2Vep+UwSNOQzCkQINRUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OX7lnYsqhhEOMsEV+rQLggW9cncVzNIBxHApRGBVIzzI4ipC0h5QmjD4zQFsthSBR
	 KcpiqN9woVqVx2GC33Fm8LXwHODbpykwqQI7lKjsAiG8p6S3MkE3gDOsU/F90tdbhV
	 ZzBjqJ99kTCvGp3BP7RBQXnvBdPUbdu9UGlkj21A3U8uOhF7pQsNjGb3jvaTBFmm7k
	 i3fuWd1PTD0/cM3bNH2FrgYa6oIZSqU1xxYZfWJSmcwYJkALuSTjw8999esXrl1G+y
	 DsgN0kg9aH3YZhPFgAiCVFZeMZyBW9kjnd2S2JSVJZVrIG1LPHhIkB0rz6tDvSGj/0
	 heh4+D1tkVuEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/18] spi: cadence-quadspi: add DQS support to read
 data capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, "Vignesh Raghavendra" <vigneshr@ti.com>, robh@kernel.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>
In-Reply-To: <20260825171737.776052-8-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-8-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:29:17 +0000
Message-Id: <20260825172917.CD7941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch introduces a `dqs` parameter to `cqspi_readdata_capture(=
)` but hardcodes it to `false` in `cqspi_configure()`, unconditionally clea=
ring the hardware DQS bit and breaking platforms that rely on the bootloade=
r to enable it.
--

commit e47fa544a8e52f8469fd8ae3d4eeedbed9dc8a9e
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add DQS support to read data capture

This commit adds a DQS (Data Strobe) parameter to cqspi_readdata_capture()
to control data capture timing. DQS mode uses a dedicated strobe signal for
improved timing margins in high-speed SPI modes.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index f8e2663723677..046fa5d69b0f7 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -476,6 +477,11 @@ static void cqspi_readdata_capture(struct cqspi_st *=
cqspi, const bool bypass,
>  	reg |=3D (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
>  	       << CQSPI_REG_READCAPTURE_DELAY_LSB;
> =20
> +	if (dqs)
> +		reg |=3D BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
> +	else
> +		reg &=3D ~BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
> +

[Severity: High]
Does explicitly clearing the DQS bit here destroy hardware state established
by the bootloader?

Previously, this function used a read-modify-write operation that preserved
the existing DQS bit. Platforms that don't utilize the new kernel PHY tuning
infrastructure, but rely on the bootloader to enable DQS, might now
experience read failures and data corruption in high-speed SPI modes when
this state is lost.

>  	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
>  }
> =20
> @@ -1317,7 +1323,7 @@ static void cqspi_configure(struct cqspi_flash_pdat=
a *f_pdata,
>  		cqspi->sclk =3D sclk;
>  		cqspi_config_baudrate_div(cqspi);
>  		cqspi_delay(f_pdata);
> -		cqspi_readdata_capture(cqspi, !cqspi->rclk_en,
> +		cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
>  				       f_pdata->read_delay);
>  	}

[Severity: High]
Does hardcoding false here unconditionally disable DQS on every configurati=
on
cycle?

Because cqspi_configure() is executed unconditionally on any chip-select or
clock frequency switch, this passes false to cqspi_readdata_capture(). This
will unconditionally clear the hardware DQS bit across all Cadence QSPI
controllers, leading to regressions for boards that require it to remain
enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD612609C5
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315621; cv=none; b=IzoLR2gQS8m+5r+rZfDL5Dy46SACAItlbAqpPuh/u2sMVUY+lVPv4wgngJKB/Axpku2G7onNaJWZu855F8yoY5y06EckMhDbi9kRkMd4awgaxjf/M91nBCw9Vwzg14MPPwaBjaPf6/bnM/Xu58CH/BfuNbEElRMrbE0h6FE6GrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315621; c=relaxed/simple;
	bh=56m7mWn7xqOfJ52wXGCB59tB88EgIpHtsPzaYrz3RV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GOoPtt7+eesxmZJ0NZXdaTDJXKLJaplno/xZ415PV/h35/7xjWxvSz18rB2VVLwoMMFon1SuWoERKHPh2W8iCnQSABpsUjQxcT53nS1BHViQVsFtIVs6BMgLkg2WJ1bZ1NkP/C4ZFFFio2/pQ2/o6zPQn+Ctc6voSleev+SMpAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4GZTkuP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4GZTkuP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFCC1F000E9;
	Fri, 17 Jul 2026 19:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315619;
	bh=4dGNDyKz6a88d6gKB0D43gGjMSPfEzeWtmkUMz1yvT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4GZTkuPWHqQiav5tbptAkVdAEJec+UyVxqpxhEuwAM6U6SlfWHkWG2qZRnmTvLCn
	 pSfNO1yoCtQo8ptAsz4ip4zy9djYcBxkKtSEtXNh0LuV4hsXdyY6Ar8Npi2F1g27Sk
	 haduU+WedEMhfSsLAnxU6cZuZmRx3XPAjX+q5sU3DXoqMInxboTidAdAnndlMlZ6dN
	 Fgingq3Wy8adIk65Ciq5Qni/lINU82R04yeRcEo6xCdXBCGYTw1/1yVQsCWlL2yVM4
	 P/p9627hnxflMSpmrCw857i/d1BOUC2jZSUgQT5eJK/1LR/TefEEJhJ/XJzFU1oprW
	 VygPWgY0uOxZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/17] spi: cadence-quadspi: add DQS support to read
 data capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717185116.2065505-8-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-8-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:13:39 +0000
Message-Id: <20260717191339.6AFCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds a `dqs` parameter to `cqspi_readdata_capture()` b=
ut hardcodes it to `false` in its only caller, which unconditionally clears=
 the DQS hardware bit and destroys any preexisting bootloader configuration.
--

--- Patch [7]: [PATCH v5 07/17] spi: cadence-quadspi: add DQS support to re=
ad data capture ---
commit 9c04e0d8a632e24ea7f330776f17875445decaac
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add DQS support to read data capture

This commit adds a DQS (Data Strobe) parameter to cqspi_readdata_capture()
to control data capture timing. It updates the register read-modify-write
sequence to configure the DQS bit and modifies the caller to provide this
new parameter.

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

[Severity: Medium]
Does passing false here unconditionally clear the DQS hardware bit that was
previously preserved from the bootloader?

Prior to this change, the read-modify-write sequence in
cqspi_readdata_capture() did not touch bit 8 (CQSPI_REG_READCAPTURE_DQS_LSB=
).
Now, by hardcoding dqs to false, cqspi_readdata_capture() will actively cle=
ar
the DQS bit.

Could this degrade timing margins and cause read data corruption on platfor=
ms
that currently rely on the bootloader's DQS configuration?

>  				       f_pdata->read_delay);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D7

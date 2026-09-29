Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351240DFBD
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664675; cv=none; b=dgQSjUE9mohDl6zu1pT9RAdpKZHQHd8HjZg5IDu0NUV+KG0yjsupaZ1Pqb7deQZsXOfpMuu0TiE1s+QlNTDkwuf9mMaCbNvdQNtzyJCQwgSalCHpbXxiRcqzBbbXCHhovKi8j/0PbmoUr/JazGehJl9Jd+4UtuPEEm8frfVx7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664675; c=relaxed/simple;
	bh=de2iHGE9gSNovOFClAgdJFwkfcE/hQ8golX7kAjeqIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mjvYBpTStvsgM0aL0NZplAFjamBhe2i99BkSqgHmzVLlEhnrVZAPUQQ7/C+HXuz0EDNH+V525i43M8hP2iDbm5a0wXSZ/LBxbFnFRLhXjQtg2LtfoXZNm+xcY29ENzTf6Wdapjh3vCKpb5QJTgOfccXts/eKX4T1Bn9kZzLBWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyiUDP8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyiUDP8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A869C1F000FF;
	Tue, 29 Sep 2026 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664674;
	bh=CHTAtjB3c+GG4F3c4JL0pyBVEqKqh64i8yUVrYorL38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyiUDP8DkjXrShqywrXq41OI9qg7WffdKzIdMm2u0xUseGd85BgVjRSxTb+KKloUN
	 95SR+Gb2FZ9hauK4UxYaDnRAFfqHYymRDO6QwUn7uUFYxk9sV6uHcE9l3OyhaC/Q7X
	 ta4YJsO07IfQLxcAsO0whn4itTSz0OFkRlbPdE/M6Dk0y87ZLA9LW0sSRpn28exdOW
	 /CW4obXFaJYjiSl+eTxqi5tWGRfF3QGqy02rcjjcBKGlSotISQ3418i44ChFtl0W+0
	 l+UBs6A1lkO0UGF/O31yEg/mUoEH/+jeLM7Oq7rw5yQYJ3kw6JF0r81XQe6lXEgfNE
	 vwXZVxDzcNM/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 07/19] spi: cadence-quadspi: add DQS support to read
 data capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260929063529.1235417-8-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
 <20260929063529.1235417-8-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:51:13 +0000
Message-Id: <20260929065113.A869C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spi: cadence-quadspi: explicit DQS clearing breaks bootloader co=
nfig
--

commit e959fedf4253d1ed7180cf536e4273c62140f0c0
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add DQS support to read data capture

Add DQS (Data Strobe) parameter to cqspi_readdata_capture() to control
data capture timing. DQS mode uses a dedicated strobe signal for
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

[Severity: Medium]
Will this explicit clearing of the DQS bit break boards that rely on the
bootloader to enable DQS?

Prior to this patch, the driver used a read-modify-write pattern that safely
preserved the bootloader's DQS configuration. Now, it explicitly clears it
when dqs is false. High-speed SPI operations (e.g., DTR) might silently fail
on boards that do not define .execute_tuning in their platform data and rely
on the bootloader state being preserved.

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
>  				       f_pdata->read_delay);

[Severity: Medium]
Since this caller hardcodes the dqs parameter to false, will this guarantee
that the bootloader's DQS configuration is always overwritten and cleared
during cqspi_configure()?

>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929063529.1235=
417-1-s-k6@ti.com?part=3D7

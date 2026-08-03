Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93A540D587
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762475; cv=none; b=MRzbC5lX5P4XuzXRmfzh99BpNAgXOkZZnp/VRFY3f/a2CD2hXsuOOilz+JMgs78aHE70r0X6S0EN3mfgj4yWo/ZpKlw+cDty8x3mnBoxzTRwxk/vfburGXAXQCVUsdW9FwrRFEuDzHfoOSkYUC6Wf35PCSXNA+I4zFr1sq9pAVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762475; c=relaxed/simple;
	bh=5/AslOUpaZqkHN28fm3bJbKWWAKfUlvCUjRsNPjP67k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pMzQ3B/hr86fLebW+JAOsk7HRn6TQ79RjdMNps/fNaK0YcxUqITs+IarrzOXUs62n7jr6qJxBi1BNuuUNgBbZnJSnWh7DA+TI7qmBefn4W3eDYVhSvrm6Vp5jPFlVIBLBZa0uhBRMvmQTXo/CJN1gWHxCKSz6D9h8uPNFcpGHIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMNoOcF6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMNoOcF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5E71F000E9;
	Mon,  3 Aug 2026 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762473;
	bh=Gvte8vKwIrbnceTLc13bu1SpUvYK6Jyw88pH+svnI6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YMNoOcF6VbKKwGMcGT3iRRlFTqRPcV0GcYQTHHwS2AdgKT444iymx6Lnb8PhrO1BM
	 BoC/a//mX4Zw19kf88ssFVzWDHPTAFjQ13kYZ80sPCR8g0G+5D06/e5mJDUS7HOcDo
	 WEdmaw+VSPw9/1IvGdqlpWL+kRbz2IcWhoLqkeqJY70ksQI0RgSUDaxz8WwkeNqgLX
	 9pk9T9rxUALiUSYfEocf662uIg2D5O9DPGY6phyW1BGs/qQDaocX7TZJmY5hDqrzCa
	 vGhydjMjx5d2xignUBT7hk+dImb7i3v50Ifn9CmqZixG7Yf5/qQqsFL3T1lGtWeAL1
	 DgTACqMD1b/uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] spi: dw: detect enhanced spi mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803124044.156998-10-changhuang.liang@starfivetech.com>
References: <20260803124044.156998-1-changhuang.liang@starfivetech.com>
 <20260803124044.156998-10-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:07:52 +0000
Message-Id: <20260803130753.3B5E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Naive register read-back probing for OCTAL mode can incorrectly de=
tect OCTAL support on QUAD-only hardware.
--

--- Patch [9]: [PATCH v2 09/11] spi: dw: detect enhanced spi mode ---
commit 55207343ce55e6e564d0b04f2044bd3036ccb30f
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: detect enhanced spi mode

This commit adds detection for enhanced SPI modes (dual, quad, octal) by
testing if the controller supports them via a register read-back. If
supported, it enables the DW_SPI_CAP_EMODE capability.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index cca8f4ba1004b..bfa017df7673f 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
[ ... ]
> @@ -1103,6 +1108,66 @@ static void dw_spi_cleanup(struct spi_device *spi)
>  	spi_set_ctldata(spi, NULL);
>  }
> =20
> +static u16 detect_enh_mode(struct dw_spi *dws)
> +{
[ ... ]
> +	/* test octal mode */
> +	tmp_val =3D DW_SPI_CTRLR0_SPI_FRF_OCT_SPI << frf_shift;
> +	dw_writel(dws, DW_SPI_CTRLR0, tmp_val);
> +	if ((tmp_val & dw_readl(dws, DW_SPI_CTRLR0)) =3D=3D tmp_val)
> +		mode |=3D SPI_TX_OCTAL | SPI_RX_OCTAL;

[Severity: High]
Could this read-back test incorrectly detect OCTAL support on hardware that
only supports up to QUAD mode?

Since DW_SPI_CTRLR0_SPI_FRF_OCT_SPI is 3, writing this to the 2-bit wide
SPI_FRF field will succeed if the hardware supports QUAD mode (value 2),
as the field is already 2 bits wide. The value will read back as 3 in the
register flip-flops even if the IP's internal state machine physically lacks
OCTAL support.

Can this falsely advertise SPI_TX_OCTAL and SPI_RX_OCTAL capabilities,
potentially leading to communication failure or hardware lockups when the
SPI flash driver attempts to use OCTAL mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803124044.1569=
98-1-changhuang.liang@starfivetech.com?part=3D9

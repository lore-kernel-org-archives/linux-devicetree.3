Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16881DB13A
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862374; cv=none; b=q/U+LayuNO8QmP/G6PQKiDcLpol+OaT4L01lQXsltcb6WMMO5mCQ4kRQ3TuXIRuFnNS0dk1I1YF/iR/mHiLtIZ61e616uhJlWPH+Eng6AlOfjoVjRyPJIRKIAfelRvpFPq0i/X3bp+OStJDfZxkk86NQ9X5xjPEMbBfZBRJClDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862374; c=relaxed/simple;
	bh=RFLKk9zSr134WyAy8OWfcZknHiYNz0f66JNJFIFY03g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c3giDHsw8C7U8eoOrkc8R2R7+XqzXYXaJdTpzIv9yAn8b2iQJ7XZaybJO7ODqh5bTv6wc6Y/f7eRsR0Eepzlii5l39eeg8/jbvEGpkMHnW8XwYmKtYFMIj2M8gxxucOyzwIIPIrFz6NFrAvmmimX78zCwVeODSw+7HOhbHxDVlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfbYRBp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfbYRBp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C861F000FF;
	Thu,  1 Oct 2026 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790862373;
	bh=jVmQKTFNt5X8G7g3ZbjaUPBs6WVr15LKI9dcd2sYaf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PfbYRBp45iyn3msmEBHu9SCbaneav8KDGUPpm9v5r1zadqbG6csUfNEZGesGtxzlM
	 uvNVtegHQ6kFWVZH02P0XQQrnf2GAQ7pvnX9sOlScIvQZ9BRxiRBzcvjrGcjOUF589
	 xE5ADzlNvCy8ADHfQQY0Fk2ERL9lFPSEELOggiNAAN3Y6mV7OAiuS4ylss3Kom+/Gz
	 G2glQLSFVwaomyU2WsK+a0hW3UGI5qrTPXmnY8xi8b3EZ4aVtJYhfrupjKb7wHsgmc
	 BckMf96ltKtpvOnL0vRbzOQXoHVskXDs7gqP0vdrRMRr4w+b+rGQj4XAl6f7Lv+pJW
	 Wn8sOt3n36ELQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] spi: ma35d1-qspi: Add GPIO chip select support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001131818.110028-4-cwweng.linux@gmail.com>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
 <20261001131818.110028-4-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:46:11 +0000
Message-Id: <20261001134613.16C861F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spi: incorrect validation of total chip selects limits GPIO expa=
nsion
--

commit bf74299215867df971e01913ae533377b76db610
Author: Chi-Wen Weng <cwweng@nuvoton.com>

    spi: ma35d1-qspi: Add GPIO chip select support
   =20
    The generic SPI controller binding allows GPIO-based chip selects, but
    the MA35D1 QSPI driver does not currently enable the SPI core's GPIO
    descriptor handling. This patch enables GPIO chip-select support and=20
    specifies that the controller provides two native chip selects.

> diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
> index 30e3239f777d6..0644bb2990b8c 100644
> --- a/drivers/spi/spi-ma35d1-qspi.c
> +++ b/drivers/spi/spi-ma35d1-qspi.c
[ ... ]
> @@ -638,18 +664,21 @@ static int nuvoton_qspi_probe(struct platform_devic=
e *pdev)
>  		goto err_assert;
>  	}
> =20
> -	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS) {
> +	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NATIVE_CS) {

[Severity: Medium]
Does this validation check incorrectly apply the native chip select limit t=
o the
total number of chip selects?

If the Devicetree specifies a num-cs greater than 2 to declare additional
GPIO-backed chip selects, it appears this check will cause nuvoton_qspi_pro=
be()
to fail unconditionally, preventing the use of the new GPIO expansion featu=
re.

>  		ret =3D dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
>  				     num_cs);
>  		goto err_assert;
>  	}
> =20
>  	ctlr->num_chipselect =3D num_cs;
> +	ctlr->max_native_cs =3D NUVOTON_QSPI_MAX_NATIVE_CS;
> +	ctlr->use_gpio_descriptors =3D true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001131818.1100=
28-1-cwweng.linux@gmail.com?part=3D3

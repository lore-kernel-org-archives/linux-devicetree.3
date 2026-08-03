Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA03A1A38
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739112; cv=none; b=U8T0EknBc/1dqLR1ClvudT0XrLLmuuTa05SRlcnjAy1tYE/7txw2XUtHoWtcWAYgAIu6S8F+uCUpnVA76RB4jUtMbSdYjf7bCG1mp3PBhG04S6+f9Efk6lJX8kjYEceyI1RDQBAC1WXjcyHqBdKSAd8OfC/j+5GJ+AfcDHPKou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739112; c=relaxed/simple;
	bh=Bwr8Bb6wNau/XkKDj0V+CJJZ5klD8pAzySfYMFfklJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ThQ0V6RV3x3VmUn/zITvHiILLOmTu98ZXZI0xb8p0Snr8r7PBdag5zKLwmuYvQ8m49ad65LiCL6rs1UOPVOmEsmlfchvYh0o3/9b9MGDGD1Qn/2dmcZ7iRh6Q6APhK2AYM9DFQFozq9QQVG0y1FhFZldF4XExXqg44wYuu7O6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBHyJJzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBHyJJzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7461F00A3A;
	Mon,  3 Aug 2026 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739111;
	bh=3aKyPxyj0s5Vy/pGgTqoqJgVTXtuAZ8P/lRTfI8wPJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eBHyJJztCdpzMbf7fhEj+2kbau9k6rpXZEiT52P8/A+FC+dXYQtVeoOkQ0o1s977O
	 fevE8abU7IYLLAuYoUDcBwkvh9ubm+oayFlMMpyBERgiX9SDq5foEtQZLJl0kNwjU8
	 A45sHKwKCLAaHJ7LZDz5LIXHhaJ8uojfSzVmaDpGFRAW2FU7G7YQtR2we11lkJcaBz
	 CRyxdR70jr+DuCwhNBJYt+d2HMDgD08RTXuP4tQ5hIG0tk415ljuRpAN2E4dQIKoD6
	 dFYAwJzXT9/JCmwyjsa1zAY+ZFVy10/foTfmu8S8zRR/NoVq7YHU8I/0PS9idGfNq6
	 9jOTasWCyP4Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] spi: ma35d1-qspi: Enable GPIO chip selects
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803062444.1649057-1-cwweng.linux@gmail.com>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803062444.1649057-1-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:38:30 +0000
Message-Id: <20260803063830.BD7461F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver improperly restricts the total number of chip selects=
 (`num_cs`) to the hardware's native maximum, causing probe to fail for val=
id device tree configurations that explicitly declare additional GPIO chip =
selects.
--

--- Patch [1]: [PATCH v2] spi: ma35d1-qspi: Enable GPIO chip selects ---
commit 9b36effcfaa138327c6207a2889e09445f4ecaba
Author: Chi-Wen Weng <cwweng@nuvoton.com>

spi: ma35d1-qspi: Enable GPIO chip selects

The generic SPI controller binding allows GPIO-based chip selects, but
the MA35D1 QSPI driver does not currently enable the SPI core's GPIO
descriptor handling. Enable GPIO chip-select support and specify that
the controller provides two native chip selects.

> diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
> index 541d5d72484cf..60e082de58f51 100644
> --- a/drivers/spi/spi-ma35d1-qspi.c
> +++ b/drivers/spi/spi-ma35d1-qspi.c

[ ... ]

> @@ -613,10 +624,13 @@ static int nuvoton_qspi_probe(struct platform_devic=
e *pdev)
>  				     num_cs);
> =20
>  	ctlr->num_chipselect =3D num_cs;
> +	ctlr->max_native_cs =3D NUVOTON_QSPI_MAX_NUM_CS;
> +	ctlr->use_gpio_descriptors =3D true;

[Severity: Medium]
Since this patch enables GPIO chip selects, shouldn't the driver allow
configurations where the total number of chip selects exceeds the native
maximum?

In nuvoton_qspi_probe() just above this diff, there is a check:

	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS)
		return dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
				     num_cs);

If a device tree explicitly defines a higher value for num-cs (for example
num-cs =3D <3>) to declare additional GPIO chip selects alongside the native
ones, this check will cause the probe to fail with -EINVAL, preventing
any devices on the bus from functioning.

>  	ctlr->max_transfer_size =3D nuvoton_qspi_max_transfer_size;
>  	ctlr->max_message_size =3D nuvoton_qspi_max_message_size;
>  	ctlr->mem_ops =3D &nuvoton_qspi_mem_ops;
>  	ctlr->mem_caps =3D &nuvoton_qspi_mem_caps;
> +	ctlr->setup =3D nuvoton_qspi_setup;
>  	ctlr->set_cs =3D nuvoton_qspi_set_cs;
>  	ctlr->transfer_one =3D nuvoton_qspi_transfer_one;
>  	ctlr->bits_per_word_mask =3D SPI_BPW_MASK(8);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803062444.1649=
057-1-cwweng.linux@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62983921F1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137818; cv=none; b=aIouq3YDB+MnodmViFv3YDh8oMJOlUmPRc5vYxPMlOL4QTv8iEhsh7ZY8OnudaDkzhkUmRryFJOGoroamGfgnUxb3/B5OZUDCyxJpaK/0VM7yu06rznNF7W9L9FBJc/wOW4dIv+Gj3DStR9KpQDbEDJziNsEQZnPefjVzxQRzwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137818; c=relaxed/simple;
	bh=sT9MmRS77VHaekO4zq2xzYlKFJEte2rmT2nq/mBW4Yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OCcWX/1/18XAO+XiGG5NKpG+ajQtUb/BIMs0H0ijbbTe+MQWF6BJi8v7ltOhXUjI/QPzp+i7XPt0i+4jEb+pUXmfGWC45CGdkcgl0XZJnEvPfRf7rsMuiFS5LW7ntCeNQc24y+aJvGjMckHCpnd+gSEe2ZhUgOi9pvSYVYzZIqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3d0yNXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3d0yNXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8971F000FF;
	Wed, 23 Sep 2026 04:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790137817;
	bh=OXoqTAeU24K7SXCuI2nrIxxqtmSfpJW+kqYenpKb+QM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3d0yNXbfWx4yDxh0lnpx8NA2VVGgH9+PTLgi2uqcZjZfHiG3liIaW9Frzk1DgkEo
	 AfoRlOSf9Ymi7ANexHZDCq3gbMhscbeDig9RCIgSS+0xE6JjRJF7acAE8uEeEQGm80
	 ve446wlsFTBpsBqMC+ITOqp45ZNutCjAp64IS9QEAJ0YnwVxgkaLQzPtlgoIh267NR
	 bPc9IY6+VpwFebFAlzzaW68hNQ37Nn1K7jVBGrBHheO3pjUUOID9bk4G+fJ4NTnv/4
	 Upl+XBQOKKPaifC62PAqJIbNJtfjLLRJXpB/L7xezOarxkDQFvsV/6JzgwNbpdbK+c
	 8KyT2YN5X1Kww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] spi: ma35d1: Add Nuvoton MA35D1 SPI controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923041926.425551-3-cwweng.linux@gmail.com>
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 04:30:16 +0000
Message-Id: <20260923043017.1D8971F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] spi: ma35d1: arbitrary num-cs limit rejects valid GPIO chip sele=
cts
- [Medium] spi: ma35d1: missing PM suspend/resume hooks breaks hardware aft=
er deep sleep
--

commit 5e29b920c6ee893a0356b0c18698305417951afd
Author: Chi-Wen Weng <cwweng@nuvoton.com>

spi: ma35d1: Add Nuvoton MA35D1 SPI controller support

This commit adds support for the SPI controller found in the Nuvoton
MA35D1 SoC, handling SPI host mode using PIO transfers and configuring
clock dividers, chip selects, and basic transfer settings.

> diff --git a/drivers/spi/spi-ma35d1.c b/drivers/spi/spi-ma35d1.c
> new file mode 100644
> index 0000000000000..14aebf5019203
> --- /dev/null
> +++ b/drivers/spi/spi-ma35d1.c

[ ... ]

> +static void nuvoton_spi_set_cs_level(struct nuvoton_spi *nspi,
> +				     unsigned int cs, bool assert)
> +{
> +	u32 mask;
> +
> +	switch (cs) {
> +	case 0:
> +		mask =3D NUVOTON_SPI_SSCTL_SS0_MASK;
> +		break;
> +	case 1:
> +		mask =3D NUVOTON_SPI_SSCTL_SS1_MASK;
> +		break;
> +	default:
> +		dev_warn(nspi->dev, "invalid chip select %u\n", cs);
> +		return;
> +	}
> +
> +	nuvoton_spi_update_ssctl_bits(nspi, mask, assert ? mask : 0);
> +}

[ ... ]

> +static int nuvoton_spi_hw_init(struct nuvoton_spi *nspi)
> +{

[ ... ]

> +	nuvoton_spi_update_bits(nspi, NUVOTON_SPI_PDMACTL_OFFSET,
> +				NUVOTON_SPI_PDMACTL_TXPDMAEN_MASK |
> +				NUVOTON_SPI_PDMACTL_RXPDMAEN_MASK, 0);
> +
> +	fifo_mask =3D NUVOTON_SPI_FIFOCTL_SLVBERX_MASK |
> +		    NUVOTON_SPI_FIFOCTL_TXUFIEN_MASK |
> +		    NUVOTON_SPI_FIFOCTL_TXUFPOL_MASK |
> +		    NUVOTON_SPI_FIFOCTL_RXOVIEN_MASK |
> +		    NUVOTON_SPI_FIFOCTL_RXTOIEN_MASK |
> +		    NUVOTON_SPI_FIFOCTL_TXTHIEN_MASK |
> +		    NUVOTON_SPI_FIFOCTL_RXTHIEN_MASK;
> +
> +	nuvoton_spi_update_bits(nspi, NUVOTON_SPI_FIFOCTL_OFFSET, fifo_mask, 0);

[Severity: Medium]
Will these critical non-transfer-specific register initializations (like=20
PDMA and FIFO control configurations) be lost if the hardware loses state
during a deep sleep?

[ ... ]

> +static void nuvoton_spi_set_cs(struct spi_device *spi, bool level)
> +{
> +	struct nuvoton_spi *nspi =3D spi_controller_get_devdata(spi->controller=
);
> +
> +	/*
> +	 * The SPI core passes the physical CS level to ->set_cs(). This
> +	 * initial driver only supports active-low native chip selects.
> +	 */
> +	nuvoton_spi_set_cs_level(nspi, spi_get_chipselect(spi, 0), !level);
> +}

[Severity: Medium]
Will this unconditionally pass the CS index to nuvoton_spi_set_cs_level()
without checking if it is a GPIO chip select?=20

The SPI core calls this function to ensure native CS lines are inactive
even when using GPIO chip selects. This could result in=20
nuvoton_spi_set_cs_level() spamming the kernel log with "invalid chip=20
select" warnings on every transfer targeting a GPIO CS with an index >=3D 2.

[ ... ]

> +static int nuvoton_spi_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D device_property_read_u32(dev, "num-cs", &num_cs);
> +	if (ret && ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret, "failed to read num-cs\n");
> +
> +	if (!num_cs || num_cs > NUVOTON_SPI_MAX_NATIVE_CS)
> +		return dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
> +				     num_cs);

[Severity: Medium]
Does this check improperly reject valid device tree configurations? A user=
=20
might legitimately specify more than two total chip selects by utilizing=20
GPIOs alongside the native ones.

[ ... ]

> +static struct platform_driver nuvoton_spi_driver =3D {
> +	.driver =3D {
> +		.name =3D "ma35d1-spi",
> +		.of_match_table =3D nuvoton_spi_of_match,
> +	},
> +	.probe =3D nuvoton_spi_probe,
> +};
> +module_platform_driver(nuvoton_spi_driver);

[Severity: Medium]
Does this platform driver lack a .pm assignment, causing it to completely=20
miss system suspend and resume events?=20

Without calling spi_controller_suspend() and spi_controller_resume(), the
SPI core might not be notified to pause its queues, which could lead to=20
hangs, timeouts, or data corruption on subsequent transfers when resuming=20
from sleep.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923041926.4255=
51-1-cwweng.linux@gmail.com?part=3D2

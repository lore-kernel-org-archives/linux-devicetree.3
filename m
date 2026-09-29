Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD537BE9F
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665035; cv=none; b=ZdEqFYxOEA/BjPZczCCnBEYsY9wxMuI1RI7uyUfyqLAkConm4MX9AQIKk6Cj6aFJhIGVg7gPRz1PqA9mOpzRbciGq+cZvqADRNP9ONiaGSnJcnjS29PQsB2HNSK1WjhGZKV8IYJvsgbc1wR9U04L70AgWvKVCq/h09DJKgjx5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665035; c=relaxed/simple;
	bh=M2kIoW/mc/0IKSYYZ4INuZXg9xrD0nhRAArNoFmqvZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ws2bhmJHWQIw7Hd4qf7pzoAMH0jgRwflwoiWsVMDbda+uO9s1kajTzCflbaW4i0OQeau5r2Lh0gQHgT+kfGAJcq5lhvPzB6rO03HHX4ifEoGbPmOejuLL/xMflBzRepDxhu1JpE/0a0N5jTvcYjg8LX/7rM/SVDVHmwM5THh/4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuolU055; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuolU055"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD921F000FF;
	Tue, 29 Sep 2026 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790665033;
	bh=/lVpvniJe7NojLZgdBmj0xmW5ROBZMw2cRnw1QM04j0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PuolU05584gwGfN/cCzA8QsGiag6qPhvHkK3iAQOm865INSfOXxMuQlpSrM6IoONn
	 ZSNVA1gp3zrOAb1LQtGYmtwyCbeqqltbhX/mvOEzJ6wy9K3DVr2GduDPvsJ4LeENSd
	 +dJaKsO6QXZ7TW5n6DtLz6+ZW5VcjUEblvqy4Ln7v7gHUzLnplrLzXwwvoOUdomuQS
	 SH2pCc4R3xhKrqjZMWQoohw87jA62gTH73Yad+WDnHWPkQ+ypA9Nu5PA4rBYoOJe4j
	 37VY47bOGECKUmlL6Cs0qVkMMnLHVRKCYysqQqqG27He0hqqcX7AkM9sL6czBo7C90
	 eRmloeVKyx7Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/19] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929063529.1235417-9-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
 <20260929063529.1235417-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:57:12 +0000
Message-Id: <20260929065713.4AD921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] spi: cadence-quadspi: infinite loop in cqspi_find_rx_high_sdr() on=
 underflow
- [Medium] spi: cadence-quadspi: masking of -ENOMEM in PHY tuning loops
--

commit 62a3174b365e4277190116eb19dbdefea81fa88c
Author: Santhosh Kumar K <s-k6@ti.com>
spi: cadence-quadspi: add PHY tuning support

This commit adds PHY tuning support for the Cadence QSPI controller. It
introduces a calibration sequence that reads a known data pattern to determ=
ine
optimal RX and TX delays for DDR and SDR protocols. The tuning ensures
reliable high-speed operation by selecting the midpoint of the passing timi=
ng
window.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 046fa5d69b0f7..e21164419b00f 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1559,10 +1718,1572 @@ static bool cqspi_supports_mem_op(struct spi_me=
m *mem,
[ ... ]
> +static int cqspi_phy_check_pattern(struct cqspi_flash_pdata *f_pdata,
> +				   struct spi_mem *mem)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +	struct spi_mem_op op;
> +	u8 *read_data;
> +	int ret;
> +
> +	read_data =3D kmalloc_array(ARRAY_SIZE(phy_tuning_pattern),
> +				  sizeof(phy_tuning_pattern[0]), GFP_KERNEL);
> +	if (!read_data)
> +		return -ENOMEM;
[ ... ]
> +static int cqspi_find_rx_low_ddr(struct cqspi_flash_pdata *f_pdata,
> +				 struct spi_mem *mem, struct cqspi_phy_setting *phy)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	do {
> +		phy->rx =3D CQSPI_PHY_RX_LOW_SEARCH_START;
> +		do {
> +			ret =3D cqspi_phy_apply_setting(f_pdata, phy);
> +			if (!ret) {
> +				ret =3D cqspi_phy_check_pattern(f_pdata, mem);
> +				if (!ret)
> +					return 0;
> +			}
> +
> +			phy->rx +=3D CQSPI_PHY_DDR_SEARCH_STEP;
> +		} while (phy->rx <=3D CQSPI_PHY_RX_LOW_SEARCH_END);

[Severity: Medium]
Will this correctly handle and propagate memory allocation failures?

The function cqspi_phy_check_pattern() returns -ENOMEM if kmalloc_array()
fails. However, this tuning loop (along with the other tuning loops) only
evaluates if (!ret).=20

If an -ENOMEM error is returned, the loop advances to the next delay tap and
pointlessly retries the allocation instead of aborting. Can we differentiate
between a pattern mismatch (-EAGAIN) and a fatal allocation failure (-ENOME=
M)
so the controller avoids looping over the entire tuning grid under memory
pressure?

[ ... ]
> +static int cqspi_find_rx_high_sdr(struct cqspi_flash_pdata *f_pdata,
> +				  struct spi_mem *mem, struct cqspi_phy_setting *phy,
> +				  u8 lowerbound)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	phy->rx =3D CQSPI_PHY_MAX_DELAY;
> +	do {
> +		ret =3D cqspi_phy_apply_setting(f_pdata, phy);
> +		if (!ret) {
> +			ret =3D cqspi_phy_check_pattern(f_pdata, mem);
> +			if (!ret)
> +				return 0;
> +		}
> +		phy->rx--;
> +	} while (phy->rx >=3D lowerbound);

[Severity: High]
Does this loop terminate if lowerbound is 0 and the pattern is never found?

Since phy->rx is an unsigned 8-bit integer, if it reaches 0 and the pattern
check fails, the phy->rx-- decrement will underflow to 255. Because 255 >=
=3D 0
is always true, won't this result in an infinite loop?=20

This sequence seems reachable during hardware probe from cqspi_phy_tuning_s=
dr()
where cqspi_find_rx_high_sdr() is called with rxlow.rx as the lowerbound,
which can be 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929063529.1235=
417-1-s-k6@ti.com?part=3D8

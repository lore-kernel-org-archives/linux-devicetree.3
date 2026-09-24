Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8769253B58
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219990; cv=none; b=SqtqQac5k0X619fI+s/CTSj0R+YKYC2ZJDpF+bCe3//etXaKH+RFq3MeVEvB/vyI9/BqHYdPwLJJDWzc02vxflNDywHy/bmLRZ4HBMWmECpc4AIS4NUc4FaJ8oXn6VzQQbcY7gC5eiB7UA/iZYxGWX5/DUPfcY3+1l3LBcp+kA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219990; c=relaxed/simple;
	bh=tznxuAcE6sEpr1h1c+Oj3BviXisc94VAs+aCY/0mNRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PrtWo/9/h7z/icLlGd6L+/aoBbISLP46eKjwiYd/FLgHs2pb4F/X9SdWI3KnbD7dGwz7sRYWf/QDAxyqwIFAYZ+IjN7QtCU+Ddkl9c7x2ZjgNpWnRnlNidfDF3TV/jJNsHpq5yKFFOWaox1GBKSxAg1gEogmtr2nYhcfc5KoeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QenvFsuO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QenvFsuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9A21F000FF;
	Thu, 24 Sep 2026 03:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790219989;
	bh=m8C/vkXmUo+Yz/lRsnkusPMHJzqaDcL6EDbISsiNR0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QenvFsuOTIyoaYXlePsUi6hm2FsScRhAR5Ka8a+8IR7j799vK4Fob3XAsvEcskNwq
	 KWmZ5fBx1mrdpeQKjFgCDoOvZmvrq1fAsOG1cGe+1VO8wVrcZ7IrVf5ybFjuSOUAsT
	 yJ9RwU0TWaRGRi7ed22CyqCwFRgbT9jfMq+eqQpo1JFbpQnpRaNmKCjKHsqpyxD3e6
	 sAF+MItU6GkadaK00CgdrBX35Gd+jv+6SreAGlNvETtvdIxbyLTwpgKiA9w90fBIEe
	 Z0ho+JEOwjBAq86eLJ6ggs8p03fYW9uUiOP0Vw16ofi9secq9fsGlzbbotW2Q8u24E
	 5/aTLMVoKn9RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] spi: mt65xx: support wider tick delay field on IPM
 v59
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tim Kuo" <Tim.Kuo@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924031211.2199921-2-Tim.Kuo@mediatek.com>
References: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
 <20260924031211.2199921-2-Tim.Kuo@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 03:19:49 +0000
Message-Id: <20260924031949.8F9A21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] spi: mt65xx: unused macro SPI_CMD_IPM_GET_TICKDLY_OFFSET
--

commit 7585a8851ec5ccd32f23459c09b756cd0dc48ccd
Author: Tim Kuo <Tim.Kuo@mediatek.com>
spi: mt65xx: support wider tick delay field on IPM v59

This commit adds support for the wider 7-bit tick delay field in IPM v59 by
introducing a per-SoC mask. It updates the driver to use field_prep()
instead of hardcoded shifts and masks.

> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index b845a599f7c6c..27ed9be1b1213 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c

[ ... ]

> @@ -81,6 +82,7 @@
>  #define SPI_CMD_IPM_GET_TICKDLY_OFFSET	22

[Severity: Low]
Should SPI_CMD_IPM_GET_TICKDLY_OFFSET be removed here? Since this patch
migrates the tick delay handling to field_prep() below, this macro appears
to be left as unused dead code.

>  #define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
> +#define SPI_CMD_IPM_V59_GET_TICKDLY_MASK	GENMASK(28, 22)
> =20
>  #define PIN_MODE_CFG(x)	((x) / 2)

[ ... ]

> @@ -443,10 +460,10 @@ static int mtk_spi_hw_init(struct spi_controller *h=
ost,
>  	/* tick delay */
>  	if (mdata->dev_comp->enhance_timing) {
>  		if (mdata->dev_comp->ipm_design) {
> +			mask =3D mdata->dev_comp->tick_dly_mask;
>  			reg_val =3D readl(mdata->base + SPI_CMD_REG);
> -			reg_val &=3D ~SPI_CMD_IPM_GET_TICKDLY_MASK;
> -			reg_val |=3D ((chip_config->tick_delay & 0x7)
> -				    << SPI_CMD_IPM_GET_TICKDLY_OFFSET);
> +			reg_val &=3D ~mask;
> +			reg_val |=3D field_prep(mask, chip_config->tick_delay);
>  			writel(reg_val, mdata->base + SPI_CMD_REG);
>  		} else {
>  			reg_val =3D readl(mdata->base + SPI_CFG1_REG);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924031211.2199=
921-1-Tim.Kuo@mediatek.com?part=3D2

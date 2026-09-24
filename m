Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F921476045
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252395; cv=none; b=O2GdpjaJ3QQj3hTOTfg9M41rqMovJ76TzqwOHDiDrR6keyPJnxMGDEU1/pXe8D0bQEiCdy8hjMFYSEXPFA+F92h8NvCxl43sne7ufUnv/vQo9PnvqqwREhXJnIAgEnEahCoum/1BOUvYsfspSGfwFRlc9tlMFT1QghOqB193LB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252395; c=relaxed/simple;
	bh=yL9zi1CMUHFMeWrA73JCN/N0J16NT3jeJ5gVzVOMynY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d0TWxbb2C3JcNGtfED7zeOwFIUozCVJuRLuKv16dFML4I5EIYtT4mgn+Z2BIyGslIjpnA789fKkos7Uv1ExIj6/LcD81SrjAAu/4LAdeviNFqjhE/yRlRMyLJAj0OaHpkzo2VZZXX+OGZXJON3+Kg4xyMyqFAus9VZts/fjp/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhHa+wu/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhHa+wu/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69751F000FF;
	Thu, 24 Sep 2026 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252393;
	bh=AyobcjnjZiAZKzLaxouC2NAHedB22MWu3bRpgoPny+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZhHa+wu/jOCFZhSm6hSPb9LVuc7r8g1aQd89f2tw1CkRzeiVsJLoYqZUZEx+0i5bm
	 j4729NPGfLXJHgZd/+VmLCbE4Lv7Tvz3TFsTureNOsq3dvRjBqzA7aydUC2JF6e9xx
	 0k+LGTt6AvQO/165cV7BCbWaCAyGAB2g8eOjigsHMmskBJ7D+KH3zB83qFA3iIH7/z
	 6yYKo5OONWFku9a5u3MVieS5orYdds9VwcuGpoSdPxFpGGax869lBCP4d8S93uyG+F
	 yAuKZNnzms6FI7Y4NN2PIv1GAZVsP768bZRNmTjaGSruyLzptoquCxbKkkOlJQ11AT
	 EvI9n2KD/4c9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:19:53 +0000
Message-Id: <20260924121953.A69751F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: incorrect SPI DMA properties assigned to UART nodes
--

commit a079d3bb22e267f160ba116fb91e4d6d5467e84e
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

This commit adds DMA phandles to I2C and SPI QUPv3 serial engine nodes in
the nord device tree.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index bc48238050ecc..0ce5db7479199 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> @@ -1182,6 +1218,10 @@ uart0: serial@980000 {
>  				reg =3D <0x0 0x00980000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma0 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;

[Severity: Medium]
Is this SPI DMA configuration mistakenly applied to the UART node instead
of spi0?

The intended SPI node appears to be left without DMA support, which could
cause it to fall back to PIO mode or fail to initialize if DMA is strictly
required by a driver. Additionally, giving the UART node a DMA configuration
using the SPI protocol identifier (QCOM_GPI_SPI) might cause initialization
to fail or malfunction if a board enables uart0 and attempts to request the=
se
DMA channels.

This same pattern appears to occur in the DMA additions for uart1, uart2,
uart3, uart7, uart8, uart11, and uart12 later in this file.

> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-nord-gpi-d=
ts-v3-0-74a85134699f@oss.qualcomm.com?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001409;
	b=45I0zNsU5m7XgGp1MRZN5O+6760Z4kn0BhbTr0jq97MZ4sIY1x1bXb3jyQ3fFvw9On4x
	 kllIU1rbLM49s/ObszIG9pkDVeYuNxZ5ceOY3avq+tqwiSomdOaPIyVv8vCVnbAQMUiVD
	 EPvPjQfUvhBs33fdQCMFOk5PF4V7gSwBVwdGaiSb+bkI1jAZU0SjT8iFLAr2yO8+A/Yaj
	 eLNskEs2ycIszrX9g/zLwL/Msp4oCRxwsDn1d3C2B+KBi3gfp4Ym+LgZpBK0EjoeOD9DF
	 pN9ErVzW/ub4y+RGZ2iwKW/sg/A4EvUTBZcaXyfdsrhJkPPir0g37z6zwul+7gblAvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001409;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hSHMi8IWLcoWys14dxkbstyAtmu7x7fJmiMvkEGLhHI=;
	b=zpVYIwFxsLyjt2q60jeQY57HCzibjo7qAlFoZ9cryM/T0t9+odqe3u/D/6uQuS2Ygr58
	 pGr+5Ab8FClEwXek2YexODer+3CCmR1WRTzeNghTLd61YBdB4OkAcy3WDHjDu32oSb2NI
	 dbnevfBtpFWSEanSMIm4jFBDkq8F3oxZHndXI5MX7k2otamwgT3sM/jVeE0WNwn5Ya09R
	 8KXBT3GVAi4TetM5FZ4c4FN+5Mbxt4hmaz4az5FRLnt7pq5uZPRp0jZV1TXU/TCx6hrCF
	 Pxwi8W3zYSKOkvDCOSBcn7UA55gw+dowBk3PSjP0AjXlNAcE7Fu+OksO3hXtIHT89EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKVZnbmd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB1606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKVZnbmd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9388F1F000C4;
	Wed, 18 Nov 2026 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795001408;
	bh=hSHMi8IWLcoWys14dxkbstyAtmu7x7fJmiMvkEGLhHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GKVZnbmdo1A9gsEJnKe8sBA30zOG/RKUxdf0/ozmYYhQc6m0CCihsv/hzuMsqYpwR
	 Oasr1vs71vADjr72yxis1m47KQ7oMKDTr+v670ovt8xUsXPNwU9z0+o6NWoA01jRcy
	 REJtvh5IIhdWj8b9LrNl+ib2S08ZUvAFFWKiIaYhmAgplWvimpg5cunJp+NqBOmwvX
	 3Br0vH/PODm0sOXYtr7eMlipPxOSQKuzMgzABS/osb+nRX9DQZuepB2dqvzIHTtLuQ
	 HlmQkliVQxLBWbJHqib14UMNmJvcBWRMuC56Tf4fY91TOrBmRkobDBuH5zT8VuTqLl
	 Yuo753ODKWsWg==
Message-ID: <sashiko-outbox-220825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI
 engines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
References: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 11:30:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: nord: QCOM_GPI_SPI dmas added to uart nodes
  instead of spi
--

commit ec82fd4963709d74e7ab22bb82bb9af984ad44a7
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI engines

This commit moves QCOM_GPI_SPI DMA channels from UART nodes to their SPI
sibling nodes for SE 0-3, 7, 8, 11, and 12, and adds QCOM_GPI_SPI DMA
channels for SE 4 and SE 14-19.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index 56778dd444e4e..a9534cba07550 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1094,6 +1094,10 @@ uart14: serial@880000 {
>  				reg =3D <0x0 0x00880000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma2 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};
> =20
> @@ -1125,6 +1129,10 @@ uart15: serial@884000 {
>  				reg =3D <0x0 0x00884000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma2 0 1 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};
> =20
> @@ -1156,6 +1164,10 @@ uart16: serial@888000 {
>  				reg =3D <0x0 0x00888000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma2 0 2 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};
> =20
> @@ -1187,6 +1199,10 @@ uart17: serial@88c000 {
>  				reg =3D <0x0 0x0088c000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma2 0 3 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};
> =20
> @@ -1218,6 +1234,10 @@ uart18: serial@890000 {
>  				reg =3D <0x0 0x00890000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma2 0 4 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};
> =20
> @@ -1249,6 +1269,10 @@ uart19: serial@894000 {
>  				reg =3D <0x0 0x00894000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma2 0 5 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};

[ ... ]

> @@ -1485,6 +1509,10 @@ uart4: serial@990000 {
>  				reg =3D <0x0 0x00990000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma0 0 4 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};

[Severity: High]
Are these QCOM_GPI_SPI channels added to uart4 and uart14..uart19 instead
of spi4 and spi14..spi19?  This leaves those seven SPI nodes unable to use
GPI DMA and adds disallowed dmas properties to the corresponding GENI UART
nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118112407.1034=
12-1-shengchao.guo@oss.qualcomm.com?part=3D1

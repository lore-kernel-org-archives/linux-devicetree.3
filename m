Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902747DFAF
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252546; cv=none; b=XbYqNm8UvjiCCeW1+4NfBNOzDjnKwpLlDMJpcZjOkGhdoq78/Ui5T4omFxW+5TMQeUEIYVewo3ea5+/f10t4g+EalMs17gglA5prHBwQZBssCvodaaLUOWCPVuvP5peDnDammO0TTp3mYHQMRNXqfvBoOHFmTRYKxXkZ5eiTw0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252546; c=relaxed/simple;
	bh=2oya4kkFtvRgBI4g51h2yYLtnzr59NdgPsLcPKjrSeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z2kZwRCLFm2oQhIZ9EwxV16jHObpBcMoPpYS04Mvf3NF2c8cfnQ7o9clo5SrTilL3/YttDK1OZ3LD2Wz46KT4Eo7U4nE8gIuSErp0xRaldRCIysR9kxWoO1gBfbXqAIDcBEYM9AS86TX1GHEAyJP4bdkJNd3DaK5g8zW0Egm++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTOAtyer; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTOAtyer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AC31F000FF;
	Thu, 24 Sep 2026 12:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252545;
	bh=LP4FgYrrO7UwL6yrMimuOjZCzE0/1mdQNANGaGAlVuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JTOAtyerKb8wLvIe70qSr2kGfd56Morf3C6lnojjAW1zRuS2Krn9Dom2R7tkDZc/E
	 OsDXfLCMSBubCoGMF68SC2IzHjtlNfPJR5q5fOZq0bmc5VR2ZCW3UC/9LfDOXM59pj
	 RBA7A42DiGK2SlaO7RAL1uPTrZDqDcq1SZ3Og+wxsgzNKxQ9pm1wDuYlytcqJPMeX/
	 o5sb9i3ezPb/FhE5hjBESgMKtB4O77hcNwSTvaqPSJL4sJ/09v0+JrO4PayTaFPzC+
	 QS5mXQgJnn8HWE3k4Bp6G+XUw8SD89thP+vEegfZDHcjQWBGtTDiuU2TpdbyQu3pqs
	 71G1Mi1W7ifng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:22:24 +0000
Message-Id: <20260924122224.C9AC31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dma: qcom: gpi: Scrambled interrupts array in gpi_dma0 causes IRQ =
mismatches
- [Low] dt-bindings: dma: qcom: gpi: Undocumented compatible string qcom,no=
rd-gpi-dma
--

commit 5ff2ae7892f38ac7390ba140de7687b5b2755c79
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

arm64: dts: qcom: nord: add GPI DMA controller nodes

This commit adds GPI DMA controller nodes for all three QUPv3 engines in the
Qualcomm nord device tree.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index e0496fd40c308..bc48238050ecc 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> @@ -909,6 +910,27 @@ soc: soc@0 {
>  		dma-ranges =3D <0 0 0 0 0x10 0>;
>  		ranges =3D <0 0 0 0 0x10 0>;
> =20
> +		gpi_dma2: dma-controller@800000 {
> +			compatible =3D "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";

[Severity: Low]
Are there plans to add this compatible string to the device tree bindings
schema?

The string "qcom,nord-gpi-dma" is missing from the bindings documentation
(Documentation/devicetree/bindings/dma/qcom,gpi.yaml). Device tree rules
mandate that all specific compatible strings must be formally documented,
otherwise running dtbs_check will result in schema validation failures.
This applies to all three new nodes introduced in this patch.

[ ... ]
> @@ -1107,6 +1129,27 @@ uart20: serial@898000 {
>  			};
>  		};
> =20
> +		gpi_dma0: dma-controller@900000 {
> +			compatible =3D "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg =3D <0x0 0x00900000 0x0 0x60000>;
> +			#dma-cells =3D <3>;
> +			interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Is the out-of-order sequence of interrupts intentional here?

The qcom-gpi-dma driver (drivers/dma/qcom/gpi.c) maps Execution Environments
to physical IRQs by array index using platform_get_irq(pdev, i). In gpi_dma=
0,
the interrupts array interleaves two distinct numerical groups (116-121 and
205-223) instead of listing them sequentially.

Since the IRQs are mapped by array index, this sequence assigns incorrect
physical interrupts to the corresponding EEs (for example, EE 1 gets 205
instead of 117). This will break IRQ routing and can lead to DMA channel
interrupt mismatches and failures in peripheral operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-nord-gpi-d=
ts-v3-0-74a85134699f@oss.qualcomm.com?part=3D1

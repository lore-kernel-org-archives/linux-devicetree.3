Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814647B408
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002723; cv=none; b=inyll2m7ZNrJqAXycL8OmXDOWHu7Vf56EA0iHVnV7lHwB0VKC492lQKeFBBjoYOvqiqsFi6/BI+yoSsoBCWnzaWdMthGcyiDFT1eWtnDM09cN16D8NzU8o15h312ZnOG43pg+0N6eAa2fIg20wBfWcuIj7t0rCEMx1WN547ZvNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002723; c=relaxed/simple;
	bh=TwTY2HXRHlduyj2VuUzpc5bjBityNs1tr6mUhv58l4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cJBi23JMEAy0733FB2+8UZC74Yr/1g2puS20wbqxJrOOMQgrykpb74o3rKx6IZIkblvFLBDUm0WzTlEe82R7ZAcf80gdpwzZM8SPYPw1q5Tdop7LiHiKW86VmUzpectI0ZOWMf7g+C8uKUx1hEX15rAVFpQwIZT7SK1NmmEypQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/VGkLqr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/VGkLqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E521F00898;
	Mon, 21 Sep 2026 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002722;
	bh=X2Bv6h+iMqwPSNuA1shIclOCRpL8fVEIjWAhdtI7ujM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j/VGkLqrAsrdayG0DTtsRVg7HOXdKVgUOEfByqH4UkVcQ7ZbiKKOq1oCpOvMkhzkk
	 YeUe5k8Zw63i19ROjvX32A0FbGLjEGUm1/x+PbOotdW65zVRITl+0urkvb7/TYWUz7
	 l3z7wlwaEe9QjgRFfve3EjoYUjDDpImG28pAZ8Ht5wgSY1nUTFj3r5PZRZ5eKhtlVq
	 q/Ch2RFtSbdicanTfNMlUVMLE5Upez/+b8XkJDFLYF2S56I475iOLchSuXynxAtp6n
	 WUz0rKW4C+kknfWMGi0Psa40aytwhAjCc+5ExnEX3d2mitvJFh4tOLQvqpQdGmZgiT
	 fzLzE3V5lTNxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 14:58:41 +0000
Message-Id: <20260921145841.F1E521F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: scrambled interrupts array in gpi_dma0 causes DMA timeouts
- [Low] dts: undocumented compatible string 'qcom,nord-gpi-dma'
--

commit 707c09883742930c1c91a2275e454e20b950b1e1
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

    arm64: dts: qcom: nord: add GPI DMA controller nodes

This commit adds GPI DMA controller nodes for all three QUPv3 engines in the
qcom nord device tree.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index e0496fd40c308..9f4e0e1498c32 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> @@ -909,6 +910,28 @@ soc: soc@0 {
>  		dma-ranges =3D <0 0 0 0 0x10 0>;
>  		ranges =3D <0 0 0 0 0x10 0>;
> =20
> +		gpi_dma2: dma-controller@800000 {
> +			compatible =3D "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";

[Severity: Low]
Does this new compatible string lack documentation in the dt-bindings?

Running dtbs_check validation will fail because the compatible string
"qcom,nord-gpi-dma" is not defined in
Documentation/devicetree/bindings/dma/qcom,gpi.yaml.

This only affects build/validation tooling, not runtime behavior, as the
kernel will successfully match on the fallback string "qcom,sm6350-gpi-dma".

> +			reg =3D <0x0 0x00800000 0x0 0x60000>;
> +			#dma-cells =3D <3>;
[ ... ]
> @@ -1107,6 +1130,28 @@ uart20: serial@898000 {
>  			};
>  		};
> =20
> +		gpi_dma0: dma-controller@900000 {
> +			compatible =3D "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";

[Severity: Low]
Is "qcom,nord-gpi-dma" documented in the dt-bindings?

Like the gpi_dma2 node above, dtbs_check validation will fail because this
new compatible string is not defined in
Documentation/devicetree/bindings/dma/qcom,gpi.yaml.

> +			reg =3D <0x0 0x00900000 0x0 0x60000>;
> +			#dma-cells =3D <3>;
> +			interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,

[Severity: High]
Does this unordered list of interrupts break the IRQ-to-GPII instance mappi=
ng
in the driver?

The interrupts array for gpi_dma0 interleaves IRQs from distinct blocks
(116-121 and 205-223). The GPI DMA driver in drivers/dma/qcom/gpi.c maps
each hardware GPII instance to the corresponding interrupt in the DT array
using platform_get_irq().

Because of the scrambling, the driver will request the wrong IRQ lines for
its active GPII instances (e.g., requesting IRQ 205 instead of 117 for
instance 1). This is a static hardware configuration error that
unconditionally breaks DMA functionality for this block on boot, as
transfers on QUPv3_0 peripherals will time out because completion interrupts
are routed to the wrong handlers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-nord-gpi-d=
ts-v2-0-4f297c983b94@oss.qualcomm.com?part=3D1

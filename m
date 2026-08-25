Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E76481FD7
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667312; cv=none; b=CFEqD5ASIaEOWfQRO+4hAjRT23kery76NX2ipKitARgGf0dJ4mOwAnNcCBcFPf2aTHDkhZKGIFpNyhJ2m7DOyWe3Z3/ptHgKfDEr0d+DRbo1YDsmpOL+c5vIQdXkmRvf20VISYrK4uvDFxKQ/Iah5IC19oFTY+m7pSr1lTWE48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667312; c=relaxed/simple;
	bh=bGvnsODOhssnDLgeTzljLvCtGIozsZSV1dTUgiHF+b8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SbPIKoFvD/K7sikMwGaJ6uSLl5krdghmdJCHcrnxONw4EFQ4GhhGU3oMq3v5Sn6iH1Zd0IHf4HrNUMCtvnUiXQNF5qgx169Y4erP3u93ZWsnhF3uREtlyEwrQDRp1wX8RIt1q8a3pWgbrxJ5wXKRxE353651NjbrD3HlbAyGhTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jlgt//wi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jlgt//wi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3941F000E9;
	Tue, 25 Aug 2026 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667310;
	bh=2Yiy6YWc5JkA3Q1c1YZIjJ7R2vhURYMTi/oAeFUxMog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jlgt//wiHf3uhs6Ls09L6Y02+rJ0/GBXdbctZoiaVMlAQiQnRn2xlhP7ZPtbgZR5e
	 MupLmYOQiYXJzZpT2oVy96JMDGwbx80+b9BIXYeFt/bC4pfgzFGnJw4kGwbBMlFSiS
	 NxWBucRqui2I8oA+zUwM7hQTwbcU1T2ojuXBeYjXgpmXC9s4PRVBJxLaW3Aci8v/N0
	 oc4rlp2Yyk3v2iO7G1n+qVuHCKFJ/mfJfy1FmApF204e+YwdLWf+lYoTfnwWSjLMsN
	 Vhegf8VJFhGH2ESmHcToaBj+Cd0kBXjmawsKIu0GJepu7CRkSRRgImFt468vNzVlDv
	 9PzA9pWQv8Gxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M48
 on NXP i.MX6(Q)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825140225.3968019-3-petko.manolov@konsulko.com>
References: <20260825140225.3968019-1-petko.manolov@konsulko.com>
 <20260825140225.3968019-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 14:15:09 +0000
Message-Id: <20260825141510.3D3941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Masquerading IOMUXC group control registers as pinctrl pads ca=
uses a kernel heap buffer overflow during device tree parsing.
- [High] Alignment Fault (Data Abort) triggered by an unaligned device memo=
ry read if pin configurations are read via debugfs.
- [High] The `usdhc3` node in `imx6qp-draeger-m48.dts` overrides the `compa=
tible` property with an unrecognized string, breaking SD/eMMC support.
- [Medium] Malformed `#ifdef` block containing duplicate `bootcmd` properti=
es.
- [Medium] The newly added device tree file `imx6qp-draeger-m48.dts` is not=
 integrated into the build system.
- [Medium] `imx6qp-draeger-m48.dts` includes a non-existent file, causing i=
mmediate compilation failure.
--

--- Patch [1]: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M=
48 on NXP i.MX6(Q) ---
commit 23a07509f15a20dcb81e207c5e98da8aa14ffeb4
Author: Petko Manolov <petko.manolov@konsulko.com>

ARM: dts: draeger: Add devicetree files for M48 on NXP i.MX6(Q)

This commit adds device tree definitions for the Draeger M48 board,
supporting i.MX6 DualLite, Quad, and Quad Plus variants. It introduces
the base DTSI file along with specific DTS files for each variant.

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index 1a2539fa19b44..44b3932562358 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -220,6 +220,8 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>  	imx6q-dmo-edmqmx6.dtb \
>  	imx6q-dms-ba16.dtb \
>  	imx6q-ds.dtb \
> +	imx6q-draeger-m48.dtb \
> +	imx6dl-draeger-m48.dtb \

[Severity: Medium]
Will this skip building the new imx6qp-draeger-m48.dts file?

It appears imx6qp-draeger-m48.dtb was omitted from the
dtb-$(CONFIG_SOC_IMX6Q) build list.

>  	imx6q-emcon-avari.dtb \

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> new file mode 100644
> index 0000000000000..45809770d16f3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts

[ ... ]

> +#include "imx6dl.dtsi"
> +/* PAD config disabled in imx6qdl-draeger-m48.dtsi by setting value to 0=
x80000000
> + * PAD configuration register must not be 0, so it is set to 0xfff
> + */
> +#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x768 0xfff 0x000 0x000=
C0000 0x0
> +#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x788 0xfff 0x000 0x000=
00200 0x0

[Severity: High]
Will the unaligned conf_reg offset (0xfff) cause an Alignment Fault?

If the pinctrl state is later dumped via debugfs, imx_pinconf_get_mmio()=20
executes readl(ipctl->base + 0xfff). On ARMv7, non-4-byte-aligned accesses
to strongly-ordered IOMEM regions strictly trigger an Alignment Fault=20
hardware exception, which can crash the kernel.

> +#include "imx6qdl-draeger-m48.dtsi"

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
> new file mode 100644
> index 0000000000000..bcfe7b2556cbd
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

[ ... ]

> +		pinctrl_m48_enet: enetgrp {
> +			fsl,pins =3D <
> +				MX6QDL_PAD_KEY_COL1__ENET_MDIO 0x1b0b0

[ ... ]

> +				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL 0x13030
> +				MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII 0x80000000
> +				MX6QDL_PAD_CTL_GRP_RGMII_TERM 0x80000000
> +			>;
> +		};

[Severity: Critical]
Does masquerading these IOMUXC group control registers as pinctrl pads cause
a kernel heap buffer overflow during device tree parsing?

The imx_pinctrl_parse_pin_mmio() driver derives an array index by dividing
the offset by 4. Since the driver allocates ipctl->pin_regs with 216
elements for i.MX6Q, injecting these large offsets (like 0x768 and 0x790)
results in array indices well past the 216-element heap allocation, leading
to an out-of-bounds write.

[ ... ]

> +	config {
> +		#ifdef LEGACY_BOOT
> +		bootcmd =3D "startM48;errorMsg";
> +			bootcmd =3D "startKernel;errorMsg";
> +		#endif
> +
> +	};
> +};

[Severity: Medium]
Is this #ifdef block missing an #else directive?

Since both bootcmd properties are inside the same branch, this will either
omit the intended default bootcmd entirely in a standard kernel build, or
fail to compile with a duplicate property error if LEGACY_BOOT is ever
defined.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6qp-draeger-m48.dts
> new file mode 100644
> index 0000000000000..ab331596abd98
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

[ ... ]

> +#include "imx6qdl-draeger-m48.dtsi"
> +#include "imx6qdl-draeger-m48-u-boot.dtsi"

[Severity: Medium]
Will this #include cause a compilation failure?

The file imx6qdl-draeger-m48-u-boot.dtsi does not appear to exist in the
Linux source tree.

[ ... ]

> +&usdhc3 {
> +	compatible =3D "fsl,imx6qp-usdhc";

[Severity: High]
Does this unrecognized compatible string prevent the SD/eMMC driver from
binding?

The sdhci-esdhc-imx driver expects fsl,imx6q-usdhc, so using
fsl,imx6qp-usdhc will break storage on the Quad Plus variant.

> +	vqmmc-supply =3D <&vccq_sdhc3>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825140225.3968=
019-3-petko.manolov@konsulko.com?part=3D1

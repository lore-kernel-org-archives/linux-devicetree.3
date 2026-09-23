Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E853AEB37
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175888; cv=none; b=h1Y3NpsV3456M/HerC9vyFyb7mBPdFqWCgprnrrLDuDKht8GfRDiWIsTx2fOKKoJr4zJpihEZ+niKApGV70jpYMYILfByDNIuNB0zOEtLteEHmSUAHhST9DsAop0MZRP8akRl5Bv8qrQorFLRNJtBZwjwhSTH+LYzgow9+w4crE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175888; c=relaxed/simple;
	bh=lZXV/H4nXZyv6JcT9/MzIxxUpHVh4OZbab9HF4HEKOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IkpxV8LF0mUosjYHMm42JWxGAECwsu9/5uRsDfoCxJoCDRYeGgnunHTyfm3o+KTV41UosGV9sC4gk2LDb+haJMjzzyaIZY2P31A9KCF7j8t8fr3QLNbTfaagHBPjH56NjOalKJ1Hv5gZm9QIxYgTcgXEZehBXeWIFLUPku3+Buk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQJIohyJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQJIohyJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051171F000FF;
	Wed, 23 Sep 2026 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790175886;
	bh=G81+bG01BaptnrXIGPktl9K2+i7NxNNWfE7ZSMIuGRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQJIohyJoTNpQR0QBj6QFQndIik140vrSL6oOzu0BwQcrQQbdwaE+RVvcpkm0l2EL
	 KSpkV4kgoF8X0AdEGwOwZE+iDgzM1SRa3oGwe2GnPf7WCeHe4Z2Am7yLbuQIgrkIju
	 B3fhgFnnMVj2TE2D8thc3k9HAHnWRMaDitF5cHyXNODuzV7F8u+wWqNuJUOOGMD56Q
	 bTukRdl8rodb+FDhHzxbBolUJSX6J2muQ5JeTNAcektrRKSIiLV5QOCf+hcikmDIhJ
	 +0LVsU1k+wfPh4O/feYusUu2v8B2KIMWS/fPw+BmVDhjG/KmSARnSg4Tzq8zzSFuOT
	 37y8nH56OEwWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923144905.3365851-3-petko.manolov@konsulko.com>
References: <20260923144905.3365851-1-petko.manolov@konsulko.com>
 <20260923144905.3365851-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 15:04:45 +0000
Message-Id: <20260923150446.051171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] pinctrl: imx: heap buffer overflow during probe due to invalid GPR=
 pad config
- [High] drm/imx: LDB probe failure due to unsupported and missing device t=
ree properties
- [Medium] dts: imx6qp-draeger-m48: missing Quad Plus hardware features due=
 to wrong include
- [Low] dts: include of non-existent U-Boot dtsi file breaks compilation
- [Low] kbuild: missing device tree binary target for i.MX6 Quad Plus
- [Low] dts: missing #else directive causes skipped properties or duplicate=
 syntax error
--

commit a3be5f85dbb9af1e9cf58843b4f41c4f63c8e8f5
Author: Petko Manolov <petko.manolov@konsulko.com>
arm: dts: nxp: imx: Add devicetree files for M48

This commit adds device tree definitions for two variants of the Draeger
M48 board based on the i.MX6Q and i.MX6DL SoCs. It includes a common
dtsi and specific dts files for the Quad, DualLite, and Quad Plus variants.

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
[ ... ]
> @@ -220,6 +220,8 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>  	imx6q-dmo-edmqmx6.dtb \
>  	imx6q-dms-ba16.dtb \
>  	imx6q-ds.dtb \
> +	imx6q-draeger-m48.dtb \
> +	imx6dl-draeger-m48.dtb \
>  	imx6q-emcon-avari.dtb \

[Severity: Low]
Does this Makefile section miss the target for the Quad Plus variant?

The patch introduces imx6qp-draeger-m48.dts, but it appears to be omitted
from the dtb-$(CONFIG_SOC_IMX6Q) compilation list. This means it might not
be built during a standard make dtbs run.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6dl-draeger-m48.dts
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
Could these macro definitions cause a heap buffer overflow during the imx
pinctrl driver probe?

These macros appear to define raw IOMUXC GPR register offsets (0x768 and
0x788) in the position normally used for pad mux_reg values.=20

When the pinctrl-imx driver parses these entries in imx_pinctrl_parse_pin_m=
mio():

	*pin_id =3D (mux_reg !=3D -1) ? mux_reg / 4 : conf_reg / 4;
	pin_reg =3D &ipctl->pin_regs[*pin_id];
	pin->pin =3D *pin_id;
	pin_reg->mux_reg =3D mux_reg;
	pin_reg->conf_reg =3D conf_reg;

It calculates the array index as mux_reg / 4 (which evaluates to 474+). Sin=
ce
the destination array ipctl->pin_regs is allocated based on the total numbe=
r of
pins (~216 for i.MX6), writing to these calculated indices writes past the =
end
of the heap allocation, likely causing memory corruption and an early kernel
panic. (The same issue applies to the i.MX6Q and i.MX6QP dts files).

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
[ ... ]
> +	lvds-channel@0 {
> +		fsl,data-mapping =3D "spwg";
> +		fsl,default-data-width =3D <24>;

[Severity: High]
Will the imx-ldb driver probe fail here due to this property name?

The property fsl,default-data-width does not seem to exist in the bindings.
Because fsl,data-width is missing on the channel node, of_get_bus_format()
resolves the width to 0.=20

When the driver compares datawidth =3D=3D 0 against valid widths (18 or 24)=
 in
imx_ldb_bit_mappings, it will return -ENOENT, aborting the entire LVDS
controller probe and leaving the display non-functional.

> +		status =3D "okay";
> +
> +		display-timings {
> +			native-mode =3D <&timing0>;
> +
> +			timing0: 1920x1080-32@60 {
> +				fsl,dual-channel;

[Severity: High]
Is this property nested too deeply to be parsed?

Properties like fsl,dual-channel and fsl,data-width appear to be wrongly
nested inside the display-timings subnodes, where the imx-ldb driver's pars=
er
will likely ignore them. They should be placed directly on the lvds-channel=
@0
node.

[ ... ]
> +	config {
> +		#ifdef LEGACY_BOOT
> +		bootcmd =3D "startM48;errorMsg";
> +			bootcmd =3D "startKernel;errorMsg";
> +		#endif
> +
> +	};
> +};

[Severity: Low]
Is there a missing #else directive in this block?

If LEGACY_BOOT is defined, dtc will fail with a 'Duplicate property name'
syntax error. If it is undefined, both properties are excluded by the
preprocessor, leaving the config node unexpectedly empty.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6qp-draeger-m48.dts
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts
[ ... ]
> +/dts-v1/;
> +
> +#include "imx6q.dtsi"

[Severity: Medium]
Does this include the incorrect SoC base definitions?

The device tree explicitly declares compatibility with fsl,imx6qp below, but
it includes imx6q.dtsi instead of imx6qp.dtsi. This omits the Quad Plus
specific fixes, clocks, and peripheral updates (like fsl,imx6qp-pre and
fsl,imx6qp-prg), causing the Quad Plus hardware to be initialized with miss=
ing
hardware features.

> +/* PAD config disabled in imx6qdl-draeger-m48.dtsi by setting value to 0=
x80000000
> + * PAD configuration register must not be 0, so it is set to 0xfff
> + */
> +#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x790 0xfff 0x000 0x000=
C0000 0x0
> +#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x7ac 0xfff 0x000 0x000=
00200 0x0
> +#define IMX_PAD_SION	                         0x40000000	/* set SION */
> +
> +#include "imx6qdl-draeger-m48.dtsi"
> +#include "imx6qdl-draeger-m48-u-boot.dtsi"

[Severity: Low]
Does this include cause a fatal build error?

The file imx6qdl-draeger-m48-u-boot.dtsi does not appear to exist in the
upstream kernel source tree. Attempting to build this device tree results
in a C preprocessor 'No such file or directory' error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923144905.3365=
851-1-petko.manolov@konsulko.com?part=3D2

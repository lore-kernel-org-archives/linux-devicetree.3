Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFEB4078D9
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 18:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276275; cv=none; b=b61MSHXO42r5q6aVYTm8x3iiXdtX+mIHH88eza92MA6+XffjrrxsIpyjeLg4GprOsOo4hcyryDxQnrzMrGjxMuivnPwdi7JeYsfbJHeZdNZILcSrZ6xWOaEih66w27Feefj8n7N8cI2p3o9bs735jki8tPQZiDx/gfdFHoV6BIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276275; c=relaxed/simple;
	bh=/lC45UwE8Q1gvphios4i6AnWaEFVAUB1nn9LoA39cVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RGKeY0D6mwkANtl3DSrZqa43ZRHccJa/MPOV+g3/ap+tZ7tB8xbCEqifZU2ro+5wRU3g9gq4cRULSCXVrPxjXdSkjH3VA34ww6QJOo+IwpMeMGS4RHf+h7L+EWNrZ5ke+koAOjCOAUbGFCZelqgGhINCr0YsIhxlz6sDS3D93hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYyyA2tr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYyyA2tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5435E1F00893;
	Thu, 24 Sep 2026 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790276266;
	bh=kf1Bl6hSYulQjf88ty9qT+TUCFEG8oBZgDkgj5jKNU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYyyA2trnWIiL3AkvTD3CFHy9Bil8o2Zv8jxVPDz/r0MNrpvjAPqH+9aWwatCYay4
	 ANt8eddUkshsWrdEjvFHJ8lJG4qiKvFqE1OFFI99Vcdf2+cp7GCI5v7r47Y9YONLaK
	 KDrchrWX+qJZA7PPJD1kNExgnb0E2PsVUPXfKOMS+TKQK7A1iQBz/A4NWKlorLcpSH
	 C4r004BcIEtJdX3e7k74KYLQlB9kYGTBxEhEa1+s0THAckIsUiC55OJf2uxfZ/wul3
	 k8YIBgByYgAunLy5BtJ9R+jSpevcbv45tyaQZIxI1RVRrgJh/NkkXtHpXnh+ZwUFkG
	 j64pEi2Q+1DCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924183855.1393302-3-petko.manolov@konsulko.com>
References: <20260924183855.1393302-1-petko.manolov@konsulko.com>
 <20260924183855.1393302-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 18:57:45 +0000
Message-Id: <20260924185746.5435E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] pinctrl: imx: out-of-bounds heap write during pinctrl mmio parsing
- [High] drm/imx: imx-ldb probe failure due to missing fsl,data-width prope=
rty
- [Medium] dt: missing nvmem-cells for FEC MAC address provisioning
- [Low] build: missing U-Boot dtsi include and Makefile target for imx6qp
- [Low] dt: invalid syntax with duplicate properties under U-Boot macro
- [Low] dt: dead display-timings node in dw-hdmi configuration
--

commit 5077f8eda8c37343a057ce35121fe2403593e1fb
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: nxp: imx: Add devicetree files for M48

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other. This patch adds the
DT for the two variants of M48 that are based on imx6q and imx6dl.

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

[Severity: Low]
Is the imx6qp-draeger-m48.dtb variant intentionally missing from this list?

Because it is excluded from the build, it manifests as dead code and masks a
compilation error where the imx6qp variant includes a nonexistent U-Boot
dtsi.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> new file mode 100644
> index 0000000000000..45809770d16f3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
[ ... ]
> +#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x768 0xfff 0x000 0x000=
C0000 0x0
> +#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x788 0xfff 0x000 0x000=
00200 0x0

[Severity: High]
Does this custom macro define an invalid mux_reg offset (0x768) that
translates to an out-of-bounds pin ID?

When the device tree assigns these out-of-bounds register offsets to the
standard fsl,pins pinctrl group enetgrp, the driver calculates an array ind=
ex
by dividing mux_reg (0x768) by 4, yielding pin_id =3D 474.

In drivers/pinctrl/freescale/pinctrl-imx.c:imx_pinctrl_parse_pin_mmio():

    *pin_id =3D (mux_reg !=3D -1) ? mux_reg / 4 : conf_reg / 4;
    pin_reg =3D &ipctl->pin_regs[*pin_id];
    pin->pin =3D *pin_id;
    pin_reg->mux_reg =3D mux_reg;

The ipctl->pin_regs array is allocated with info->npins (which is 216 for
i.MX6Q/DL). Writing to ipctl->pin_regs[474] writes strictly past the end of
the heap allocation, leading to memory corruption during early boot.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
> new file mode 100644
> index 0000000000000..bcfe7b2556cbd
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
[ ... ]
> +&fec {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_m48_enet>;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethphy>;
> +	status =3D "okay";

[Severity: Medium]
Is this missing the standard nvmem-cells bindings for FEC MAC address
provisioning?

The Linux fec driver relies on nvmem-cells and nvmem-mac-interfaces to
retrieve the programmed MAC address automatically. Since this relies on a
downstream U-Boot alias (eeprom_mac =3D &eeprom_mac;) instead, the kernel w=
ill
fail to extract the MAC address from the EEPROM and will assign a random MAC
address to the Ethernet interface.

[ ... ]
> +&hdmi {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_m48_hdmi>;
> +
> +	display-timings {
> +		native-mode =3D <&hdmi0>;
> +
> +		hdmi0: hdmi {
> +			clock-frequency =3D <65000000>;

[Severity: Low]
Are these display timings dead code?

This display-timings node is embedded directly within the &hdmi controller
node, which is unsupported and unparsed by the dw-hdmi driver. The i.MX6 HD=
MI
DRM driver retrieves timings via DDC I2C (EDID) or DRM panel bridge binding=
s,
so these provided HDMI resolutions and timings are completely ignored.

[ ... ]
> +&ldb {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_m48_lvds>;
> +
> +	lvds-channel@0 {
> +		fsl,data-mapping =3D "spwg";
> +		fsl,default-data-width =3D <24>;

[Severity: High]
Will the use of a made-up fsl,default-data-width property instead of
fsl,data-width cause the imx-ldb probe to fail?

During probe, of_get_bus_format() reads a default datawidth of 0, fails to
find a matching 0-bit format for "spwg" in imx_ldb_bit_mappings, and returns
-ENOENT.

In drivers/gpu/drm/imx/ipuv3/imx-ldb.c:imx_ldb_bind():

    if (bus_format < 0) {
        dev_err(dev, "could not determine data mapping: %d\n",
            bus_format);
        ret =3D bus_format;
        goto free_child;
    }

Because -ENOENT evaluates to < 0 and is not explicitly handled as an option=
al
-EINVAL fallback, the driver aborts with a "could not determine data mappin=
g"
error, causing the LVDS display output to completely fail.

[ ... ]
> +	config {
> +		#ifdef LEGACY_BOOT
> +		bootcmd =3D "startM48;errorMsg";
> +			bootcmd =3D "startKernel;errorMsg";
> +		#endif
> +
> +	};

[Severity: Low]
Does this duplicate bootcmd property declaration cause an invalid syntax
error?

If the Device Tree is preprocessed with -DLEGACY_BOOT, the Device Tree
Compiler (DTC) will error out due to duplicate properties within the same
block.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6qp-draeger-m48.dts
> new file mode 100644
> index 0000000000000..ab331596abd98
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts
[ ... ]
> +#include "imx6qdl-draeger-m48.dtsi"
> +#include "imx6qdl-draeger-m48-u-boot.dtsi"

[Severity: Low]
Does this reference a nonexistent file?

This includes a downstream U-Boot artifact (imx6qdl-draeger-m48-u-boot.dtsi)
which does not exist in the upstream tree. If built out-of-tree or enabled
later, it will immediately trigger a fatal preprocessor error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924183855.1393=
302-1-petko.manolov@konsulko.com?part=3D2

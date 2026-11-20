Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158670;
	b=bHvtPpAGvydpHw5/tLL45SnOUWSHpBRwbZx1QxMHeBwnxub2Vr8Lfixr0/3C7TzLGoda
	 XpyNLJHU7poAExhXtKTvunX66t/Zi8H/z1oSE0pkFrap0uT4IOB6qw2ZLfdsZ5bWWk+Vf
	 DmPeYbUnHjWuScwDyULslVI+iNwCW/i3UgYdI/74Hml59TKMKzSdDEXS02HPDsrggNiNI
	 dVlmK+IKQdccq5jw6e5fmRiGaj6qH4h8U07HyOVR2wzSn+cvD0/wEREt1iBb6j4IEgX+S
	 QQd4A1ugTbtFXGfuRycCgbpROduME7qScNvAcSVM2UxMSuT4l04FQiRHXnbOITgK6GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158670;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HU09xognARA3IK+JXObYwmMrDMX2pNQo2FQI+xg6R1g=;
	b=2O4YZ78ubcXOjV9EZ+g38uaUwO2/WzRSgN0vvJwXfIIHqVhZpGT69PO9oki4uFoBkC62
	 FCaJsshclynu5tQ1qvyxguh1QEnbys6iqh8njTSnMV8qo5j8RdxrMMPwZivkCH3TPmdQb
	 GytgdWgi66n8NrnDH9fxeomRUQmhsyqfecF0Td8BYtGmfAXT28CwBWRqKcrW7gMGzmKXY
	 qQMwT4/8vsKgPW1cWHdsqOhtIC0USWNG/BsD/UgBLuPozkL4xxgNUkJDN1DarcKglOuge
	 SFXj0rWK5NiZSeYS9Plee871IlzzPV23+vsZdDko0msE4X4FdLyF2fIiW9AGp9yQDHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Yj15HC/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3E9606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yj15HC/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177D41F000C4;
	Fri, 20 Nov 2026 07:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795158670;
	bh=HU09xognARA3IK+JXObYwmMrDMX2pNQo2FQI+xg6R1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yj15HC/HDIjeRe5AdUimu/NHirxSOKRFgddlrjDZxxFEjjeMWLGd5kOcePoVy05JU
	 Jk4brpOR902bQCXLm17JQNKCXiyGcKAUc/GLrum5IALHhBZrgx7IS9hb7eGWdH/r5v
	 4R6oX+1qe6igG71lnWf6yqrLbS5U72KGkTgLC67lL0l2BxKllBFgIGwvYccytasKYs
	 dkHUDLCdJpYPizsPwA/F8h+XXvoS2XuKXG2x5AsceeLPs246J3SeC2vZYcgELtVGrU
	 DZQU6IKT5vUkGHC0FChwyRUaO2kfOCsfZmDmXOWyJPD7Eb5m2EtazMtWZv/B4+QHuX
	 W+nryWFmYTddQ==
Message-ID: <sashiko-outbox-224600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-lemans-draco-final-changes-bringup-v3-3-db08f12f0cd5@oss.qualcomm.com>
References: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
 <20261119-lemans-draco-final-changes-bringup-v3-3-db08f12f0cd5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:11:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] arm64: dts: qcom: wrong deprecated phy-supply on serdes0 and
  serdes1
- [High] arm64: dts: qcom: missing enable-active-high on DP power
  regulators
- [High] arm64: dts: qcom: misplaced PCIe PERST#/WAKE# GPIOs and wrong
  WAKE# polarity
- [High] arm64: dts: qcom: missing pciclass,0604 compatible on TC9563
  pcie@1,0 port
- [High] arm64: dts: qcom: swapped vdda-phy and vdda-pll on USB QMP PHYs
  in Draco SoM
- [Medium] arm64: dts: qcom: TC9563 endpoint functions under pcie@3,0
  modeled as bridges
- [Low] arm64: dts: qcom: undocumented vdda-refgen-supply on pcie0_phy
  and pcie1_phy
- [Low] arm64: dts: qcom: Makefile entries for lemans-draco-evk out of
  order
--

commit cde350979c0cc65bfe5158a7e63d40d7f1a15e33
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add LeMans Draco EVK board

This commit adds the device tree and Makefile entries for the Qualcomm
LeMans Draco EVK board, building on top of the LeMans Draco SoM DTSI.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 9553e3aaeccb0..11448d8c70876 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -62,6 +62,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D kaanapali-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D kaanapali-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D kalambo-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-draco-evk.dtb
> +
> +lemans-draco-evk-el2-dtbs :=3D lemans-draco-evk.dtb lemans-el2.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-draco-evk-el2.dtb

[Severity: Low]
This isn't a bug, but lemans-draco-evk.dtb and lemans-draco-evk-el2.dtb
sort alphabetically before lemans-evk.dtb.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/b=
oot/dts/qcom/lemans-draco-evk.dts
> new file mode 100644
> index 0000000000000..7ac3a867d29a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
> @@ -0,0 +1,778 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include "lemans-draco-som.dtsi"

[Severity: High]
Are vdda-phy-supply and vdda-pll-supply swapped on usb_0_qmpphy and
usb_1_qmpphy in lemans-draco-som.dtsi (added in commit "arm64: dts: qcom:
lemans: Add LeMans Draco EVK SoM platform")?

Both USB QMP PHY nodes assign the 1.2V rail (vreg_l1c) to vdda-phy-supply
and the ~0.88V rail (vreg_l7a) to vdda-pll-supply:

arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi:
&usb_0_qmpphy {
	vdda-phy-supply =3D <&vreg_l1c>;
	vdda-pll-supply =3D <&vreg_l7a>;

	status =3D "okay";
};

As fixed for other LeMans boards in 932113c3c778 ("arm64: dts: qcom:
lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies") and matching
ufs_mem_phy in the same SoM file, the SA8775P QMP PHY expects the ~0.88V
rail (vreg_l7a) on vdda-phy-supply and the 1.2V rail (vreg_l1c) on
vdda-pll-supply.

[ ... ]

> +	vreg_dp0_pwr: regulator-dp0-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP0_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 7 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_dp1_pwr: regulator-dp1-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP1_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 8 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_dp2_pwr: regulator-dp2-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP2_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 9 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_dp3_pwr: regulator-dp3-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP3_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 10 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: High]
Are vreg_dp0_pwr through vreg_dp3_pwr missing enable-active-high?

For regulator-fixed nodes, of_gpio_set_polarity_by_property() in
drivers/gpio/gpiolib-of.c ignores the GPIO_ACTIVE_HIGH flag in the gpio
phandle specifier and forces OF_GPIO_ACTIVE_LOW unless enable-active-high
is present, so enabling these regulators will drive expander1 pins 7..10
low and keep 3.3V DP_PWR disabled on all four DisplayPort connectors.

[ ... ]

> +&pcie0 {
> +	perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 =3D <&pcie0_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	iommu-map =3D <0x0 &pcie_smmu 0x0 0x0 0x1>,
> +		    <0x100 &pcie_smmu 0x1 0x0 0x1>,
> +		    <0x208 &pcie_smmu 0x2 0x0 0x1>,
> +		    <0x210 &pcie_smmu 0x3 0x0 0x1>,
> +		    <0x218 &pcie_smmu 0x4 0x0 0x1>,
> +		    <0x300 &pcie_smmu 0x5 0x0 0x1>,
> +		    <0x400 &pcie_smmu 0x6 0x0 0x1>,
> +		    <0x500 &pcie_smmu 0x7 0x0 0x1>,
> +		    <0x501 &pcie_smmu 0x8 0x0 0x1>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply =3D <&vreg_l5a>;
> +	vdda-pll-supply =3D <&vreg_l1c>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios =3D <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 =3D <&pcie1_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};

[Severity: High]
Should perst-gpios and wake-gpios on pcie0 and pcie1 be moved to the root
port nodes (pcieport0 and pcie1_port0) as reset-gpios and wake-gpios, with
wake-gpios changed to GPIO_ACTIVE_LOW?

pci_configure_of_wake_gpio() looks up wake-gpios on the root port pci_dev
OF node rather than the host bridge node, so wake-gpios on pcie0 and pcie1
is ignored; furthermore, WAKE# is an active-low line pulled up in
pcie0_default_state and pcie1_default_state, so GPIO_ACTIVE_HIGH would
configure a level-high wake IRQ (see e3a8a50e2a04 ("arm64: dts: qcom:
lemans: Move PCIe phy and GPIOs to root port node") and cd8d4803bba6
("arm64: dts: qcom: lemans: Fix PCIe WAKE# GPIO polarity")).

Keeping perst-gpios on the Root Complex node also triggers a runtime
warning in qcom_pcie_parse_perst() ("Reusing PERST# from Root Complex
node. DT needs to be fixed!") and adds duplicate reset descriptors to
port->perst for every descendant PCI bridge node.

> +
> +&pcie1_phy {
> +	vdda-phy-supply =3D <&vreg_l5a>;
> +	vdda-pll-supply =3D <&vreg_l1c>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does vdda-refgen-supply on pcie0_phy and pcie1_phy violate
qcom,sc8280xp-qmp-pcie-phy.yaml?  The binding only permits
vdda-phy-supply, vdda-pll-supply, and vdda-qref-supply (and the SA8775P
QMP PCIe PHY driver only requests vdda-phy and vdda-pll).

> +
> +&pcieport0 {
> +	#address-cells =3D <3>;
> +	#size-cells =3D <2>;
> +
> +	pcie@0,0 {
> +		compatible =3D "pci1179,0623";
> +		reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		device_type =3D "pci";
> +		ranges;
> +		bus-range =3D <0x2 0xff>;
> +
> +		vddc-supply =3D <&vreg_0p9>;
> +		vdd18-supply =3D <&vreg_1p8>;
> +		vdd09-supply =3D <&vreg_0p9>;
> +		vddio1-supply =3D <&vreg_1p8>;
> +		vddio2-supply =3D <&vreg_1p8>;
> +		vddio18-supply =3D <&vreg_1p8>;
> +		i2c-parent =3D <&i2c18 0x77>;
> +		resx-gpios =3D <&tlmm 10 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 =3D <&tc9563_resx_n>;
> +		pinctrl-names =3D "default";
> +
> +		pcie@1,0 {
> +			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x3 0xff>;
> +
> +			port {
> +				tc9563_pcie1_ep: endpoint {};
> +			};
> +		};

[Severity: High]
Is pcie@1,0 missing compatible =3D "pciclass,0604"?

pci_pwrctrl_is_required() returns false when a PCI bridge node has no
compatible property starting with "pci", so pci-pwrctrl-slot will not bind
to this downstream port and the "pcie" power sequencer target on
wifi-bt-connector (pwrseq-pcie-m2) will never be enabled for the M.2 E-key
slot.

> +
> +		pcie@2,0 {
> +			reg =3D <0x21000 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x4 0xff>;
> +		};
> +
> +		pcie@3,0 {
> +			reg =3D <0x21800 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x5 0xff>;
> +
> +			pcie@0,0 {
> +				reg =3D <0x50000 0x0 0x0 0x0 0x0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				ranges;
> +			};
> +
> +			pcie@0,1 {
> +				reg =3D <0x50100 0x0 0x0 0x0 0x0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				ranges;
> +			};
> +		};

[Severity: Medium]
Should the two integrated TC9563 Ethernet endpoint functions under
pcie@3,0 omit device_type =3D "pci", #address-cells, #size-cells, and
ranges (and be named ethernet@0,0 and ethernet@0,1 per
toshiba,tc9563.yaml)?

These functions are PCIe endpoints rather than PCI-to-PCI bridges, and
setting device_type =3D "pci" causes kernel OF PCI helpers that check
of_node_is_type(child, "pci") to treat them as bridges (see ca3027cfe8c7
("arm64: dts: qcom: lemans-evk-ifp-mezzanine: Clean up TC9563 switch
nodes")).

[ ... ]

> +&serdes0 {
> +	phy-supply =3D <&vreg_l5a>;
> +
> +	status =3D "okay";
> +};
> +
> +&serdes1 {
> +	phy-supply =3D <&vreg_l5a>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Should serdes0 and serdes1 specify vdda-0p9-supply =3D <&vreg_l4a> and
vdda-1p2-supply =3D <&vreg_l1c> instead of phy-supply =3D <&vreg_l5a>?

In drivers/phy/qualcomm/phy-qcom-sgmii-eth.c, qcom_dwmac_sgmii_phy_probe()
only requests "vdda-0p9" and "vdda-1p2" and ignores the deprecated
phy-supply property:

drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:
static const struct regulator_bulk_data qcom_dwmac_sgmii_phy_vregs[] =3D {
	{ .supply =3D "vdda-0p9", .init_load_uA =3D 46000 },
	{ .supply =3D "vdda-1p2", .init_load_uA =3D 15000 },
};

Without vdda-0p9-supply and vdda-1p2-supply (as fixed for lemans-evk in
457cf65a7997 ("arm64: dts: qcom: lemans-evk: fix SerDes PHY regulator
supplies")), dummy regulators are used and the 0.9V and 1.2V SerDes rails
are not voted for when bringing up ethernet0 and ethernet1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-lemans-dra=
co-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com?part=3D3

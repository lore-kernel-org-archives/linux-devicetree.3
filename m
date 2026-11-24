Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517640;
	b=dke0oZ9BMWjD9RMgvRqEsqElc4cDTdsFOT84lEkN8pze8VrIhQ1KrD98uKXISCI84iu5
	 Kwomve4DvouZhcf2ZBWf72yPK+P3OhCaUi8/wqnXL+FzrSAEvXxokbync0hS+tgsIoBpL
	 7QGCOIoiUH4z45DX1nwDhB04PHqrYGjxmqRqTL6VJDFot5gJmLmh3XYMmXdr66ByvBfIE
	 8iyNQkxoF6ZR8KVQblofmteTsCnl/m/SzVv5DJxkBsLovHo0XOjIY0yn8aH3dqvt0EYfN
	 yJ9wQmmdXPZ0w7wSkzWxacUlhXkmPRZmK/iPYYoBl/UEfcLAPqElN+ffxYs1r8lGjKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517640;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xN7gn6pfCxDqqJhRiudXqObOpx7k7lXmkErdnlf7cvU=;
	b=KIS3pDdxgKB50zkqasY/3qwHZ//p1FJh6jgRRtu60BMi+JqZK/lIaICyCP4vHDZN0fBb
	 OnEo2Ms0nQZ3Eh7sB/iW702ckaOPxQWoq51JXZhwxgNFNjhzRKB3uyUW23j0RVmUYyg+A
	 kOsuhfL67wTKirjfGtgahoQ8dXUuA3qUfMBSaG+h3Sv8GWjAUF6gCSHaIOIozdjk1OCTO
	 lfwbZFaFdr/Ay6hDiP3NOf9zNhjNUfjNjFVw6w5EEMteOAIKUOv/yFBvjDuILR7/fzome
	 Kp+YBxZvNHeUhz4WjAjosBVgoHdevQ4OvwODJuRBJuAzGN70is4i/5ULsv6HDw1AIqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WxHdQgBY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC3606A33C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WxHdQgBY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AB81F000EC;
	Tue, 24 Nov 2026 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517640;
	bh=xN7gn6pfCxDqqJhRiudXqObOpx7k7lXmkErdnlf7cvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WxHdQgBYOur/i7S11Boon3xZVawKmSAezpO0fS1Y66izUM5zJd0OO8OikKo5zmoaZ
	 pNfScgJb4sqWIePY1nWWTN/jTKiTLXhVf2EWgvYZFk+fzZWSJjE0s/vCmvA5CjyDGc
	 JwqkS1FpTkb4HFkgq1Nrq7w/nuAAkoicsvmudH9oVRChMP/PI5aTFqIfAoiMX61tO+
	 IA6uL73uyZwIdzHZMUZVvdUxSNLV0mveTTYACqIHTqauMg56Ur4u3SnMbAhTDJnXWy
	 7bv0pS+HIMGjkmVZS3RYULCedpYVk8qAuTODos1ttE8H0bgLCeuPunnBxyQeAh8228
	 WweSt/JU9umpg==
Message-ID: <sashiko-outbox-230989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:53:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential
issues to consider:
- [High] arm64: dts: qcom: undocumented and unmatched sound card
  compatible string
- [High] arm64: dts: qcom: wrong deprecated phy-supply on serdes0 and
  serdes1
- [High] arm64: dts: qcom: missing enable-active-high on DP power
  regulators
- [High] arm64: dts: qcom: missing pciclass,0604 compatible on TC9563
  pcie@1,0 port
- [High] arm64: dts: qcom: misplaced PCIe GPIOs, WAKE# polarity, and
  TC9563 nodes
- [High] arm64: dts: qcom: swapped vdda-phy and vdda-pll on Draco USB
  QMP PHYs
- [Medium] arm64: dts: qcom: TC9563 endpoint functions under pcie@3,0
  modeled as bridges
- [Medium] arm64: dts: qcom: board-defined LPASS nodes with wrong LPI
  compatible
- [Medium] arm64: dts: qcom: IRQ_TYPE_NONE and non-generic name on
  max98091@10 node
- [Low] arm64: dts: qcom: undocumented vdda-refgen-supply on pcie0_phy
  and pcie1_phy
- [Low] arm64: dts: qcom: Makefile entries for lemans-draco-evk out of
  order
- [Low] arm64: dts: qcom: unsorted DT nodes in lemans-draco-evk.dts
--

commit c579a949f716eabfd67d51fbf7723ec7509817d7
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add LeMans Draco EVK board

This commit adds the devicetree for the LeMans Draco EVK platform combining
the LeMans Draco EVK SoM and Draco carrier board.

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
This isn't a bug, but lemans-draco-evk.dtb and lemans-draco-evk-el2.dtb sort
alphabetically before lemans-evk.dtb.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/b=
oot/dts/qcom/lemans-draco-evk.dts
> new file mode 100644
> index 0000000000000..00a0a4315bf39
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
> @@ -0,0 +1,990 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include "lemans-draco-som.dtsi"

[Severity: High]
Do usb_0_qmpphy and usb_1_qmpphy in lemans-draco-som.dtsi have
vdda-phy-supply and vdda-pll-supply swapped?

In lemans-draco-som.dtsi, usb_0_qmpphy and usb_1_qmpphy assign the 1.2V rail
(&vreg_l1c) to vdda-phy-supply and the ~0.88V rail (&vreg_l7a) to
vdda-pll-supply, whereas SA8775P QMP PHYs take ~0.88V (&vreg_l7a) on
vdda-phy-supply and 1.2V (&vreg_l1c) on vdda-pll-supply, as fixed for
lemans-evk in 932113c3c778 ("arm64: dts: qcom: lemans: Fix swapped USB QMP
PHY vdda-phy/vdda-pll supplies") and used on ufs_mem_phy.

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

of_gpio_set_polarity_by_property() in drivers/gpio/gpiolib-of.c ignores the
GPIO_ACTIVE_HIGH phandle flag on regulator-fixed nodes and forces active-low
polarity unless enable-active-high is present, which inverts 3.3V DP power
control on DP0 through DP3.

[ ... ]

> +	sound {
> +		compatible =3D "qcom,qcs9100-draco-sndcard";
> +		model =3D "LEMANS_DRACO_EVK";

[Severity: High]
Should the sound node use compatible =3D "qcom,qcs9100-sndcard"?
"qcom,qcs9100-draco-sndcard" is neither documented in
Documentation/devicetree/bindings/sound/qcom,sm8250.yaml nor matched by
snd_sc8280xp_dt_match[] in sound/soc/qcom/sc8280xp.c, so no ASoC machine
driver binds to the sound card.

[ ... ]

> +&soc {
> +	lpass_tlmm: pinctrl@3440000 {
> +		compatible =3D "qcom,sc8280xp-lpass-lpi-pinctrl";
> +		reg =3D <0x0 0x03440000 0x0 0x20000>,
> +			<0x0 0x034d0000 0x0 0x10000>;
> +		clocks =3D <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>,
> +			<&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "core", "audio";
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-ranges =3D <&lpass_tlmm 0 0 19>;

[ ... ]

> +	lpass_va_macro: codec@33F0000 {
> +		compatible =3D "qcom,sc7280-lpass-va-macro";
> +		reg =3D <0 0x33F0000 0 0x1000>;

[Severity: Medium]
Should lpass_tlmm use compatible =3D "qcom,sa8775p-lpass-lpi-pinctrl",
"qcom,sm8450-lpass-lpi-pinctrl" with gpio-ranges =3D <&lpass_tlmm 0 0 23>, =
and
should lpass_tlmm and lpass_va_macro live in the SoC dtsi rather than the
board dts?

Using "qcom,sc8280xp-lpass-lpi-pinctrl" binds to SC8280XP LPI pinctrl data
(19 pins and SC8280XP mux tables) instead of the 23-pin SA8775P/SM8450 LPI
pinctrl driver.  In addition, codec@33F0000 uses an uppercase hex digit in
its unit-address (which triggers a dtc simple_bus_reg warning) and is placed
after pinctrl@3440000.

[ ... ]

> +&i2c18 {
> +	status =3D "okay";

[ ... ]

> +&i2c7 {
> +	status =3D "okay";
> +
> +	max98091: max98091@10 {
> +		compatible =3D "maxim,max98091";
> +		reg =3D <0x10>;
> +		#sound-dai-cells =3D <0>;
> +		clock-names =3D "mclk";
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>;
> +		assigned-clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_=
COUPLE_NO>;
> +		assigned-clock-rates =3D <12288000>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <51 IRQ_TYPE_NONE>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&int_codec>;
> +	};
> +};

[Severity: Medium]
Does interrupts =3D <51 IRQ_TYPE_NONE> on max98091@10 trigger a GICv3 WARN_=
ON
at boot?

On SA8775P, TLMM GPIO 51 routes through PDC pin 195 to GICv3, and
qcom_pdc_alloc() forwards IRQ_TYPE_NONE to gic_irq_domain_translate(),
hitting WARN_ON(*type =3D=3D IRQ_TYPE_NONE) (MAX98090/MAX98091 uses
IRQ_TYPE_EDGE_FALLING).  Also, per the binding and DT specification, the
node name should be generic audio-codec@10 rather than max98091@10.

> +
> +&i2c2 {
> +	status =3D "okay";

[Severity: Low]
As reported by Dmitry Baryshkov on v1 [1], several nodes in this file are o=
ut
of alphabetical order: in the root node, regulator-keye-3p3 should precede
regulator-va-micb-1p8 and regulator-va-micb-en, and sound should precede
wifi-bt-connector; among phandle references, &soc is placed before &etherne=
t0
and the I2C nodes are ordered &i2c18, &i2c7, &i2c2, &i2c4.

[ ... ]

> +&pcie0 {
> +	perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 =3D <&pcie0_default_state>;
> +	pinctrl-names =3D "default";

[ ... ]

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
> +
> +&pcie1_phy {
> +	vdda-phy-supply =3D <&vreg_l5a>;
> +	vdda-pll-supply =3D <&vreg_l1c>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Should perst-gpios and wake-gpios on &pcie0 and &pcie1 be moved to the root
port nodes (&pcieport0 and &pcie1_port0) as reset-gpios and active-low
wake-gpios?

pci_configure_of_wake_gpio() looks up wake-gpios on the root port pci_dev OF
node rather than the host bridge node, and PCIe WAKE# is an active-low
open-drain line (see cd8d4803bba6 ("arm64: dts: qcom: lemans: Fix PCIe WAKE#
GPIO polarity")).  Defining perst-gpios on the host bridge node when root
port child nodes exist also triggers a runtime dev_warn_once() in
qcom_pcie_parse_perst() and appends duplicate reset descriptors for every
descendant node with device_type =3D "pci".

[Severity: Low]
Is vdda-refgen-supply valid on &pcie0_phy and &pcie1_phy?
Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml only
permits vdda-phy-supply, vdda-pll-supply, and vdda-qref-supply, and the
SA8775P QMP PCIe PHY driver only requests vdda-phy and vdda-pll.

> +
> +&pcieport0 {
> +	#address-cells =3D <3>;
> +	#size-cells =3D <2>;
> +
> +	pcie@0,0 {

[ ... ]

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

pci_pwrctrl_is_required() in drivers/pci/pwrctrl/core.c returns false when a
PCI bridge node has no compatible property starting with "pci", so
slot_pwrctrl_driver never binds to pcie@1,0 to acquire and enable the "pcie"
power sequencer target from wifi-bt-connector.

[ ... ]

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
Should the two children of pcie@3,0 be ethernet@0,0 and ethernet@0,1 endpoi=
nt
nodes instead of PCI bridges?

These two functions are the TC9563 switch's integrated Ethernet MAC
endpoints, not PCI-to-PCI bridges.  Giving them device_type =3D "pci",
#address-cells, #size-cells, and ranges violates
Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml and causes OF PCI
helpers checking of_node_is_type(child, "pci") (such as
qcom_pcie_parse_perst()) to treat them as bridges.

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
Should &serdes0 and &serdes1 specify vdda-0p9-supply =3D <&vreg_l4a> and
vdda-1p2-supply =3D <&vreg_l1c> instead of the deprecated phy-supply?

qcom_dwmac_sgmii_phy_probe() in drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
only requests vdda-0p9 and vdda-1p2 and ignores phy-supply, leaving the real
0.9V and 1.2V SerDes rails unvoted when ethernet0 and ethernet1 bring up the
PHYs.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/=
boot/dts/qcom/lemans-draco-som.dtsi
> index 1001b6b81c312..3ec3c38d3cdfb 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
> @@ -5,6 +5,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  #include "lemans-embedded.dtsi"
>  #include "lemans-pmics.dtsi"

[Severity: Low]
This isn't a bug, but dt-bindings/sound/qcom,q6afe.h is only used in
lemans-draco-evk.dts, so it could be included there rather than in
lemans-draco-som.dtsi.

[1] https://lore.kernel.org/r/3btrmmavq65lp7rwmdx76qjvaseaoa55xdibdli2izuju=
sebhw@fkrtjiqsnvnt

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-lemans-dra=
co-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com?part=3D3

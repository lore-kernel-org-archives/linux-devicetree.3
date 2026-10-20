Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484350;
	b=tKbqxnbOHupudvsQG/Gv6Y/a+gHCLnSMvqoa7th7MOJaIE1SRVV7JGYMzEKpF6eudsgY
	 loWKU8r1HXDkQnk5qWf3kfuMI9sZgIJoAB3sj/qZACfmXsSpFSEqRuXIziLTrXZFqp2Ce
	 gqpONzmFH8yehHr3sqOam1lc7IPqt2Ja3tbPcL6+fQuX44sqspsLvvck5/rWyrVKKkaT2
	 K6Ki2n/p+02OEUDEkMh4O3y83pULlcoaS2m1OqdA29h4ujVFd9uKDn1WYhtgQcqLvbcDA
	 3pBklfhiGYaLV4pDRISYERur9rekQti1Zaaa8KXeYzm8CqBCuS0Fsa4DbMLQDHNcp+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484350;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pudx5xCxRUv6suJgUGtiqeQB3IDDovG/CUOHz82g0aI=;
	b=ZAzdNerpMP6ct9+5DDDj3QX04Z0MJlF3oD9cMT6LtVekn2VTuQeUO+PsYARqaKs+vnsF
	 5ig4OaxRYrKM19U0p2+zeqpauXjLvhe/9E+YTJY/yvNKAIcmmdoo/ZKfbXgInHVIpx0Yd
	 1cugn71joRIbjdHLE5cjpdEiRQjypu7zoehJarwP2gUIq1JoQpyCjNDgWae0XdNU+y6GG
	 BPwuAWgkBnfqspdq64ws4tsSmOHcsWMnyvG0OEUn6HBSPnhznIBUE9c2lH41VfF9e56Sr
	 NxcQ0IIAySi2PMYOgNbVupZyTBVU46agh8+FXsAldJz/V6nKckg0MANvV2MKpZUbkFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k57yaNSB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDEA606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k57yaNSB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF84D1F000C4;
	Tue, 20 Oct 2026 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484350;
	bh=Pudx5xCxRUv6suJgUGtiqeQB3IDDovG/CUOHz82g0aI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k57yaNSByAN4beG5T9l+xTuP07qLXgdAZ8Qv78Ate+JavyTRWfXGXj0JAixc9RILw
	 SDkSNc2QMdnhCQOd7utH1M5eTeEp0fWCRCgLTuRGmnk+b+v0KNiV3C06QUGL7OjnD8
	 GrJ+zMyFPakOqof62aGNBf0baIBkkjuyLB/lV4rlgb/Zp8Xp5puemNK5K4XxztDKcT
	 gIN89qs/6b+vlgD83DO3Zb/n2m+ooW0GmrDxeyfq0VBxGe3ffroTyO/ghkqgI2E64m
	 itKuNiXd9xveW1BrqbMoYZGisTnFeHPzpTIAI1WGQvkCs1Le/oBrJOVf5fjX9cAgqB
	 23pxBmsgt5XxQ==
Message-ID: <sashiko-outbox-178516@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linghui Wu" <linghui.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:19:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: unapplied shikra M.2 overlay and missing base DT=
B targets
- [Medium] arm64: dts: qcom: missing address/size cells and status in i2c3 =
overlay node
- [Medium] arm64: dts: qcom: shikra-iqs: duplicate m2_keye_3p3 supply on pc=
ie and M.2 connector
--

commit 09177a14c1310eacd965626caf4a52cacd777f25
Author: Linghui Wu <linghui.wu@oss.qualcomm.com>

arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay

This patch adds a device tree overlay for M.2 Key-E Wi-Fi and Bluetooth
modules on the Qualcomm Shikra IQS EVK and disables the onboard WCN3988
Wi-Fi and Bluetooth nodes when applied.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 1c86e7e98f55d..799faa32e2d98 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D shikra-iqs-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D shikra-iqs-evk-m2-wifi-bt.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6115-fxtec-pro1x.dtb

[Severity: High]
Does adding shikra-iqs-evk-m2-wifi-bt.dtbo directly to dtb-$(CONFIG_ARCH_QC=
OM)
without a composite -dtbs target cause a Kbuild warning and prevent the base
DTB from being compiled with symbols?

In scripts/Makefile.dtbs, Kbuild checks that every .dtbo in dtb-y is applied
to at least one base .dtb via a -dtbs rule:

scripts/Makefile.dtbs:
	applied-dtbo :=3D $(filter %.dtbo, \
		$(call real-search, $(call multi-search, $(all-dtb), .dtb, -dtbs), .dtb, =
-dtbs))
	unapplied-dtbo :=3D $(filter-out $(applied-dtbo),$(filter %.dtbo, $(dtb-y)=
))
	$(if $(unapplied-dtbo), $(warning .dtbo is not applied to any base: $(unap=
plied-dtbo)))

In addition, scripts/Makefile.dtbs only passes -@ to dtc for base DTBs list=
ed
in a composite -dtbs rule (base-dtb-y). Without defining:

	shikra-iqs-evk-m2-wifi-bt-dtbs :=3D shikra-iqs-evk.dtb shikra-iqs-evk-m2-w=
ifi-bt.dtbo
	dtb-$(CONFIG_ARCH_QCOM) +=3D shikra-iqs-evk-m2-wifi-bt.dtb

shikra-iqs-evk.dtb is compiled without a /__symbols__ node, so the overlay
cannot be applied to it. Furthermore, when attempting to apply this overlay
to shikra-iqs-evk.dtb, the target labels &pcie, &pcie_port0, and &tc9563
referenced below do not exist in shikra.dtsi, shikra-iqs-som.dtsi,
shikra-evk.dtsi, or shikra-iqs-evk.dts, causing fdtoverlay to fail with
FDT_ERR_NOTFOUND. Is this patch depending on unmerged base DTB changes?

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/ar=
ch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> new file mode 100644
> index 0000000000000..985c728dd693d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiarie=
s.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	m2_keye_3p3: regulator-m2-keye-3p3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_3P3_KEYE";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	wifi-bt-connector {
> +		compatible =3D "pcie-m2-e-connector";
> +
> +		vpcie3v3-supply =3D <&m2_keye_3p3>;
> +		w-disable1-gpios =3D <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios =3D <&tlmm 60 GPIO_ACTIVE_LOW>;

[ ... ]

> +&i2c3 {
> +	qps_gpio_expander: gpio@3c {
> +		compatible =3D "nxp,pca9534";
> +		reg =3D <0x3c>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +};

[Severity: Medium]
Should the &i2c3 fragment include #address-cells =3D <1>, #size-cells =3D <=
0>,
and status =3D "okay"?

When dtc compiles the .dtso plugin in isolation, check_reg_format() and
check_avoid_default_addr_size() in scripts/dtc/checks.c evaluate gpio@3c
against the fragment parent, which defaults to 2 address cells and 1 size
cell when #address-cells and #size-cells are omitted, emitting reg_format
and avoid_default_addr_size warnings on reg =3D <0x3c>.

Also, in arch/arm64/boot/dts/qcom/shikra.dtsi, i2c3 is defined with
status =3D "disabled" and is not enabled in the board DTS/DTSI files:

arch/arm64/boot/dts/qcom/shikra.dtsi:
	i2c3: i2c@4a8c000 {
		compatible =3D "qcom,geni-i2c";
		...
		status =3D "disabled";
	};

Without status =3D "okay" on &i2c3, will qps_gpio_expander and the dependent
m2_keye_3p3 regulator fail to probe?

> +
> +&pcie {
> +	iommu-map =3D <0x0 &apps_smmu 0x0800 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
> +	vddpe-3v3-supply =3D <&m2_keye_3p3>;
> +};

[Severity: Medium]
Will assigning &m2_keye_3p3 to both vddpe-3v3-supply on &pcie and
vpcie3v3-supply on wifi-bt-connector cause the PCIe host controller and
the M.2 power sequencer to contend over the 3.3 V regulator?

During qcom_pcie_probe() -> dw_pcie_host_init() -> qcom_pcie_host_init()
in drivers/pci/controller/dwc/pcie-qcom.c:

	ret =3D pcie->cfg->ops->init(pcie);
	if (ret)
		return ret;

	ret =3D qcom_pcie_phy_power_on(pcie);
	if (ret)
		goto err_deinit;

	if (!pci->suspended) {
		ret =3D pci_pwrctrl_create_devices(pci->dev);
		if (ret)
			goto err_disable_phy;
	}

	if (!pp->skip_pwrctrl_off) {
		ret =3D pci_pwrctrl_power_on_devices(pci->dev);
		if (ret)
			goto err_pwrctrl_destroy;
	}

pcie->cfg->ops->init(pcie) enables vddpe-3v3 (&m2_keye_3p3) directly before
pci_pwrctrl_create_devices() and pci_pwrctrl_power_on_devices() run. When
pci_pwrctrl_power_on_devices() returns -EPROBE_DEFER while waiting for
pci-pwrctrl-slot and pwrseq-pcie-m2 to bind, qcom_pcie_host_init() unwinds
through err_deinit and disables &m2_keye_3p3, glitching the 3.3 V rail
before re-probing. Once bound, &pcie also holds a direct enable vote on
&m2_keye_3p3 outside of pwrseq-pcie-m2. Should vddpe-3v3-supply be omitted
from &pcie so that &m2_keye_3p3 is managed solely via vpcie3v3-supply on
wifi-bt-connector?

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020020925.3915=
548-1-linghui.wu@oss.qualcomm.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875311;
	b=nmcTOus/mG6WFlJON2puTxMEJ2pGXGo+mWPjgCkk45z9+Kpp9E6Tls6pcvGyXhhdB/eO
	 F1z+hXQjXSCITLH2omUb85HuBxSfeZ2uOldFNN6kboD0JF/wfgfaoqmbarxGBgBoW6Wz9
	 DXAFK5lZZ8dT+TcvDiSAu0I1R+aT7dV4b5XJraswNaQDCEL6wGiu5rCEOsyjTEoXaF/C+
	 8sYMG6QqWMiyCWJrkSTdGa5Osq9k7tLbUN3BWs6OO1KEe3pOVsI5936KoRDsJp5gUKuD4
	 lR0NDGAqeUIJhGRXmXZEE5l1kpMimSbFTgiwj47ZRoMMN0ank1bnjrP4lcqf1erpv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875311;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HjG75y2yOUsODrYwVpEvQ5Gd7uB/mzkfHH5+DQgeKLI=;
	b=hqcjLFRnpd3QCEQWNah7/8XvFJsszVgqm9v3tjspFtuHppsUPcWoPCb3bDIi+bfIWDKA
	 utuJaIg/bvvQCTqWLCwYpVqMq3h7nEvEc/xDGdQMKmlmGZ4nEbUISSS11vI5J+DWrenCZ
	 YfhJyi8/Mm4VxMP97Sw99s0vQ5Vunf4gHPIVDEKOjfK9DGGQX9a9CBOYcF4CK2x2hW2+s
	 0rFhKkgN6AsvOjCVQznofKHPoDdJlNr3Zj6rySHdE/2lX+NBIa8KjjMZWs4MzoB0kMcgN
	 AYLbLl9WEkMmddrd4u3TAtmYZCMkVD8SCYZdTVWvAQPwxc94MroXxCB5fJJlNNJ4OZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkN4xK3r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD95606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkN4xK3r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFD51F00A15;
	Thu,  5 Nov 2026 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793875310;
	bh=HjG75y2yOUsODrYwVpEvQ5Gd7uB/mzkfHH5+DQgeKLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VkN4xK3rupMsVD+MEb1D5HEeCfGc3jJ1D8Zi+npdjzSS8K7DLNshdt5BNgn0VzlRk
	 /U3vJ76JH3sKsLqj+jVYBYJ2ZtODSNuxP6NGZ5cxfCjITzlvVvvxUVDh4yOkzjv5rF
	 iCjBU1BZHA7eGlHCRzXnq+fofY5+Dn0I1FGz9HcR7R3fnaDTW0oIXCjWvAYSFxiLM3
	 ao1cJasjZY2gMCzSDJIE9BOwPNORECBmBWq5r75N3zZHVPQKgcXvh3s2XTZGgh4Waq
	 UyOSxPCPRB24LtHm4LUSSPQrXT2t73yrV6szDNJ9lGjgdDR/7quUEkncfGL3GeRwS/
	 N4uLRyRDjRk/A==
Message-ID: <sashiko-outbox-198873@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for
 SD Card via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105101955.3732723-3-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
 <20261105101955.3732723-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:41:49 +0000
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
- [High] arm64: dts: qcom: monaco-evk-sd-card: invalid root syntax drops re=
gulators
- [Medium] arm64: dts: qcom: contradictory no-1-8-v property in monaco-evk-=
sd-card.dtso
- [Low] arm64: dts: qcom: monaco-evk: invalid sdhc1_opp_table overrides in =
SD overlay
--

commit 6648a626b1d62a283e700d9a648c1b8158385e14
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay

This commit removes the eMMC-specific sdhc_1 configuration from the base
monaco-evk.dts and introduces the monaco-evk-sd-card.dtso overlay to
configure sdhc_1 for SD card storage.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm6=
4/boot/dts/qcom/monaco-evk-sd-card.dtso
> new file mode 100644
> index 0000000000000..bc4ea12587a2e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +        vmmc_sdc: regulator-mmc-sdc {
> +                compatible =3D "regulator-fixed";
> +
> +                regulator-name =3D "vmmc_sdc";
> +                regulator-min-microvolt =3D <2950000>;
> +                regulator-max-microvolt =3D <2950000>;
> +        };
> +
> +        vreg_sdc: regulator-sdc {
> +		compatible =3D "regulator-gpio";
> +
> +		regulator-name =3D "vreg_sdc";
> +		regulator-type =3D "voltage";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <2950000>;
> +
> +		gpios =3D <&expander1 7 GPIO_ACTIVE_HIGH>;
> +		states =3D <1800000 1>, <2950000 0>;
> +
> +		startup-delay-us =3D <100>;
> +        };
> +};

[Severity: High]
Should this root node block use &{/} instead of / (like
monaco-evk-ifp-mezzanine.dtso does)?

In a /plugin/; overlay, dtc places child nodes defined under / { ... };
directly at the root of the .dtbo blob rather than wrapping them inside a
fragment@N node with an __overlay__ subnode.

When fdt_overlay_apply() merges monaco-evk-sd-card.dtbo into
monaco-evk.dtb, overlay_merge() in scripts/dtc/libfdt/fdt_overlay.c skips
any top-level subnode that lacks an __overlay__ subnode:

	fdt_for_each_subnode(fragment, fdto, 0) {
		int overlay;
		int target;

		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
		if (overlay =3D=3D -FDT_ERR_NOTFOUND)
			continue;

Similarly, init_overlay_changeset() in drivers/of/overlay.c ignores
top-level nodes without an __overlay__ child when applying overlays at
runtime.

As a result, both regulator-mmc-sdc (vmmc_sdc) and regulator-sdc
(vreg_sdc) are silently dropped from the merged device tree, while
vmmc-supply and vqmmc-supply in &sdhc_1 are rewritten to dangling phandles
that cause regulator lookup to fail in
sdhci_msm_probe() -> sdhci_msm_register_vreg() ->
mmc_regulator_get_supply() -> of_get_regulator().

> +
> +&sdhc_1 {
> +	vmmc-supply =3D <&vmmc_sdc>;
> +	vqmmc-supply =3D <&vreg_sdc>;
> +
> +	pinctrl-0 =3D <&sdc1_state_on>, <&sd_cd>;
> +	pinctrl-1 =3D <&sdc1_state_off>, <&sd_cd>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	cap-sd-highspeed;
> +	no-1-8-v;

[Severity: Medium]
As reported by Sashiko on v3 [1], is no-1-8-v intended here?

The overlay defines a 1.8V state on the vreg_sdc GPIO regulator for
vqmmc-supply:

	states =3D <1800000 1>, <2950000 0>;

and also adds 100 MHz and 202 MHz OPPs to &sdhc1_opp_table for UHS-I
modes.

However, setting no-1-8-v on &sdhc_1 causes
sdhci_msm_probe() -> sdhci_get_of_property() -> sdhci_get_property() to
set SDHCI_QUIRK2_NO_1_8_V, which in sdhci_setup_host() clears
SDHCI_SUPPORT_SDR104, SDHCI_SUPPORT_SDR50, SDHCI_SUPPORT_DDR50, and
MMC_CAP_UHS. That prevents 1.8V signaling switches in mmc_sd_init_card(),
caps the SD card at 50 MHz High-Speed mode, and leaves the 1.8V regulator
state and higher-frequency OPPs unused.

> +
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&tlmm 11 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +
> +	status =3D "okay";
> +};
> +
> +&sdhc1_opp_table {
> +	opp-100000000 {
> +		opp-hz =3D /bits/ 64 <100000000>;
> +		required-opps =3D <&rpmhpd_opp_low_svs>;
> +	};
> +
> +	opp-202000000 {
> +		opp-hz =3D /bits/ 64 <202000000>;
> +		required-opps =3D <&rpmhpd_opp_svs_l1>;
> +	};
> +};

[Severity: Low]
As reported by Sashiko on v4 [2], why does this board overlay modify
&sdhc1_opp_table?

In arch/arm64/boot/dts/qcom/monaco.dtsi, sdhc1_opp_table already defines:

	sdhc1_opp_table: opp-table {
		compatible =3D "operating-points-v2";

		opp-50000000 {
			opp-hz =3D /bits/ 64 <50000000>;
			required-opps =3D <&rpmhpd_opp_low_svs>;
		};

		opp-100000000 {
			opp-hz =3D /bits/ 64 <100000000>;
			required-opps =3D <&rpmhpd_opp_svs>;
		};

		opp-200000000 {
			opp-hz =3D /bits/ 64 <200000000>;
			required-opps =3D <&rpmhpd_opp_svs_l1>;
		};

		opp-384000000 {
			opp-hz =3D /bits/ 64 <384000000>;
			required-opps =3D <&rpmhpd_opp_nom>;
		};
	};

And in drivers/clk/qcom/gcc-qcs8300.c, ftbl_gcc_sdcc1_apps_clk_src (which
uses clk_rcg2_floor_ops) only provides 100 MHz, 192 MHz, and 384 MHz at
the top end, with no 202 MHz entry:

	static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] =3D {
		...
		F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
		F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
		F(192000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
		F(384000000, P_GCC_GPLL9_OUT_MAIN, 2, 0, 0),
		{ }
	};

Because device tree overlays merge child nodes without removing existing
ones, &sdhc1_opp_table in monaco-evk-sd-card.dtso lowers the SoC-defined
voltage corner for opp-100000000 from rpmhpd_opp_svs to
rpmhpd_opp_low_svs, leaves opp-200000000 and opp-384000000 in place, and
adds opp-202000000.

When dev_pm_opp_set_rate() calls clk_round_rate() and looks up the ceiling
OPP via _find_freq_ceil(), any 200-208 MHz request rounds down to
192000000 Hz and always matches the existing opp-200000000 entry before
opp-202000000, while sdhci_msm_probe() calling
dev_pm_opp_set_rate(&pdev->dev, INT_MAX) still selects opp-384000000.

[1] https://lore.kernel.org/r/20260701083148.0F8341F00A3A@smtp.kernel.org
[2] https://lore.kernel.org/r/20260716144010.1DC4F1F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105101955.3732=
723-1-monish.chunara@oss.qualcomm.com?part=3D2

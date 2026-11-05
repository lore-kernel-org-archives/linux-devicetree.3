Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874865;
	b=qz/EzTUSx1QMKL985PaX4YsCJswfeUVeHMaeT8m+TfLDhgHpqYaYQy6BYXAkNCKeps+Q
	 QxvvcR1IcoBP6fy32WKPFM/hhVgTBYA5CHCklkhn9rvWgPgYPQMElEfSzbVuX7XbqVia0
	 1cIEFmX+idM0v2w7fFHpInOpdfeBz7rmdUxKLv4zxHTgtt38jzVUGlOnufLtbxc42gtEE
	 r2kwyrowrtdzU2O04tyBL1gcnfCKJqze0CykBXe9GiQF+mz5scbN2YkhQaG8cnNivN0FM
	 ksWD0wnfEZYETEM7s1XW0GxYnOb0dj/pezi/SjgDCVPMqQpgc+TREarySykF8ZG2/Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874865;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ChEGzgU3xU0J0WQ0/TumtbDMAQM01JtXZaOLDqrgf1c=;
	b=ueGXsSMecgoZbHv2p1lh4jUzOc5YHZ5H66u+CUd1sEG5Nxv6PkHJ/pPnydw8Q4on9+xR
	 AKswyNIw3YU89YvD841Zpd3K+ADAjvKi3OnSqvBXokXr6cIF/ex8v4zujwcUHU8hJV6Zf
	 LSptX4AAOnwhQVMilAuDK3BKvgrUHvAaU3n77hXjULTikOuetcsc7YNX0YwLaWPNo9lnj
	 GfNOzhDTTJNiH9bRa49VUSLBwsCnE6lV1MM676mGfFTP7XEl74eyW1almXZQ0PSk8yRUU
	 /rv7FgedPvGNT9B+sYlj1MLr82tup5Y1t38zL+UcHJluQQSclPxCt2ctA8DMqmxo4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9uVCUBS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A45B606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9uVCUBS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D142D1F000C1;
	Thu,  5 Nov 2026 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793874865;
	bh=ChEGzgU3xU0J0WQ0/TumtbDMAQM01JtXZaOLDqrgf1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9uVCUBSWR+vkjcMSO01yKkkRSureB4xdapbYxYdAlSUCVYGpO7C4NfoSR6nkQedn
	 mffSxbqVb6GJCBKkZ0F21GZFY9j8oJHyZUXizQweZY/PerUgjLqmfJ6RNtqqAT+qVr
	 4jm+7mNV12qJi+IJixPrAoThdemACrF8xH2d3WQRIkZ+O8HcE6NzACFQWlga2IVODe
	 aqcInvHurXL2yrMLD4tQzNQQ3R4p0vSnSOaKpDorhUn8ypzXWRXk/KHqKQuKCU2Rry
	 l737OoXb2dmZoQNhJncLgNq8cVslhuHAdE07CChlcDzA+dKR5lmIitpY8UnIHsRWHR
	 egkdZUmtzpPHw==
Message-ID: <sashiko-outbox-198862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105101955.3732723-4-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
 <20261105101955.3732723-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:34:24 +0000
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
- [High] arm64: dts: qcom: root node syntax in monaco-evk-sd-card.dtso drop=
s regulators
- [Medium] arm64: dts: qcom: missing supports-cqe on sdhc_1 in monaco-ac-ev=
k.dts
- [Medium] arm64: dts: qcom: invalid and duplicate OPPs in monaco-evk-sd-ca=
rd.dtso
--

commit 55ce3aa0fb14b29f7953daf1505d7c18f0d799da
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

This series moves the eMMC supports-cqe property from the Monaco SoC device
tree to the board level and switches Monaco EVK SDHCI storage selection bet=
ween
SD card and eMMC to device tree overlays.

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
> +
> +&sdhc_1 {
> +	vmmc-supply =3D <&vmmc_sdc>;
> +	vqmmc-supply =3D <&vreg_sdc>;

[Severity: High]
Should the root node in monaco-evk-sd-card.dtso use &{/} { ... }; instead of
/ { ... };?

In a /plugin/; device tree overlay, defining nodes under / { ... }; places
regulator-mmc-sdc and regulator-sdc directly under the root of the compiled
.dtbo rather than wrapping them in a fragment node with an __overlay__ chil=
d.

When fdt_overlay_apply() -> overlay_merge() in scripts/dtc/libfdt/fdt_overl=
ay.c
(or init_overlay_changeset() in drivers/of/overlay.c) merges the overlay:

	fdt_for_each_subnode(fragment, fdto, 0) {
		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
		if (overlay =3D=3D -FDT_ERR_NOTFOUND)
			continue;

both regulator nodes are skipped and omitted from the merged DTB, while
vmmc-supply and vqmmc-supply in sdhc_1 are left pointing at phandles that do
not exist in the merged tree. When sdhci_msm_probe() -> sdhci_setup_host() =
->
mmc_regulator_get_supply() runs, resolving both supplies fails with -ENODEV.

[ ... ]

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

[Severity: Medium]
Is this override of sdhc1_opp_table intended for sdhc_1 on Monaco?

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

And in drivers/clk/qcom/gcc-qcs8300.c, ftbl_gcc_sdcc1_apps_clk_src supports
50 MHz, 100 MHz, 192 MHz, and 384 MHz, with no 202 MHz entry.

Because overlay_apply_node() merges new subnodes without removing existing
ones, applying monaco-evk-sd-card.dtso leaves opp-200000000 and opp-3840000=
00
in sdhc1_opp_table alongside the new opp-202000000 node, while also lowering
the 100 MHz required-opps vote from rpmhpd_opp_svs to rpmhpd_opp_low_svs.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 35fbee63d4c65..591ad233f90eb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4843,7 +4843,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config =3D <0x000f64ee>;
>  			qcom,ddr-config =3D <0x80040868>;
>  			bus-width =3D <8>;
> -			supports-cqe;
>  			dma-coherent;

[Severity: Medium]
Should arch/arm64/boot/dts/qcom/monaco-ac-evk.dts also have supports-cqe ad=
ded
to &sdhc_1?

monaco-ac-evk.dts includes monaco.dtsi and enables sdhc_1 for non-removable
eMMC:

&sdhc_1 {
	vmmc-supply =3D <&vreg_l8a>;
	vqmmc-supply =3D <&vreg_s2s>;

	no-sd;
	no-sdio;
	non-removable;

	status =3D "okay";
};

In drivers/mmc/host/sdhci-msm.c, sdhci_msm_probe() checks for supports-cqe:

	if (of_property_read_bool(node, "supports-cqe"))
		ret =3D sdhci_msm_cqe_add_host(host, pdev);
	else
		ret =3D sdhci_add_host(host);

Removing supports-cqe from monaco.dtsi without adding it to monaco-ac-evk.d=
ts
causes sdhci_msm_probe() to skip sdhci_msm_cqe_add_host() (and
sdhci_msm_ice_init() called from within it), disabling CQE and ICE on
Monaco-AC EVK.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105101955.3732=
723-1-monish.chunara@oss.qualcomm.com?part=3D3

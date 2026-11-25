Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595805;
	b=Xqem0RF6m4FjIM1gYYV+UpDV3CZkDnoxsVJMTFokKXRB6X0MEXEjogOD5oP9glF7B99M
	 7B4TXizBmr464C6DenuR4IlxvTL1pxJ7My5HGX+L4WCrrOYsiyI0BnM1Q3GrWkzZcBnVM
	 KDFn3E+LuyNRHYnzgyYeD0B9N9IUCuVfKNmPdaTuoF3X4wbZaNoOQpmQqKxF7wcL3DdGA
	 ZkhwiQn0JcM7wW7mQDHtuy8KguMwDI5GUnVL1Ea8YtDzeY8rIbwzEkTa94ccuX5zI3irV
	 XkqQNR1gYi8oS5aIQrGqsRNiELs5zFfeyQleLbqwhZjK2bFK7dEYSY5XQL7dGzNEO0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2DVHLYVPoozXtWqY5yQquYMdjPPCiVhFcXI6C/fxk7M=;
	b=swIwncUdyBZufuwMuPGtsHvK2SmBuIfU6jb1WFjgNYS7pkIpHg7E1i0erkh6jApJ18be
	 J49UUzB9s3SvB6eAAGFUw++DtJa1XMUas8fVePhioDAbrZZVO7/JebP+WkV5EEtISK5gs
	 vOyJnqzeEXBnbic6bF91fhTu73A/3XZn3bhEtibZY5mqpTGYyiQRfk3KQQn18e2qA8Rgv
	 Cs5Jk8BG1AHScuCzuX2f/QZNsmis8QeJBZqh7S91BFJzy21gRpC51mSJA2GWSM9HsaTsX
	 2EcqRiU9/J/TMP2Bpsb8olYe0LZvUYbi8iWE4bAPEi0rezIJvvNSOb0+5c5KXN33IqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONDulkOd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154BC606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONDulkOd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632BE1F000D0;
	Wed, 25 Nov 2026 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595804;
	bh=2DVHLYVPoozXtWqY5yQquYMdjPPCiVhFcXI6C/fxk7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ONDulkOdNM8IfdEieJHWIU0fj7RBtOswANBTnMZKIuhiK7TtBB3OYSQRhYdjidgI1
	 g1H7x/g1NdG5grdzGrtE3qrRBIbVMc1x8cdIVf0Tp+HlLAjusIuKYwNLAh+k29aaGK
	 7Qh59I5WChtT3zFgES5j8m+esQ5PsToK611R9dCHfyX+44vqqkoLQKypAZC5a2hDze
	 qLxIpfmoYSxxikR2nAEfhGnEIyRxqLf1eLORe6SKVdb71XrHYDOooVGbRTOi5cnYBU
	 jYtzwhYrXUWkhcx5jnlFNMFGVz6sGXlTQC1kPrMmOa8i49umIinfiNauWy7/G0CCa1
	 SfpVnnDqOClBw==
Message-ID: <sashiko-outbox-232916@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 3/3] arm64: dts: qcom: lemans-evk: Add SDHCI support
 for eMMC via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125082055.488583-4-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
 <20261125082055.488583-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:36:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: qcom: lemans-evk-emmc: broken overlay root and
  dummy regulators
- [Low] arm64: dts: qcom: lemans-evk-emmc: drive-strength on input-only
  sdc1_rclk
- [Low] arm64: dts: qcom: lemans-evk-emmc: unused header includes and
  style issues
--

commit 0884fd1ba1dd2afefa178620baee944918f3c9b0
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

This commit adds a devicetree overlay to enable the SDHCI controller for
eMMC on the lemans EVK board and wires it into the build.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/b=
oot/dts/qcom/lemans-evk-emmc.dtso
> new file mode 100644
> index 0000000000000..52739d39a1ff8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-gcc.h>

[Severity: Low]
This isn't a bug, but none of these three dt-bindings headers are used in
this file.  Also, qcom,dll-config below uses uppercase hex digits instead
of lowercase <0x000f64ec>, and the subnodes under &tlmm are indented with
spaces rather than tabs.

> +
> +/ {
> +	vmmc_sdc1: regulator-l8c {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg-sdc1";
> +
> +		regulator-min-microvolt =3D <2960000>;
> +		regulator-max-microvolt =3D <2960000>;
> +	};
> +
> +	vqmmc_sdc1: regulator-s4a {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vqmmc-sdc1";
> +
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};
> +};
> +
> +&sdhc {
> +	vmmc-supply =3D <&vmmc_sdc1>;
> +	vqmmc-supply =3D <&vqmmc_sdc1>;

[Severity: High]
Does using / { ... }; in a /plugin/; overlay cause fdtoverlay to drop
regulator-l8c and regulator-s4a, and shouldn't &sdhc reference the
existing RPMH regulators &vreg_l8c and &vreg_s4a from lemans-evk.dts
instead?

In a /plugin/; overlay, dtc only wraps nodes targeted via a reference such
as &{/} in a fragment@N/__overlay__ node.  Nodes placed under / { ... };
sit at the root of the .dtbo without an __overlay__ child, so fdtoverlay
skips them when building lemans-evk-emmc.dtb and leaves vmmc-supply and
vqmmc-supply with dangling phandles (and runtime overlay application via
of_overlay_fdt_apply() fails with -ENODEV).  In addition, lemans-evk.dts
already defines the real RPMH PMIC regulators vreg_l8c and vreg_s4a under
&apps_rsc; defining dummy regulator-fixed nodes prevents sdhci_msm from
voting for or controlling the PMIC rails.

[ ... ]

> +&tlmm {
> +        sdc_rclk: sdc1-rclk-state {
> +                pins =3D "sdc1_rclk";
> +                bias-pull-down;
> +        };
> +
> +        sdc_rclk_sleep: sdc1-rclk-sleep-state {
> +                pins =3D "sdc1_rclk";
> +                drive-strength =3D <2>;
> +                bias-bus-hold;
> +        };
> +};

[Severity: Low]
Should drive-strength be removed from sdc_rclk_sleep?

sdc1_rclk is an input-only return clock strobe pin with no hardware
drive-strength field.  In drivers/pinctrl/qcom/pinctrl-sa8775p.c:

drivers/pinctrl/qcom/pinctrl-sa8775p.c:sa8775p_groups[] {
	...
	[150] =3D SDC_QDSD_PINGROUP(sdc1_rclk, 0x199000, 15, 0),
	[151] =3D SDC_QDSD_PINGROUP(sdc1_clk, 0x199000, 13, 6),
	[152] =3D SDC_QDSD_PINGROUP(sdc1_cmd, 0x199000, 11, 3),
	[153] =3D SDC_QDSD_PINGROUP(sdc1_data, 0x199000, 9, 0),
	...
}

Because sdc1_rclk shares control register 0x199000 with the other SDC1
pins and has drv_bit set to 0, configuring drive-strength on sdc1_rclk
writes to bits [2:0] of 0x199000, which is sdc1_data's drive-strength
field.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125082055.4885=
83-1-monish.chunara@oss.qualcomm.com?part=3D3

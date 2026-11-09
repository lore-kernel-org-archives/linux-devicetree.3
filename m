Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263751;
	b=VwD/2vSu3GKMrSJh0aNyVzE7ZFznaEHfHTfBgvMg/ODpBTKyhPEAOBhzCSgf52cLrLW2
	 diPjQL/00PHJ/TnyXQFFafVy3i/5BcxsDkV/kuhni0q/zAsr2O8PLCWeKTuhS2lB+QdcQ
	 yXPGOrtFL9yrZPkWb6PMA6KXi84JXf4CxqTHg7+9sx5R4UHm3kxk4ZuvABptBOoQYUpbE
	 6mJKWqZSVSt4CDCvUNy3VgKoU0ENdHWCKmkZXCd2c6hmp3yCtdy8yrDzHTlnRndytKoY/
	 8RYUvTbAIWJOuKz5r5wQ8x2BaiHwlsdbPThPheJyJuSRv+xuVsGTquBt78GhxXBHDOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u9kY5SU/V/y7galyyn1jjwxh0h0xXVYrEr8lS2/uzh8=;
	b=cEh7X/fJS6niFn5T0lc5vJlspNr1v5fFwMNA1zDUSMd9KBxCH5BiWuJESRZmOZrUy3cQ
	 a/C4/RJo26foate9zvsdGLGIR0phFBl/FD8U5AZAJuVOEH4MdnFHn17YfYd0d+vNAZA2f
	 whhiyJ13FCpMqk4yF3uqAmXRPY/Jx3uICFGqTsogWqtEnngLMK2DfANLzbtpgvqu0rWI7
	 ZSeLq4r7hd42VwkhXLsSpaaAIi6a1B0t3UcxR37xj2vmBtfmyYWT9OBzPw/v8z3kB68gm
	 lKTuKMqiLglnkuP1DlRhBAevNjuOd03M2VxwD58xIVutI6KuA3sm93o8Uc0BR5l9Ajg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQ1jEuJv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C2606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQ1jEuJv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74E71F008A5;
	Mon,  9 Nov 2026 22:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263751;
	bh=u9kY5SU/V/y7galyyn1jjwxh0h0xXVYrEr8lS2/uzh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQ1jEuJvci+3jUfu8amgSSKHNY8gZ0Fz3RUzFO8+OD/Ea8mOLSpxv5JLlLgj+Zlok
	 a3QFVoUDY2vw9MV53saGgRK0vTwP2eTHWoE6pW8GbwWib21hyl1Dd5p8tKfP6KS9/z
	 NyUufNmMjIHDw3F4a+3cMrfAfrst0UlWYoRlxXK4YOXvtps2xp8ve5Q+cCdYOFc6Cs
	 vOPTJYVwXiDdEyIfCbwgRcOG0D+wYVOX/wz8NErAgcxeOFQvI4wDhlUUsjXBL7y1hp
	 O1iUX1i/TdT8h4HHulOZMG/wrif8VzvY7B3AeRsFMtoybJb14kECzBMT9Ina1x0Yjp
	 zJ1MgyEhUwzJQ==
Message-ID: <sashiko-outbox-205755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm6115: Add Motorola Moto G9
 Power (cebu)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109221453.658316-7-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-7-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:35:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] arm64: dts: qcom: undefined vreg_l9a phandle breaks
  cebu-tianma.dtb build
- [Medium] arm64: dts: qcom: sm6115-motorola-cebu-tianma leaves mdss
  enabled
- [Medium] arm64: dts: qcom: missing pinctrl-0 on uart3 breaks
  pinctrl_dt_to_map()
- [Medium] arm64: dts: qcom: unbound pmi632_lcdb regulator causes panel
  EPROBE_DEFER
- [Low] arm64: dts: qcom: unit_address_vs_reg warning on
  framebuffer@5c000000
--

commit 0fc3db560c7afce7509df398d557194333dec028
Author: Val Packett <val@packett.cool>

arm64: dts: qcom: sm6115: Add Motorola Moto G9 Power (cebu)

This commit adds the shared cebu devicetree include and a board devicetree =
for
the Motorola Moto G9 Power with the Tianma display panel.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts b/a=
rch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts
> new file mode 100644
> index 0000000000000..31ca51570ea20
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts
> @@ -0,0 +1,18 @@
[ ... ]
> +&dispcc {
> +	/* Preserve the bootloader display until the native panel is supported =
*/
> +	status =3D "disabled";
> +};

[Severity: Medium]
Should &mdss, &mdss_dsi0 and &mdss_dsi0_phy also be disabled here?

sm6115-motorola-common.dtsi enables those nodes, and &mdss requires
power-domains =3D <&dispcc MDSS_GDSC> as well as clocks and resets from
&dispcc.  Leaving &mdss enabled while &dispcc is disabled keeps &mdss in
deferred probe and blocks sync_state on its active suppliers (gcc,
apps_smmu, mmrt_virt, bimc and config_noc) until deferred_probe_timeout
expires.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi b/arch/ar=
m64/boot/dts/qcom/sm6115-motorola-cebu.dtsi
> new file mode 100644
> index 0000000000000..6f5263a67319f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026, Val Packett <val@packett.cool>
> + */
> +
> +#include "sm6115.dtsi"
> +#include "sm6115-motorola-common.dtsi"

[Severity: Medium]
Does &uart3 in sm6115-motorola-common.dtsi need a pinctrl-0 property?

&uart3 sets pinctrl-names =3D "default", "sleep" and pinctrl-1 =3D
<&qup_uart3_sleep>, and the base uart3 node in sm6115.dtsi defines no
pinctrl-0.  When uart3 probes, pinctrl_dt_to_map() fails with -ENODEV on
state 0 when pinctrl-0 is missing, so neither the default pin state nor
qup_uart3_sleep is applied and dtbs_check fails.

[Severity: Medium]
Can panel@0 in sm6115-motorola-common.dtsi ever resolve avdd-supply =3D
<&pmi632_lcdb_ldo> and avee-supply =3D <&pmi632_lcdb_ncp>?

Commit "arm64: dts: qcom: pmi632: Add LCDB regulator node" adds
pmi632_lcdb: regulator@ec00 with compatible =3D "qcom,pmi632-lcdb",
"qcom,pm8150l-lcdb", which has no in-tree driver or binding schema.
This fails dtbs_check against qcom,spmi-pmic.yaml on sm6115-motorola-cebu-t=
ianma.dtb,
and once the panel is enabled (as on sm6115-motorola-guamp-holitech.dtb),
of_regulator_dev_lookup() finds the DT node with no registered regulator
device and returns -EPROBE_DEFER permanently.

> +
> +&framebuffer0 {
> +	height =3D <1640>;
> +};

[Severity: High]
Does building sm6115-motorola-cebu-tianma.dtb fail with an undefined
phandle reference on framebuffer0?

In sm6115-motorola-common.dtsi, framebuffer0 sets vddio-supply =3D
<&vreg_l9a>, whereas the PM6125 LDO9 node in that file is labeled
pm6125_l9a:

arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi:
		framebuffer0: framebuffer@5c000000 {
    ...
			vddio-supply =3D <&vreg_l9a>;
		};

dtc aborts compilation with:
ERROR (phandle_references): /chosen/framebuffer@5c000000: Reference to non-=
existent node or label "vreg_l9a"

[Severity: Low]
In addition, framebuffer0 in sm6115-motorola-common.dtsi is named
framebuffer@5c000000 but uses memory-region =3D <&cont_splash_memory>
without a reg property, which triggers dtc unit_address_vs_reg and
avoid_unnecessary_addr_size warnings under W=3D1 / dtbs_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109221453.6583=
16-1-val@packett.cool?part=3D6

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263371;
	b=DIqj/ggTRm7BXnaFFoq/gd4YZZXCbm9L1hKMMmtA7Tuq/bPEHaxyRu2kXJHfEEA5JR7e
	 RTKkRKvrWy/LQRv0zDyuC1ifFAOQ6l0Mb4yoFwdtVRBD3cpY0sZtAJsEakqM07m48zP1u
	 0MZvkP6ka9T6VHNgmalcjcSHJ71qN2cKCgYSpQBB6zp/L3eV52CRl9K/Ud3MBBLfX919r
	 LFcu0l4JNVA7+x9vxo7++tSQx62Cf7E4Ilt2t37ocz4CiDjxQcTnDBM41f/vw0sYsRFRd
	 AB7QTm4QjRfjJFJWks2hpRrqd4qYIjP1uhrY88BqYUB0IbU3nHbgJ1N/Fp1XG13FB0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263371;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wdNdzweauHnCyuCPLvZqpD5/md1eWIDhAhNORE0CaEQ=;
	b=ha7s5JfnI4s+XrN3Jqe/A28gs6IZvgarhkvbAuWeL6EtmXJL9QVpKgatbQstcHJP1Pop
	 jY7BlteFmmzWbIxJauOiCz9nbFl5ToDzDlDJd7WbNvAC+GQyM191Q6jA2jrcHGUP3Ng6Y
	 U1x37/chBoEAcmyqRxgs2OKaH3iSyMYIFssXgSvu9STYJh7XD22TH7Yl0qNJ0eJIJk7pv
	 iXpruCI1IJqIwaZTrTTcjqnnTTtrxdXkYMSJZGj/C9pulyRR/BdoFamQ8iwVaYdz+tOwZ
	 v9xYJ1GYoDUpHOZjlIyIMLqaNYFSBwT8l57cjxYo4zg5CjVKLhDYcRZHNxYkdd9VFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdMNpWcR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA54606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdMNpWcR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBEB1F0089F;
	Mon,  9 Nov 2026 22:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263370;
	bh=wdNdzweauHnCyuCPLvZqpD5/md1eWIDhAhNORE0CaEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdMNpWcRm5di0P9QgbkBeI2EszlxfmtY5kA6JqklaDIx1wjTcAGWI8l+sTNA7sCa0
	 AKpislZ9RPNy8sphhahKH/mjVrMhFKLJkfcL0A2hXBPvUeKSfvvJzF6P6ipoNOxSS+
	 bXJp9ltKd8ZgHqVL42csgUqrLtnjpO1/azR/Oe+jDsPukFvEZctLY7xwVU8qzKFYIf
	 9uFRdv6dUAG1PDC7jHXURuQz8Fe1f5jlf1uvZ/yxYKPp+RLNoUvm4OdGgpXqfEf4Fn
	 zTYTsQTevFI9D36VGogO4GkdLgWY3z2wjHuG/Tm9M8EpppMmsiaJLTTKTegxt2zUrk
	 Z9la5nL4IxKmQ==
Message-ID: <sashiko-outbox-205742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6115: Add Motorola Moto G9 Play
 (guamp)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109221453.658316-6-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-6-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:29:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] arm64: dts: qcom: unresolved vreg_l9a phandle breaks guamp DTB
  build
- [High] arm64: dts: qcom: driverless pmi632_lcdb supplies cause panel
  probe deferral
- [High] arm64: dts: qcom: inverted GPIO_ACTIVE_LOW on panel
  enable-gpios
- [Low] arm64: dts: qcom: disallowed input-enable in pm8008_int_default
  TLMM state
- [Low] arm64: dts: qcom: framebuffer@5c000000 unit address without reg
  triggers warning
- [Low] arm64: dts: qcom: sm6115-motorola-guamp-holitech.dtb out of
  alphabetical order
--

commit 08d84af13406d856c30eb5d4421fb4af1a196c93
Author: Val Packett <val@packett.cool>

arm64: dts: qcom: sm6115: Add Motorola Moto G9 Play (guamp)

This commit adds device tree files for the Motorola Moto G9 Play (guamp)
with the Holitech HX83102 display panel and enables building its DTB in
the Qualcomm arm64 Makefile.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 88230c4e00ea9..8792a9a0e9e00 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -387,6 +387,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D sm4250-oneplus-billie2.d=
tb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6115-fxtec-pro1x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6115-xiaomi-lemon.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6115-motorola-guamp-holitech.dtb

[Severity: Low]
This isn't a bug, but sm6115-motorola-guamp-holitech.dtb should be placed
before sm6115-xiaomi-lemon.dtb to keep the list in alphabetical order.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts =
b/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts
> new file mode 100644
> index 0000000000000..f8e1f9de7e998
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026, Val Packett <val@packett.cool>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm6115-motorola-guamp.dtsi"
> +
> +/ {
> +	model =3D "Motorola Moto G9 Play (Holitech)";
> +	compatible =3D "motorola,guamp-holitech", "motorola,guamp", "qcom,sm611=
5";
> +};
> +
> +&panel {
> +	compatible =3D "holitech,htf065h045", "himax,hx83102";
> +
> +	enable-gpios =3D <&tlmm 82 GPIO_ACTIVE_LOW>;

[Severity: High]
Is GPIO_ACTIVE_LOW inverted for enable-gpios here?

In drivers/gpu/drm/panel/panel-himax-hx83102.c, hx83102_prepare() sets
enable_gpio to logical 1 to release reset before running ctx->desc->init()
and hx83102_unprepare() sets it to logical 0 before disabling regulators.
With GPIO_ACTIVE_LOW, gpiolib inverts those levels, so gpio82 is driven
physically low while DSI initialization commands are sent and while the
panel is active, and driven physically high when powered off (which also
conflicts with bias-pull-down on gpio82 in mdss_dsi_sleep).

> +	pp1800-supply =3D <&pm6125_l9a>;

[Severity: High]
Does building sm6115-motorola-guamp-holitech.dtb fail in dtc due to an
unresolved vreg_l9a phandle?

In arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi,
/chosen/framebuffer@5c000000 sets vddio-supply =3D <&vreg_l9a>, whereas the
PM6125 L9 regulator node is labeled pm6125_l9a as used here.

> +
> +	status =3D "okay";
> +};
> +
> +&pmi632_lcdb {
> +	status =3D "okay";
> +};

[Severity: High]
Will enabling pmi632_lcdb cause the panel driver to defer probe
indefinitely?

In arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi, &panel sets
avdd-supply =3D <&pmi632_lcdb_ldo> and avee-supply =3D <&pmi632_lcdb_ncp>.
However, pmi632_lcdb (compatible =3D "qcom,pmi632-lcdb",
"qcom,pm8150l-lcdb") has no driver or devicetree binding in the tree, so
no regulator_dev is registered for those child nodes.  When
hx83102_panel_add() calls devm_regulator_get() for "avdd" and "avee",
of_regulator_dev_lookup() returns -EPROBE_DEFER and the display panel
never probes (and dtbs_check fails on regulator@ec00).

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi b/arch/a=
rm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi
> new file mode 100644
> index 0000000000000..7eba684867fb1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026, Val Packett <val@packett.cool>
> + */
> +
> +#include "sm6115.dtsi"
> +#include "sm6115-motorola-common.dtsi"

[Severity: Low]
Does /chosen/framebuffer@5c000000 in sm6115-motorola-common.dtsi trigger a
dtc unit_address_vs_reg warning when building this DTB?  That node has a
@5c000000 unit address, but uses memory-region =3D <&cont_splash_memory>
without a reg or ranges property.

[ ... ]

> +&tlmm {
> +	pm8008_int_default: pm8008-int-default-state {
> +		pins =3D "gpio25";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		input-enable;
> +	};

[Severity: Low]
Does input-enable here cause dtbs_check to fail?
Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml sets
input-enable: false for Qualcomm TLMM pin states, and pinctrl-msm ignores
PIN_CONFIG_INPUT_ENABLE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109221453.6583=
16-1-val@packett.cool?part=3D5

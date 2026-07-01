Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B536A373
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924696; cv=none; b=qedE6rrOeYz5Rg0ZGWKwoVSZmSu0O88yKTkXX5h7pVHwzWrQQBIQ6dbybdL58PaSRI1ohyVz7qcBEJLP7r1FtK2aD2O3bUitA/Xp5HvyDMPYuobdR4OxSJGp7Y/46+b5TBwGamSDANgBvd9tsxyT1awABji6K5Amu96O5vB+aA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924696; c=relaxed/simple;
	bh=XtiIjruXC2imFc7kTKZ7uimPxGt6+ijA2Wwy59PorQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dB7cPO2sMYXxpbSDtlVlt5C3vGLs4kZOkM8R0V8ttXsqTwE+nPPdGYL+thYgCLo6QDB78cb6rm3CGrG/05LmfvX4m4Jgz6G6bXVj92VW5PbiCGwScG1z++u+Xo9s3aMMHjW/F/vV8+gmA/umEbtak5ejwMZW6+G8OhUIJGHkgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3Bsn3hO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3Bsn3hO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3B71F000E9;
	Wed,  1 Jul 2026 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924695;
	bh=I4eYxMbcWuw2wcR7jEmgF+Ho1P2g/7By1fVq5wL8Rlw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d3Bsn3hO/BwcfS5subfMgz78cbyigF3VM4LZQGw5Eas8kXaMxdVGi1FCPI/AHUeBB
	 ljTfxtHRJylFlgA4kQrdpBX2PJnKqhhhBzuUb9TZ/+Zbbrk6yKhOkaETEIaEhArzQa
	 A+eQ5PxftptjyFbkkcA+MEnCOjd5QYBhNuElf8o23CG+m7W3gJeGXN/miC403hgG+8
	 oGJTh/5mfNibJPHlM2JXl4rSD7kkfaYfOExUh3DcxigJC21eEh7tOwtCj1PDDDVHWL
	 +FKrEqZ4ivbH6X4Pec/gKTGMnNr99p/ZK4v/AqiJUh+3mX30mhd3/MvWve25qLlNzo
	 LBZviVyqJZRxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: add Genio 720-EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
 <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 16:51:33 +0000
Message-Id: <20260701165134.9A3B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect active-high polarity for SD card detect (CD) GPIO.
- [High] Off-by-one register size definition causes unaligned MMIO mapping.
- [Low] Missing device tree files and binding headers cause a hard build fa=
ilure.
- [Low] Invalid PMIC phandles due to copy-paste error.
--

commit 8e95b232dabd4f3ff024fd10c08b98d6371a52be
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

arm64: dts: mediatek: add Genio 720-EVK board

Add support for MediaTek MT8189 SoC, its variant MT8391, and a devicetree
for the basic hardware enablement of the Genio 720-EVK board.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8189.dtsi
> new file mode 100644
> index 0000000000000..272b1b34c9537
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
> @@ -0,0 +1,920 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <dt-bindings/clock/mediatek,mt8189-clk.h>

[Severity: Low]
Are these headers present in the tree? It looks like mt8189-clk.h,
mt6365.dtsi, and mt8189-pinfunc.h might be missing from this patch
series, which would cause a build failure.

> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/power/mediatek,mt8189-power.h>
> +#include <dt-bindings/phy/phy.h>

[ ... ]

> +		pwrap: pwrap@1cc04000 {
> +			compatible =3D "mediatek,mt8189-pwrap", "mediatek,mt8195-pwrap", "sys=
con";
> +			reg =3D <0 0x1cc04000 0 0x1000>;
> +			reg-names =3D "pwrap";
> +			assigned-clocks =3D <&vlpckgen CLK_VLP_CK_PWRAP_ULPOSC_SEL>;
> +			assigned-clock-parents =3D <&topckgen CLK_TOP_OSC_D10>;
> +			clocks =3D  <&vlpcfg CLK_VLPCFG_REG_PMIF_SPMI_M_SYS>,
> +				  <&vlpcfg CLK_VLPCFG_REG_PMIF_SPMI_M_TMR>;
> +			clock-names =3D "spi", "wrap";
> +			interrupts =3D <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
> +		spmi: spmi@1cc06000 {
> +			compatible =3D "mediatek,mt8189-spmi", "mediatek,mt8195-spmi";
> +			reg =3D <0 0x1cc06000 0 0x0008ff>, <0 0x1cc00000 0 0x000100>;

[Severity: High]
Does the first register size 0x8ff cause an unaligned MMIO mapping?

A size of 0x8ff (2303 bytes) isn't a multiple of 4, so the mapping will
terminate exactly before the last byte of a 32-bit register at offset 0x8fc.
Accessing that register might cause a memory fault.

Should this size be 0x900 instead?

> +			reg-names =3D "pmif", "spmimst";
> +			clocks =3D <&vlpcfg CLK_VLPCFG_REG_PMIF_SPMI_P_SYS>,
> +				 <&vlpcfg CLK_VLPCFG_REG_PMIF_SPMI_P_TMR>,
> +				 <&vlpckgen CLK_VLP_CK_SPMI_P_MST_SEL>;
> +			clock-names =3D "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +		};

[ ... ]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> new file mode 100644
> index 0000000000000..fbb202e344746
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> @@ -0,0 +1,673 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include "mt6365.dtsi"

[Severity: Low]
This is related to the previous header issue, but just checking if
mt6365.dtsi and mt8189-pinfunc.h were accidentally omitted from this
patch series?

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +#include "mt8189-pinfunc.h"

[ ... ]

> +&auxadc {
> +	status =3D "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&mt6359_vmodem_buck_reg>;
> +};

[Severity: Low]
Does this reference an undefined label?

The board configuration includes mt6365.dtsi, but this uses an mt6359
prefix. This might cause a dtc compilation error due to undefined
phandles.

> +
> +&cpu1 {
> +	cpu-supply =3D <&mt6359_vmodem_buck_reg>;
> +};

[ ... ]

> +&mmc1 {
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	cd-gpios =3D <&pio 2 GPIO_ACTIVE_HIGH>;

[Severity: High]
Is the SD card detect polarity inverted here?

The pinctrl node mmc1_default_pins configures this pin with a
bias-pull-up, meaning the pin defaults high when empty and is pulled
low on card insertion.

Should this be configured as GPIO_ACTIVE_LOW instead to prevent the
system from constantly seeing a card when empty?

> +	max-frequency =3D <200000000>;
> +	no-mmc;
> +	no-sdio;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	pinctrl-names =3D "default", "state_uhs";
> +	pinctrl-0 =3D <&mmc1_default_pins>;
> +	pinctrl-1 =3D <&mmc1_uhs_pins>;
> +	vmmc-supply =3D <&mt6359_vpa_buck_reg>;
> +	vqmmc-supply =3D <&mt6359_vsim1_ldo_reg>;
> +	status =3D "okay";
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-add-mediat=
ek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com?part=3D3

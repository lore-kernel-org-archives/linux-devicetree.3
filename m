Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353840;
	b=Jo1DbCKlEAJVK0aGr0DIgweohjbh9fJEHmLF5xxEX+n3Kv+M1Zilnd087F6GBIQznX6Q
	 24jre5MPz634RNiJHXBWy973WWAntaQ5xC55EiYkt3fkx/E7qdkyiZQVUskP/D+iIP2Ua
	 gjzxLlDCzMfUWQenbbf5TPp5/owHJs3D1i2HVwUlWzbbpgDuCVZ4V6tTru/uHOdf7Gwwv
	 qj+8TlJOBN9g+Gi1Ab/VrZGYJ6wpdTXgYfT2ul5oweokFAJ7PyD/vnsU5EgrZDzYykG/G
	 VmqaS8yjPg7J6bwKytJPBeI16clx6v6Dou6y1ZNGsybZEf/Mss6mpPbcbDxjUY9kmyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/AeIL6FRt8PYe36Iq8/+KIDuWRsAKaXAWfgqEtFwC1A=;
	b=UZuYpacsLh+joPDqBmuVNMpIdnPTzPpugVbClhQmUHQtZMiQYiOI8r6g1on22nwhBaQG
	 9McU03c3BYFvg1f6Kb8GDOBj1/IajS+LfFmGxjrTR+sZgUzX24XevJrisjWk7YAh5wCff
	 EnU0LpiT+gymMr26MWsOCv8pmgtnC6/oYYnOQsJiVrYSIoK5xdXKSSHCDXJpIYeRY9ssZ
	 WnsNs16bdqRRPnALmFBi5L8qdgAwKAcws8p8d/2jK2y6ZTCNMpjuJVUH25td9sM2R5Yoe
	 71zxEPy9/VE2UkuXTKAw6V8HVhUFNFG5Eu6h3GQSnkZXSgjLSA9WFuBZBE1g6bIuwRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hg9oD75B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83511606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hg9oD75B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E372A1F000C1;
	Fri, 30 Oct 2026 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793353840;
	bh=/AeIL6FRt8PYe36Iq8/+KIDuWRsAKaXAWfgqEtFwC1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hg9oD75B4IE1Gwv7objIVpDuKYYxnIA52lCCPh8fDAX+MsFXuh0JJnmz8qj1OxkFv
	 CL9wI1frK3YJiw16wcqy/t86pPGz1wmD/FTnkpG8Ray+IIEHE7G4CoqXMRknSyLoml
	 FpyP9l98GvdzpJnFkWMQ4UvBvoi9b9TuBq5TVL85hCcpsoBW3t++4mytgjmRPFbymg
	 I7sfod0495eOMb4Grm6876hjnVJsAKOHggls7/bhb2mLtvylMTNAA/6O4YCJ1x5WPV
	 qkz0koqc991sOldNGdVsQiEUuKuLcehl4lnVHlnR07SIcvfngBzPJjVNESBnOPYM+C
	 sLDCB7GnWsjpg==
Message-ID: <sashiko-outbox-190778@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO
 G133HAN01 LVDS panel overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Tiwari" <anand.tiwari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
 <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 09:50:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: talos-lyra-evk-lvds: clk-pwm on GCC_GP3 fails wi=
th -EINVAL
--

commit c54a5c6f3e0408807da76cadc10d556338f09c09
Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

This commit adds a DT overlay for the Qualcomm Talos Lyra EVK to support the
AUO G133HAN01 LVDS panel connected via a TI SN65DSI84 DSI-to-LVDS bridge on
I2C5, with backlight control using clk-pwm on GCC_GP3.

> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.d=
tso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
> new file mode 100644
> index 0000000000000..8c592e6317c30
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&{/} {
> +	bklt_pwm: pwm {
> +		compatible =3D "clk-pwm";
> +		#pwm-cells =3D <2>;
> +		assigned-clock-parents =3D <&rpmhcc RPMH_CXO_CLK>;
> +		assigned-clocks =3D <&gcc GCC_GP3_CLK_SRC>;
> +		clocks =3D <&gcc GCC_GP3_CLK>;
> +		pinctrl-0 =3D <&bklt_pwm_default>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&bklt_pwm 0 100000>;
> +		power-supply =3D <&vreg_disp_3p3>;
> +		enable-gpios =3D <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +		brightness-levels =3D <0 255>;
> +		num-interpolated-steps =3D <255>;
> +		default-brightness-level =3D <128>;
> +	};

[Severity: High]
Will clk-pwm work with GCC_GP3_CLK here, or will pwm_clk_apply() fail with
-EINVAL?

When backlight requests a 100000 ns period (10 kHz),
pwm_backlight_update_status() -> pwm_apply_might_sleep() -> __pwm_apply() ->
pwm_clk_apply() runs:

drivers/pwm/pwm-clk.c:pwm_clk_apply() {
	...
	rate =3D DIV64_U64_ROUND_UP(NSEC_PER_SEC, period);
	ret =3D clk_set_rate(pcchip->clk, rate);
	if (ret)
		return ret;

	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
		duty_cycle =3D period - duty_cycle;

	return clk_set_duty_cycle(pcchip->clk, duty_cycle, period);
}

In drivers/clk/qcom/gcc-qcs615.c, gcc_gp3_clk propagates rate changes to
gcc_gp3_clk_src, which uses clk_rcg2_ops with ftbl_gcc_gp1_clk_src rather
than clk_rcg2_gp_ops:

static const struct freq_tbl ftbl_gcc_gp1_clk_src[] =3D {
	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
	{ }
};

Because all entries in ftbl_gcc_gp1_clk_src have m =3D 0 and n =3D 0, calli=
ng
clk_set_rate(pcchip->clk, 10000) rounds 10 kHz up to the 25 MHz entry,
switches the parent away from RPMH_CXO_CLK to P_GPLL0_OUT_AUX2_DIV, and lea=
ves
the MND divider in bypass mode (CFG_MODE_MASK =3D=3D 0).

Immediately after that, clk_set_duty_cycle() calls clk_rcg2_set_duty_cycle()
in drivers/clk/qcom/clk-rcg2.c:

	/* Duty-cycle cannot be modified if MND divider is in bypass mode. */
	if (!(cfg & CFG_MODE_MASK))
		return -EINVAL;

Doesn't this cause every brightness update to fail with -EINVAL while leavi=
ng
an unmodulated 25 MHz clock on gpio59 (and leaking clk_enable() references =
in
pwm_clk_apply() when __pwm_apply() fails before setting pwm->state.enabled)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-lyra-displ=
ay-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=3D6

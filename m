Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870352;
	b=Ziy5GTlz2PzAKSMk2PXsXaWNBN5yFZ7+eGNtWrTrLL7LNbYs5W/WJXB5Fn+EVKwz6+8v
	 W3AbreF2kCzgGw6NGEtuZxJt5cOs7xvRgxjvD+G2E/m0fQw8WrTWX/55/rJKyXkornyzj
	 X/nntDaLUH8BJo3ofXQwpD8qncxxHznAd5LSxN2VjlWlMtMdbu51TDV0IUNnluVzLgY6G
	 3u0PEfEclddh+7DcuDwUjBEC31oidbTXE71ml7DEZhV2BpyRLNtAy1WdV+PDDYXh4BeZM
	 xb1cRA1tM0Mx9BITyAiF7ANTvWA0xjAO3p707ZIhmRSLSHLdNbz7c7tIGEU7GlGPiiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870352;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=isA7S8y39aOXwibZLyJnLNeWm5yvRencouZs9YKdLyo=;
	b=GXBdmmcZcHaPN6eB0zrebMJzOqKN/3pUdErgASqBmAO/uWF3L6l7WRIu0fviK4f+YZ4q
	 tlBAR5UIEzKOvtn/AXLoaCMgApfBMOPOlgcyUQzA8xzhCKtcp5K1PocYRO9Z8dhuRMRFc
	 3yiDA67G46/esb8epy1MbYDB+5gfLmDYZEx3U1n384XZaiUUSt9UyMvEZAiByT9MO0qf1
	 0LXNg3Ds6OaejSgd70c4i1cYaaJICVs1f558a4bMZIG38pHE+IwQVIFVo9Xd+Rh1yQ3fi
	 kxt2UntYmA07KMW7suJ7TWFgKeT8qph4JJcNoDhasQXIsbeRc8pMWbPgaB5hZ0D2BYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5Pr4cRd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC032606A33D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5Pr4cRd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1831F0093A;
	Thu,  5 Nov 2026 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870351;
	bh=isA7S8y39aOXwibZLyJnLNeWm5yvRencouZs9YKdLyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q5Pr4cRd2GKcfQOEvVWJ5dGwrjjrh86O1aO6oO9bh8nLg0mraoKl7+fOvXIZInRoZ
	 MXobxgMxLRqPb+Hkgdlqe3ZlWRLWVX/CWvo1ezqWImBYU5udgATKP/OnL7i6iVeYUP
	 wzoprfExp8bBBNsEYl7VRuJ5taxORO2QyFKHCATwK8kqeFeY+9Yt2ZQGEoRH47RnT6
	 JqXCmi+e3Fz03KC2s+7nI/qAOfQ+Iu6Wmv55sM5AGb7gcbFxVlEp26d0Y6SbLTtLQE
	 D3Au+gcaOp+xxTJNcVp0eYj13MDAfd9gin1L/eVFaHVAtknTPTMVsjKGycw/q53Nls
	 S7Ex75SQC4N0Q==
Message-ID: <sashiko-outbox-198755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-qcb: Add PCIe3a support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com>
References: <20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 09:19:11 +0000
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
- [Medium] arm64: dts: qcom: glymur-qcb: pinctrl output-high glitches PCIe =
slot rails
--

commit 396ad8048cc24879fc2c5466438a8ef1a184d1eb
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

arm64: dts: qcom: glymur-qcb: Add PCIe3a support

This commit adds device tree nodes for the PCIe3a x8 slot on the Glymur QCB
board, including fixed regulators, pinctrl states, and PHY/port power
supplies.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dt=
s/qcom/glymur-qcb.dts
> index 17d8ff3aed23b..741a24454e80d 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> @@ -78,6 +78,48 @@ vreg_nvme: regulator-nvme {
>  		regulator-boot-on;
>  	};
> =20
> +	vreg_pcie_12v: regulator-pcie-12v {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_PCIE_12V";
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +
> +		gpio =3D <&tlmm 26 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&pcie_x8_12v>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	vreg_pcie_3v3: regulator-pcie-3v3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_PCIE_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 135 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&pm_main_3p3_en>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_PCIE_3P3_AUX";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 136 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&pm_aux_3p3_en>;
> +		pinctrl-names =3D "default";
> +	};
> +
>  	vreg_wcn_0p95: regulator-wcn-0p95 {
>  		compatible =3D "regulator-fixed";
> =20

[ ... ]

> @@ -659,6 +749,33 @@ wake-n-pins {
>  		};
>  	};
> =20
> +	pcie_x8_12v: pcie-12v-default-state {
> +		pins =3D "gpio26";
> +		function =3D "gpio";
> +		output-enable;
> +		output-high;
> +		drive-strength =3D <16>;
> +		bias-disable;
> +	};
> +
> +	pm_aux_3p3_en: pcie-aux-3p3-default-state {
> +		pins =3D "gpio136";
> +		function =3D "gpio";
> +		output-enable;
> +		output-high;
> +		drive-strength =3D <16>;
> +		bias-disable;
> +	};
> +
> +	pm_main_3p3_en: pcie-main-3p3-default-state {
> +		pins =3D "gpio135";
> +		function =3D "gpio";
> +		output-enable;
> +		output-high;
> +		drive-strength =3D <16>;
> +		bias-disable;
> +	};

[Severity: Medium]
Does setting output-enable and output-high in pcie_x8_12v, pm_aux_3p3_en, a=
nd
pm_main_3p3_en while omitting regulator-boot-on in vreg_pcie_12v,
vreg_pcie_3v3, and vreg_pcie_3v3_aux cause a power glitch on the PCIe3a slot
rails during regulator probe?

When each regulator-fixed platform device probes, really_probe() calls
pinctrl_bind_pins() -> msm_config_group_set() before
reg_fixed_voltage_probe(). Because pcie_x8_12v, pm_aux_3p3_en, and
pm_main_3p3_en specify output-enable and output-high, msm_config_group_set()
drives gpio26, gpio136, and gpio135 high and turns on the 12V, 3.3V_AUX, and
3.3V rails.

Immediately afterward, reg_fixed_voltage_probe() in drivers/regulator/fixed=
.c
checks config->enabled_at_boot:

	if (config->enabled_at_boot)
		gflags =3D GPIOD_OUT_HIGH;
	else
		gflags =3D GPIOD_OUT_LOW;

Because regulator-boot-on is not set on vreg_pcie_12v, vreg_pcie_3v3, or
vreg_pcie_3v3_aux, reg_fixed_voltage_probe() requests the enable GPIOs with
GPIOD_OUT_LOW, driving gpio26, gpio135, and gpio136 low again and turning o=
ff
the rails until slot_pwrctrl_probe() later enables the supplies for
pcie3a_port0.

Should output-enable and output-high be dropped from pcie_x8_12v,
pm_aux_3p3_en, and pm_main_3p3_en (matching wcn_sw_en and wwan_reg_en in th=
is
file) so the regulator core manages the GPIO direction and level, or should
regulator-boot-on be added to the regulator nodes if these rails are expect=
ed
to remain enabled from boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-pcie3a_x8_=
1105-v1-1-d09aa0601186@oss.qualcomm.com?part=3D1

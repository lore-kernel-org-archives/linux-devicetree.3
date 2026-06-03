Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D519481A83
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500351; cv=none; b=Vt/PgJCWUGjr/Cn5ABlOKwuAcXeh+uAmOi6RiS+owRh4RfBheF4oZsI5sgQEt/QxwoLMsUguBQJ/B4s2Y+ZQZW6sR0t+TCjrWY0Eiu1S3NoN//voE0fdOFps40gXbE6bLrbdEJHor8GD+6xtLxhH1Y5QYARDnE5RuZ7dbAZC4zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500351; c=relaxed/simple;
	bh=WDgPFdgIvvuAzMy4RRJnXdtPMp9gMufrgOvEvrQlbac=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ik7bVavpvK7OlDLeCdbePGObLtrlH4/ceIz9ZBKrXMtwiU2yVU/ZzpU/WfxevkYIbjBmONW+UbMsdBN2Bzu/pjsggLDHDIVHFcbHZDxg9EpiWzygQI62OIPjSUbcNCFAR/an/swTxoB7wGlyAesVDu0RbWrr1qPeoW7yCHor9OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZFgwKJu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZFgwKJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5991F00899;
	Wed,  3 Jun 2026 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500350;
	bh=e8/01dm7/038MgZ4Hq45bxdLezS/4TgS+xlAnfgMPmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZFgwKJuAw+z5fK/zaJNAtxcv3H07DV7j9qvHp28xIGW8473zwhdjeS1LVdJuncFP
	 tGDym4NmweW42U8Ksajfw3OccN9vNrZ5dTKkySsQEJ7ihWsB+/sLgLnM8RJNTnI9tC
	 CvAyRHEpiZBhb1mrIh0uVGGIUog6w1V3t1Np3SKoEHp9LRKnERoaWNRZSixS2R9hLp
	 H+YewCb/e6cPt8KPN7vmb8ru//qdo1jX9c5okK9IbeDGfSHCb+lEwd1kBDA5IaXHrz
	 RM9KStRVUDaI/wSrAAwMTreUdoSAf023rhiNXfBuZlAh/80rEnO1iljYHOyWbfHfAt
	 UW3gwOi2oYn1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:25:48 +0000
Message-Id: <20260603152549.2E5991F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The clock rate calculation logic fails to reject `N` and `M` combi=
nations where `n <=3D 2 * m`, violating the hardware's duty cycle constrain=
t and writing invalid states.
- [High] Invalid pinctrl function configuration for `kodiak.dtsi`. The `gp_=
mn` function is mapped to `gpio35`, but the SoC (SC7280) only supports it o=
n `gpio60`.
- [Medium] `gp_mnd_clk_get_duty_cycle` incorrectly returns the low-phase du=
ty cycle ratio, creating a broken, asymmetric API contract with `gp_mnd_clk=
_set_duty_cycle`.
- [Low] The 'gp_mn' function is not added to the devicetree bindings for th=
e QCS8300, SA8775P, or SC7280 TLMM schemas, which will cause dtbs_check err=
ors.
- [Low] The newly added pinctrl state nodes use underscores in their names =
(`gp_mn_active-state`), violating devicetree node naming conventions.
--

commit 39d6c11fb73944a2319cdb23d2516a67b5ac2e61
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: Add gp_mn pin state for GP M/N clock output
   =20
This commit adds pinctrl states for the GP M/N divider clock output pin
across multiple Qualcomm SoCs. It wires the GP M/N clock controller node
via pinctrl-0 for the kodiak, lemans, and monaco device trees.

>     - kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).

[Severity: High]
The commit message indicates kodiak is an sa8775p board, but kodiak.dtsi is=
 an
sc7280 device tree. Does the sc7280 SoC support the gp_mn function on gpio3=
5,
or is it exclusively available on gpio60? Applying this DT state might caus=
e a
runtime pinmux failure.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615d..1ff9e1598d004 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
>  				function =3D "edp_hot";
>  			};
> =20
> +			gp_mn_active: gp_mn_active-state {

[Severity: Low]
Could this node name be updated to use hyphens instead of underscores to ma=
tch
devicetree naming conventions?

> +				pins =3D "gpio35";
> +				function =3D "gp_mn";

[Severity: Low]
Is the gp_mn function missing from the devicetree binding schemas for the
SC7280 TLMM? This might cause dtbs_check errors.

> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 353a6e6fd3acb..19f8cf4e15482 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -6022,6 +6022,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp_mn_active-state {

[Severity: Low]
Should this node name be updated to use hyphens instead of underscores to m=
atch
devicetree naming conventions?

> +				pins =3D "gpio35";
> +				function =3D "gp_mn";

[Severity: Low]
Might the gp_mn function be missing from the devicetree binding schemas for=
 the
SA8775P TLMM? This could lead to dtbs_check errors.

> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index e4c8466f941bd..ebe5889daa530 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -6433,6 +6433,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp_mn_active-state {

[Severity: Low]
Are underscores permitted in this devicetree node name, or should they be
replaced with hyphens?

> +				pins =3D "gpio32";
> +				function =3D "gp_mn";

[Severity: Low]
Could the gp_mn function also be missing from the QCS8300 TLMM binding sche=
mas?

> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};


[Severity: High]
Are combinations where n <=3D 2 * m properly handled in the clock rate calc=
ulation
logic in gp_mnd_clk_determine_rate()?

drivers/clk/qcom/clk-gp-mnd.c:gp_mnd_clk_determine_rate() {
	...
	/* N =3D 2M + 1 leaves no valid D satisfying M < D < (N - M) */
	if (n =3D=3D 2 * m + 1)
		return -EINVAL;
	...
}

If an invalid rate is not rejected here, gp_mnd_clk_set_rate() calculates
d_val =3D n / 2 and blind-writes it to the hardware, which violates the M <=
 D
hardware requirement:

drivers/clk/qcom/clk-gp-mnd.c:gp_mnd_clk_set_rate() {
	...
	if (n =3D=3D 2 * m + 1)
		return -EINVAL;

	...
	/* Program the closest-to-50% duty cycle. */
	d_val =3D n / 2;
	ret =3D regmap_write(gp->regmap, GP_MND_DUTY_REG, d_val);
	...
}


[Severity: Medium]
Will gp_mnd_clk_get_duty_cycle() incorrectly return the low-phase duty cycle
ratio instead of the high-phase ratio?

drivers/clk/qcom/clk-gp-mnd.c:gp_mnd_clk_get_duty_cycle() {
	...
	duty->num =3D d_val;
	duty->den =3D gp->n_val;

	return 0;
}

In gp_mnd_clk_set_duty_cycle(), duty->num is treated as the high-phase ratio
and the low-phase cycle count (d_val) is computed using duty->den - duty->n=
um.
By returning d_val directly as duty->num in gp_mnd_clk_get_duty_cycle(), a
consumer setting a 75% duty cycle will read back 25%, which breaks the Comm=
on
Clock Framework semantics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-pdm_clk_gp=
_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com?part=3D4

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E83F929E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296664; cv=none; b=GOK7+NRotD/tUsoLnsJiSo26ZhS4WiD+DbNihw1/pyLvHXMi0ebSvWYlVZA157t7IA8eoYxe7oInB5SSBJHV7/r7/Rj6Jfq7g6sui5abuFLPYn1jaJYKI9Pnc6SpC45CCe1saHko+16Mh8Rt/7nJx+nimUWSCfZF2lERq1kC4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296664; c=relaxed/simple;
	bh=ABLS89GogwxuSpH+7xOK9mftRbMOmlJc/2wcmRcOkEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7leLC0LTiR7O+bI00e4c5zJXtUBPWysZ+aPpOff7BzNLl0C4qTAe0L1Xf5TolCnHbe0D7TPaNh7Ogl+fbjaK9sDV+0WXWfgcKjOSt2RPK5JWKworD0DTLtExT2EH7xNefQD6zNzXyeaE3Dc6zYYG8o19DEf1/w5Ple6/Rshe0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzOdRs1l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzOdRs1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E07B1F000E9;
	Wed, 20 May 2026 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779296663;
	bh=vgzCXrY7OVN3UjPtZ2OukZnuN1ljc7DAkOWS4yi2WK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bzOdRs1lKDtx6NQ1Yalxs0SemoWXtZZNhvUuXIzbzQ1Ks+HAyAMfbGpv6+t5JCttJ
	 S/FpzVAyUbsdDLPJVzo/u4BnJ/ruAM7lY2wHxsQ+aDQXafHn9Br+CmSs7j4gqPEJ3k
	 CfYueH0oe46yisejgofS7i23hGm0lwlzOstwXHKOjG/fVKCS8ukuaz4OonLEV8TT9X
	 16xgI3W0ZSGgr0KQwwE+7ut0+RYag/188A91huUwwZTTQFo+dEfMV9Es0+eObnozpC
	 xpPxG/xh3OvEsREeeTJtXGjnC0+iPxJRAChQxm3oBFJ/3ggBk4781gBbKSWC2Uba3S
	 P0SDieNhVrueA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP
 display
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SsOpcsO0bWUgZGUgQnJldGFnbmUgdmlhIEI0IFJlbGF5?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
References: <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 17:04:21 +0000
Message-Id: <20260520170422.7E07B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The patch silently removes the `&dispcc1` status override, disab=
ling the secondary Display Clock Controller.
- [Low] The patch alters global power behavior by implicitly removing `regu=
lator-always-on` from `vreg_l6b`.
- [Low] Usage of the deprecated top-level `data-lanes` property in the Disp=
layPort controller node.
--

commit a8b912654646fb57f736aa1acf5bb9207884cc9d
Author: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>

arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display

This commit adds the vreg_edp_3p3, edp_reg_en, and mdss0_dp3 nodes to
enable the eDP-based LCD display on the Surface Pro 9 5G. It also maps
GPIO 36 for panel enable based on decompiled ACPI dumps.

Link: https://github.com/alexVinarskis/qcom-aeob-dumps/blob/master/microsof=
t-surface-pro-9-5G-1996/qcdxkmext8280_ARC_part2.json#L156-L168

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arc=
h/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> index 14287092fb07e..7f1cc18990025 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts

[ ... ]

> @@ -361,7 +377,6 @@ vreg_l6b: ldo6 {
>  			regulator-max-microvolt =3D <880000>;
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-boot-on;
> -			regulator-always-on;	// FIXME: VDD_A_EDP_0_0P9

[Severity: Low]
Is it intentional to leave this removal out of the commit message?

The commit correctly reassigns the vreg_l6b regulator to be dynamically
managed by the eDP PHY and removes its always-on property, resolving the
FIXME comment. While logically correct, this change in the power
lifecycle is an undocumented side effect. Could this be noted in the
commit message?

>  		};
>  	};

[ ... ]

> @@ -465,10 +480,6 @@ &dispcc0 {
>  	status =3D "okay";
>  };
> =20
> -&dispcc1 {
> -	status =3D "okay";
> -};
> -

[Severity: Medium]
Does this silently disable the secondary Display Clock Controller?

While this might be an intentional cleanup since mdss1 is not enabled on
this board and dispcc0 is used for the eDP, removing a major clock
controller is an implicit behavioral change. Could this modification be
explicitly documented in the commit message to prevent confusion?

>  &gpi_dma0 {
>  	status =3D "okay";
>  };

[ ... ]

> @@ -511,6 +522,42 @@ &mdss0_dp1_out {
>  	remote-endpoint =3D <&usb_1_qmpphy_dp_in>;
>  };
> =20
> +&mdss0_dp3 {
> +	compatible =3D "qcom,sc8280xp-edp";
> +	/delete-property/ #sound-dai-cells;
> +
> +	data-lanes =3D <0 1 2 3>;

[Severity: Low]
Is it correct to use the data-lanes property at the top level of the
DisplayPort controller node?

According to the MSM DP controller YAML binding schema
(Documentation/devicetree/bindings/display/msm/dp-controller.yaml),
defining data-lanes at the top level is explicitly marked as deprecated.

To comply with standard graph bindings, should this property be placed
inside the controller's output endpoint instead (for example, inside the
&mdss0_dp3_out port@1/endpoint)?

> +
> +	status =3D "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible =3D "edp-panel";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-surface-sp=
9-5g-for-next-v1-0-9df52552bf87@gmail.com?part=3D3

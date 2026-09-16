Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344FA43E06C
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550377; cv=none; b=NVVTjU831/qQQApVqmo4+AUl/Y5RsRYB/53k5iIzoZC/p1qh8J7WRnzV1Hd+utuZllFlKsTuOhgG0U3Y+nO9qGaL3zV3Pes2MrB6BuievuN4AY9McrLkKMEj9N4xkaMumohZxUr40LwQuzZ5q1K+vbbBcSOW5xrffTWZXVZJwFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550377; c=relaxed/simple;
	bh=HYkFTKOIcZPWcbO0heFyZ+Lm2uiZoFQKgWDsWbHOrt4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+ghBu6lxn5ab4b3hYIr/jxDHm1y/Dl67rKvED+unqTlN2aeBk21WVqY58bljTHoZ2xYNmzquELgOI0+TjYpsRNwhTpmMtPBnoT4GgPtSt76BlBrC+c5FZ4mvn1cabhhjUQ4GTBIYT971t5V3MLwnAl+/dcvGN+Cq7vPWwoeEdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouK+ERI/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouK+ERI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F51F1F0089A;
	Wed, 16 Sep 2026 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550353;
	bh=BsflloKWgZEFQ5w7+3//h8rzUc99xXWrXVS4DiGojR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ouK+ERI//4e0tT3/xMDy90m7nTvyLiftUVpa+iOo/o7cH1OCWFi8HAlMH28Ks5qda
	 sUznNaAlwrBh7H/e3PcwkqaD+QoVIW6/mxRJs5pQAxXc7bz+9h7ortYcZ0FYN4s3ZO
	 OhC+84V0MxG8tCtXCSvq0usBAcZoitg2O1Q6nLkvsa6M4N4ANoe8mUUkc1PCi2WdOY
	 2eU8b3X3D0hTbEq4WI3YQ+RHcInEhqCHeh6eGkoXcFde2a9A6kVsJeZnwxYJxlQP/n
	 V97W8aqy7lxgE+8XVoIcOTMlZ7iSPGGPd2O4NoTCt1YGbNZ8knaxpl6z0RjYF3HOTy
	 mR7QZRqETeRWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 09:19:13 +0000
Message-Id: <20260916091913.8F51F1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: backlight enable GPIO permanently asserted via pinctrl
--

commit 00c4e0f47a97a648f49ab088ecacedb0603403a5
Author: Arpit Saini <arpit.saini@oss.qualcomm.com>

arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel

This commit enables the Shikra MDSS display subsystem on the Qualcomm Shikra
CQM EVK board and adds the DLC0697 MIPI DSI display panel node. It also
pins pm4125_l5 to 1.232V for DSI PHY PLL stability.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79b..d9a0f32ce8d3b 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
[ ... ]
> +&mdss_dsi0 {
> +	vdda-supply =3D <&pm4125_l5>;
> +
> +	status =3D "okay";
> +
> +	panel@0 {
> +		compatible =3D "dlc,dlc0697", "ilitek,ili7807s";
> +		reg =3D <0>;
> +
> +		reset-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply =3D <&pm4125_l15>;
> +		avdd-supply =3D <&vreg_disp_p>;
> +		avee-supply =3D <&vreg_disp_n>;
> +
> +		pinctrl-0 =3D <&panel_rst_n &panel_te_pin &panel_bl_en>;

[Severity: Medium]
Does mapping panel_bl_en in the default pinctrl state bypass the display
power management sequence?

The device core automatically applies this default state before calling the
panel's probe function. Since the panel driver (panel-ilitek-ili7807s) does
not natively acquire this GPIO nor implement runtime power management (PM),
the driver core will not switch to the sleep pinctrl state during DRM
unprepare (blanking).

> +		pinctrl-1 =3D <&panel_rst_n_suspend &panel_bl_en_suspend>;
> +		pinctrl-names =3D "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint =3D <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
[ ... ]
> +&tlmm {
[ ... ]
> +	panel_bl_en: panel-bl-en-state {
> +		pins =3D "gpio91";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-high;
> +	};

[Severity: Medium]
Will this output-high configuration cause the backlight to remain permanent=
ly
powered on while the system is awake?=20

Because the panel driver does not toggle this via runtime PM, this could=20
result in a glowing black screen when the display is conceptually blanked
(DPMS off), wasting battery power. Could it also turn on the backlight too
early during boot before the panel driver has cleared the screen, causing
visual garbage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-shikra-dt-=
changes-v4-0-d5d5c3ffe070@oss.qualcomm.com?part=3D3

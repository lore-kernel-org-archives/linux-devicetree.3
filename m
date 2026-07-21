Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37FE1C2AA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636492; cv=none; b=uZhvvJzR+DNhQ5CXP/c9PPZdES3HQAvnvP58K6UpZMpS5yEB7Unz1LA9dl+c3mwOPpxzMKDr/WKn2RPoXlLzBfUlGwC5+mICaOSLDtzvYKJ4EzLu2Aq6bp1AIfm3lGhCyyFbJtqYR/A5lMIwdqUZ2UpuzB/mzAY1ZSdAVc5vFfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636492; c=relaxed/simple;
	bh=ZxyMX2LEdO6fVRwZE6J5tAEF2akOhIXnPqKRdCIQ8qI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dX5woVcDpLIyUkuyILhqj7NrEkdjLEInrWrY0fxEesNa860n41Cg+5hIWmR//bNjNEw2y1PkqkR23dDq7NUDu81m6fiDI5V1AJ9RZjtj8pNKiqNpNUHAXoLYhZOnWhjpHC3FTwHDkBKRtI1bzIqgN7dj/l8yAx0S0VhirBFsfgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfCLkuic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfCLkuic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFB21F000E9;
	Tue, 21 Jul 2026 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784636491;
	bh=jUBxe2tQesqd1mtjNicIi6B+Ob/SFkqs9OVI9zEtsCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RfCLkuicdl3mYd9xYxqvceHSbbGRqxIqbTnmPryHX0cyBtjU2sVgYLzC9UNCrVI+l
	 o/8V5fCnKYsVvNnHTWo12b3oeo/kg2SkXtWjrkbeymPVittnPYsvJNRr1IgIeI3jeL
	 0RpDjUv2HxZ/7j3KhUvFJYZ6ZC83XjNehcuge99mzjvd5wgCPSwLZPpAFWqvqqAgXe
	 IklUrlPA9JvJZ4K+tKa0Ilck6suIB2EFygZpvt1ITc5EZC6qwPI5ANcoaY3L6HaJKc
	 /2coWuBtfYU28uzm6do9N2FPVy7zZkPDwMzNZZotUxgxwbmE4zvYS5MNaImHGP8c/P
	 jxiaHGe9vM7aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org>
References: <20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:21:30 +0000
Message-Id: <20260721122131.0BFB21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `goodix,gt911` touchscreen node is missing the `irq-gpios` pro=
perty, preventing hardware reset and reliable I2C address selection.
- [Medium] The `mdp_vsync_active` and `mdp_vsync_suspend` pinctrl states ar=
e defined but never referenced, leaving the hardware vsync pin unconfigured.
--

--- Patch [1]: [PATCH v4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add di=
splay nodes ---
commit 4aa8da2a051a6d25d51dd20f442ad0cf6d0b5e21
Author: KancyJoe <kancy2333@outlook.com>
Date:   Tue Jul 21 12:10:55 2026 +0000

arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display nodes

Add nodes for the dual DSI panel, the SGM3804 regulator, the
SY7758 backlight controller, the touch controller, and enable
the GPU to enable full display support.

Link: https://patch.msgid.link/20260702-topic-sm8650-ayaneo-pocket-s2-displ=
ay-dt-v3-1-e6de68d33f9b@linaro.org
Link: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-displ=
ay-dt-v2-1-cdd4b70e5a16@linaro.org
Link: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-displ=
ay-dt-v1-1-ff132c00d076@linaro.org

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/=
arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d9..035efeacc7db7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts

[ ... ]

> @@ -1016,6 +1037,30 @@ wcd_usbss_sbu_mux: endpoint {
>  	};
>  };
> =20
> +&i2c4 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	touchscreen@5d {
> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x5d>;
> +
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <162 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios =3D <&tlmm 161 GPIO_ACTIVE_HIGH>;
> +		VDDIO-supply =3D <&vreg_l14b_3p2>;
> +		AVDD28-supply =3D <&vreg_l14b_3p2>;

[Severity: High]
Is this node missing the irq-gpios property? The goodix driver needs both
reset-gpios and irq-gpios to execute its hardware reset and i2c address
selection sequence.

Without irq-gpios, the driver skips the reset sequence completely, which can
leave the controller in an undefined state and cause initialization to fail.

> +
> +		touchscreen-size-x =3D <1440>;
> +		touchscreen-size-y =3D <2560>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&ts_reset_default>, <&ts_irq_default>;
> +	};
> +};
> +

[ ... ]

> @@ -1073,6 +1163,93 @@ &mdss_dp0_out {
> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l3i_1p2>;
> +
> +	qcom,master-dsi;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +
> +	status =3D "okay";
> +
> +	panel@0 {
> +		status =3D "okay";
> +		compatible =3D "ayaneo,wt0630-2k", "renesas,r63419";
> +		reg =3D <0>;
> +
> +		pinctrl-0 =3D <&disp0_reset_n_active>;
> +		pinctrl-1 =3D <&disp0_reset_n_suspend>;
> +		pinctrl-names =3D "default", "sleep";

[Severity: Medium]
Should the mdp_vsync_active and mdp_vsync_suspend states be referenced
here?=20

They are defined later in this file to configure the hardware vsync pin, but
without being included in these pinctrl properties, the pin remains
unconfigured. This could break hardware tearing effect synchronization
delivery to the DPU and lead to display tearing or update timeouts.

> +
> +		vddio-supply =3D <&vreg_l12b_1p8>;
> +		vdd-supply =3D <&vreg_l11b_1p2>;
> +		vsp-supply =3D <&sgm3804_pos>;
> +		vsn-supply =3D <&sgm3804_neg>;
> +		vci-supply =3D <&vreg_l13b_3p0>;
> +

[ ... ]

> @@ -1411,6 +1602,20 @@ fan_int: fan-int-state {
>  		bias-pull-up;
>  	};
> =20
> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins =3D "gpio86";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins =3D "gpio86";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-topic-sm86=
50-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org?part=3D1

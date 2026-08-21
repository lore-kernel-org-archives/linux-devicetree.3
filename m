Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A5B448D0E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315779; cv=none; b=pYCiw2sbFTXv975eIvCw9BbMB/XGNESohwLNME6Z690NdAak+FwRb8OaKgBWzD0uKEO4RJL9hcDE8hnrJAJp7JRWNektvG/o3R0D+wAF3onS4wHEOYZPFddesyAcPTdq54yunembPylw/MfFEwRdvJVkOIB6aczwymbWL4lR3xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315779; c=relaxed/simple;
	bh=mLM6FGzN9PN+9rIWyrpr8ZKkRYMcCve0OQfyNT49n48=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hLLnKlkNJvr+Vb4VmjhTmkRxteqMoWdPL3QNQ2spqOYsyaElvcF+O30BZIKJ5of93zs/wgv32+AO1ULuFIS1aGhjEBD7TKA/F2j9eAzD+VyZKd+BmuNihm4AhuxqRUQD7Ziv+nVGmCbalyH8J9Xdpz8hJRQrb2aMiwJfEtdlGbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0mBOhso; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0mBOhso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273DE1F000E9;
	Fri, 21 Aug 2026 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315778;
	bh=xJNzJ+XliiBOCfYhtcK6908cqv+j+MXm5PEnIqP4u9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T0mBOhsodXsQ4v3qPp2KjCKn3bbgvnrPAkmqfIU7Z0yc74912G9lM00gnmQkG9mua
	 KGlSrhT1ED9abwo5komvWJz8QDhW/5XYfV19ADxSNCerJH5CcWMwf/Pq6qBdTMo7pg
	 shGZf6pOQEyVMspM2C9PH00ei09d3HPQesAS0iixMN1iCM+mnFTCdZQ1OMwzA6Na2/
	 gyE4Fq9RW9HlmPMQFt8FcmdalafNT4mzQ7R1M+vrnraoYGqQQ/+wDAvAzpKREt76zg
	 S/8FKjC6KoDgy3iZGnwi1AG/nukWxek9zH+hHtrO9Im34vhPoKtKwD1eU9LXa4LHiY
	 /WhZyZ0qfEe1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] arm64: dts: qcom: Add LeEco Le2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-next-patches-v4-5-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
 <20260821-next-patches-v4-5-7ab02c0d4eb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:36:17 +0000
Message-Id: <20260821123618.273DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `vdd_l9_l10_l13_l14_l15_l18` property in `qcom,rpm-pm8950-regu=
lators` is missing the mandatory `-supply` suffix.
- [High] The `&otg` node configures an `extcon` but lacks `status =3D "okay=
";`, meaning USB will remain disabled.
- [Low] The Synaptics RMI4 touchscreen `reset-gpios` is incorrectly specifi=
ed as active-high (`GPIO_ACTIVE_HIGH`), contradicting the hardware's active=
-low requirement.
--

--- Patch [5]: [PATCH v4 5/7] arm64: dts: qcom: Add LeEco Le2 ---
commit c3c3413469ad8891e9f97013b16ab8831b5677fe
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add LeEco Le2

This patch adds a devicetree for the LeEco Le2 smartphone based on the
Eldarion/MSM8976 SoC. It includes initial support for I2C peripherals,
regulators, WLED, remoteprocs, and GPU.

> diff --git a/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts b/arch/arm64/b=
oot/dts/qcom/msm8976-leeco-s2.dts
> new file mode 100644
> index 0000000000000..e64335162c34b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts
[ ... ]
> +&blsp1_i2c4 {
> +	status =3D "okay";
> +
> +	touchscreen@4b {
> +		compatible =3D "syna,rmi4-i2c";
> +		reg =3D <0x4b>;
> +		interrupts-extended =3D <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 =3D <&touch_default_state>;
> +		pinctrl-names =3D "default";
> +
> +		reset-gpios =3D <&tlmm 64 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Is the reset-gpios polarity correct here?=20

Looking further down in the patch at touch_default_state, a bias-pull-up is
defined for this pin. This suggests the inactive state is physically high,
which would mean the reset should be active-low. While the syna,rmi4-i2c
driver may ignore this property currently, if driver support is added later,
the GPIO framework might drive the pin low when de-asserting it, keeping
the device permanently in reset.

[ ... ]
> +&mdss_dsi0_phy {
> +	vddio-supply =3D <&pm8950_l6>;
> +};
> +
> +&otg {
> +	extcon =3D <&tiusb320>;
> +};

[Severity: High]
Should this node include a status =3D "okay" property?=20

Without it, the OTG port will remain in the disabled state defined by the
base SoC inclusion, which prevents the USB controller driver from probing
and leaves USB/OTG functionality broken.

[ ... ]
> +&rpm_requests {
> +	regulators {
> +		compatible =3D "qcom,rpm-pm8950-regulators";
> +
> +		vdd_s1-supply =3D <&vph_pwr>;
> +		vdd_s2-supply =3D <&vph_pwr>;
> +		vdd_s3-supply =3D <&vph_pwr>;
> +		vdd_s4-supply =3D <&vph_pwr>;
> +		vdd_s6-supply =3D <&vph_pwr>;
> +		vdd_l1_l19-supply =3D <&pm8950_s3>;
> +		vdd_l2_l23-supply =3D <&pm8950_s3>;
> +		vdd_l3-supply =3D <&pm8950_s3>;
> +		vdd_l5_l6_l7_l16-supply =3D <&pm8950_s4>;
> +		vdd_l8_l11_l12_l17_l22-supply =3D <&vph_pwr>;
> +		vdd_l9_l10_l13_l14_l15_l18 =3D <&vph_pwr>;

[Severity: High]
Is this property missing the mandatory -supply suffix?

The regulator framework relies on the -supply suffix to establish parent-ch=
ild
relationships. Without it, the framework will fail to resolve the parent
supply, leaving regulators L9, L10, L13, L14, L15, and L18 unmapped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v4-0-7ab02c0d4eb9@gmail.com?part=3D5

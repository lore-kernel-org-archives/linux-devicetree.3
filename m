Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0C481FC2
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313165; cv=none; b=WS15QkPSNvUuj2vDiWC9BUm5kJZgDflZMWrJmurYeChQEYq4aMv2yGRLOQwYB/novmSYXRC60rbfh7/OZQ5s7tHHPy0UWwalyMMFDRI5h/nmUEHOuLU1+lcho13Hx7l9MKxtJW5CZt2N72CdHQulEFiKTTua0o0voM4O4oCIGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313165; c=relaxed/simple;
	bh=XMYDpxekswXtaqtgkFeMfVR3VgLteBj7szuRok6Dmk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IRpt4W1hOmKnEgPvOmV5H1Ek7xWh+QWYP4LN4BwW2JOYzYFDZSvx2OXZVaOb2gTrB1nUSSnf2K9QMxYroQUaRHlSx0Jn3FkmpsHZZUgJxR5yvKCeJwX3NC+8P+f4xi2bWJsNanbg4XNmUDDG5mas9ZFFJfU8JEx5ruv4a+fNLcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=becdx5lu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="becdx5lu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940C81F00A3A;
	Fri, 21 Aug 2026 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787313161;
	bh=PwGbRn4Cjk513unDUWm2W/v4UShNDRvqVvSTT2xzWtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=becdx5luFRd4W1/jKDwtmjMIvHa643DdH3HpptXj9BtPaVngMEtYJ2a2QD/QoRVRj
	 SVOvVAO4SXe51++E0vRj5onun9DbCX/UsYRMH9gl6kEuBwGCFom/lZVKxNnS7RzbAu
	 pdds4QpQzaqeFzlDYm6xG67cwvF+ojNEobyDXe1sIic0MQG3ys/HXYLQk421xch4td
	 5vrjT46CSsuv6628jZVtlp29yRCvFhKZIDVsEeem3Ixy9/K2mG2iW6JAsmyB0ub+d7
	 5Ecu8J6tqUtBjH0e+rMJf86QmeHwpDj5w4SqFKAlswVQ/ACZ7zAKSsSUzfxWzRipvf
	 70DdRe+gRSBJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: Add LeEco Le2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260821-next-patches-v3-5-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
 <20260821-next-patches-v3-5-cd64bcef6e21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:52:41 +0000
Message-Id: <20260821115241.940C81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The TUSB320 Type-C controller's interrupt is incorrectly configure=
d with a rising edge trigger.
- [Medium] The GPU regulator `VDD_GFX` is marked `regulator-always-on`, whi=
ch defeats dynamic power scaling.
- [Medium] WLED is claimed as supported but the pmi8950_wled node is left d=
isabled.
- [Medium] The 'vdd_l9_l10_l13_l14_l15_l18-supply' property is missing from=
 the pm8950 rpm_requests regulator node.
--

--- Patch [5]: [PATCH v3 5/7] arm64: dts: qcom: Add LeEco Le2 ---
commit cfadc21619b39e4cbfad0d3c04b195d16b58fa22
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add LeEco Le2

Adds a devicetree for the LeEco Le2 smartphone based on the
MSM8976 SoC. Supported features include I2C peripherals, WLED, GPU,
and regulators.

> diff --git a/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts b/arch/arm64/b=
oot/dts/qcom/msm8976-leeco-s2.dts
> new file mode 100644
> index 0000000000000..086fab5ae6e7c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts

[ ... ]

> +	tiusb320: typec@47 {
> +		compatible =3D "ti,tusb320";
> +		reg =3D <0x47>;
> +		interrupts-extended =3D <&tlmm 21 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
The TUSB320 INT_N interrupt signal is typically an active-low open-drain
output.

Will configuring it to trigger on a rising edge cause the driver to miss
Type-C events, since it would only process the interrupt when the hardware
deasserts the line?

> +
> +		pinctrl-0 =3D <&tusb320_int_active>;
> +		pinctrl-names =3D "default";
> +	};

[ ... ]

> +	pm8004_s5: s5 {
> +		regulator-name =3D "VDD_GFX";
> +		regulator-min-microvolt =3D <950000>;
> +		regulator-max-microvolt =3D <1165000>;
> +		regulator-enable-ramp-delay =3D <500>;
> +		regulator-always-on;

[Severity: Medium]
Does setting regulator-always-on for the VDD_GFX regulator defeat the Adreno
GPU driver's dynamic power scaling?

This appears to keep the GPU rail powered even when idle or suspended.

> +	};
> +};

[ ... ]

> +&pm8950_resin {
> +	linux,code =3D <KEY_VOLUMEDOWN>;
> +
> +	status =3D "okay";
> +};
> +
> +&pmi8950_wled {
> +	qcom,current-limit-microamp =3D <20000>;
> +	qcom,enabled-strings =3D <0 1>;
> +	qcom,ovp-millivolt =3D <29500>;

[Severity: Medium]
The commit message lists WLED as supported, but this node lacks a
status =3D "okay" property.

Since pmi8950.dtsi defaults the WLED node to disabled, will the driver fail
to probe?

> +};
> +
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

[Severity: Medium]
Are we missing the vdd_l9_l10_l13_l14_l15_l18-supply property here?

Without it, the regulator core might not be able to track the parent supply
for LDOs 9, 10, 13, 14, 15, and 18.

> +
> +		pm8950_s3: s3 {
> +			regulator-min-microvolt =3D <1325000>;
> +			regulator-max-microvolt =3D <1325000>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v3-0-cd64bcef6e21@gmail.com?part=3D5

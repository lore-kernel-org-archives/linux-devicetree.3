Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062051;
	b=jYvVlicyGd8bII9LIG0XIGtwbqLnEWuiz6U8zrOPo/kQBvAeQ1sNyckrz+PI45z4oKu5
	 1ySOCBi3nTfzLgLVapuTPCz0ctrJ5tyHJ8r5XF/UJ2rHkKUHDn9Jjx0EQ/ZvBWVDkVkjc
	 5U0o7RrhvJbNnoSE6Qr1wT+TPCkEAEMevedCsq1UZA323e9pmEe2HmuOfW7Jd7H2OYPFi
	 lO34tZ/MT38eTAGyhtHMw/BP6NbBAUsH/JxRWbATQ00nVRLkTFl61bdlePtgvZLhY/706
	 7nPFh61sFQy7gpxNKPXxS0gJaQT7x8Oe+DbnkmoFKy3qNIkvAdKhJAzZ0W5BxEit7Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062051;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qMi0+jLy3VndeUj6/7otj2iqsprG6n4RwFcjX3CN5jI=;
	b=U2bwWoWofQra3vYp3kfXAOTYMfDGMZ2VzyCh/7k1xeFLsFgka0WNxF3RfFfPMCXaa0vX
	 WtbEmj9Or+BGj5F/DzAx64k3bnwkkkAhXurGhqtFIyvJqIBdw4/vNT2ai9oMFeXVG5Q9/
	 XhqRWhOHMyWttCR0NOrxJWt+zyRG/2msrzfNP7btd7hNEb2YH67PppRJgHZ++DhSXSZyE
	 kaIivOZtCDd7yJtddf9HjQK/7TaazHOZwVZfJVOwzEN+Un8t1LJAcl8qmex3Sb5VKREYl
	 pn9y4BX5vzNQvL1vI/BYNOWQE2scFNxIDO9RNVCHCRwnVV1dDNKrh+V2R2ttEmtbIEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWi6QolK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2515606A332
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWi6QolK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260561F0089F;
	Sat,  7 Nov 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794062051;
	bh=qMi0+jLy3VndeUj6/7otj2iqsprG6n4RwFcjX3CN5jI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWi6QolK47ZW/tlWMnDfilxNyJLORxIMGGl3gb19yl5FZFFXHFSMN6xlvI7/Mkbj9
	 VNsh9QuvI43bP6gdSTjZiRxjK/c8UekWkT3cjZruMdOIt6zs9/joO7Y6eQnSx7vIdn
	 KAAfVj/TpCF8p0D0j5ZxIW+erCCCusY/Ujg2Hm/Wk3fcWylPx9jbk7YkyrmNDHR1zI
	 fQHK0tVnZvg2QbaIoABACW810iGNM/ACgxm9INeOz1hUBWyglkBByV4RKKAKSfBNgH
	 nRNOiXQ2guP+2Z7C6Nf6U64PIr6FcJPkekiTSlqj49vf4/UVqN/nYOAjN4wdwH+kkZ
	 w0OWrWT+o033w==
Message-ID: <sashiko-outbox-202958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add Xiaomi Poco M3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amir Hanip" <killdeath104@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107141432.39099-4-killdeath104@gmail.com>
References: <20261107141432.39099-1-killdeath104@gmail.com>
 <20261107141432.39099-4-killdeath104@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 14:34:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: citrus: wifi node bypasses wcn3950-pmu
  regulators
--

commit 143f785de163a225c81347bf706860097515c0a4
Author: Amir Hanip <killdeath104@gmail.com>

arm64: dts: qcom: Add Xiaomi Poco M3

This commit adds the initial device tree for the SM6115-based Xiaomi Poco
M3 (citrus).

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts b/arch/arm=
64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> new file mode 100644
> index 0000000000000..03544f28f06cd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> @@ -0,0 +1,237 @@
[ ... ]
> +	wcn3950-pmu {
> +		compatible =3D "qcom,wcn3950-pmu";
> +
> +		pinctrl-0 =3D <&sw_ctrl_default>;
> +		pinctrl-names =3D "default";
> +
> +		vddio-supply =3D <&pm6125_l9>;
> +		vddxo-supply =3D <&pm6125_l16>;
> +		vddrf-supply =3D <&pm6125_l17>;
> +		vddch0-supply =3D <&pm6125_l23>;
> +
> +		swctrl-gpios =3D <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_io: ldo0 {
> +				regulator-name =3D "vreg_pmu_io";
> +			};
> +
> +			vreg_pmu_xo: ldo1 {
> +				regulator-name =3D "vreg_pmu_xo";
> +			};
> +
> +			vreg_pmu_rf: ldo2 {
> +				regulator-name =3D "vreg_pmu_rf";
> +			};
> +
> +			vreg_pmu_ch0: ldo3 {
> +				regulator-name =3D "vreg_pmu_ch0";
> +			};
> +
> +			vreg_pmu_ch1: ldo4 {
> +				regulator-name =3D "vreg_pmu_ch1";
> +			};
> +		};
> +	};
> +};
[ ... ]
> +&wifi {
> +	vdd-0.8-cx-mx-supply =3D <&pm6125_l4>;
> +	vdd-1.8-xo-supply =3D <&pm6125_l16>;
> +	vdd-1.3-rfa-supply =3D <&pm6125_l17>;
> +	vdd-3.3-ch0-supply =3D <&pm6125_l23>;
> +	vdd-3.3-ch1-supply =3D <&pm6125_l24>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Should the wifi node consume the wcn3950-pmu regulator outputs
(vreg_pmu_xo, vreg_pmu_rf, vreg_pmu_ch0) instead of referencing the
pm6125_l* regulators directly?

pwrseq_qcom_wcn3990_match() matches the WiFi device by checking whether
vdd-1.8-xo-supply is a child regulator of wcn3950-pmu.  Because
vdd-1.8-xo-supply points to pm6125_l16 under rpm-requests,
devm_pwrseq_get(&pdev->dev, "wlan") in ath10k_snoc_probe() fails to match
and falls back to ar_snoc->pwrseq =3D NULL.  This bypasses the WCN3950
power sequence and never votes for wcn3950-pmu's vddio-supply
(pm6125_l9), leaving vddio unpowered when Bluetooth is off or disabling
it when Bluetooth powers down while WiFi is active.

In addition, vdd-3.3-ch1-supply is wired to pm6125_l24 (the UFS vcc
supply in sm6115-xiaomi-lime-common.dtsi) while wcn3950-pmu defines
vreg_pmu_ch1 without a vddch1-supply input, and vdd-0.8-cx-mx-supply
points to pm6125_l4 (the 0.9V USB/UFS PHY supply) rather than pm6125_l8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107141432.3909=
9-1-killdeath104@gmail.com?part=3D3

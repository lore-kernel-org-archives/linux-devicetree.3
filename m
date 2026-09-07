Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAA453A22
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776452; cv=none; b=emkpSodwUdJCBjoZjDhtUqJerN5iZMj6TIUjuS8bMxDYawTjspqQZkymS19ooHWba51FIrbNcq2k0mRQpt5Q9bqQYy8EmIxW+SP9AlRlvYPml9214MOAz7tJ/qdj6wpqAnkdTWwLVoV6d/feT71mK94Obw7GhyXxIrEYkwU1SzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776452; c=relaxed/simple;
	bh=k34b4U2Vj9TGpPXYb0yCtXRPBf+iUQa8BIOWSVdXKDY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RU+QBKb8dNZIu12boRzFPAgZqNplQzvf0cvOBphI2JEwCpj4NaYKJk3BWMmcb8jvOgQ8ltDnT3JCPLewHtF9gEoOsXSaOIuAxjoC160VOTOGpZjzlctTCpYnHpcOyp3TeY0jv3ru0fnY1cwQbUy1rTirQZhr5neA2+Bo00BZKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYZeidnB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYZeidnB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2201F00A3A;
	Mon,  7 Sep 2026 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776450;
	bh=Lwlq4FYIKyFZkwDaXqzD9KZldw37C6ZZYz+F6AwSeL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYZeidnBWf05TV9qhSe70RsuCpqrncuZ1IKdfE0p6+/DtSvgz0VmBCu9ItDLKQcY3
	 vFVaxf9bMLdL32ajwVAm+uT5k460zPMCVUZYjC63KnmWfAC7B6dNtT2eWA3C/xEc1Z
	 OyP1tJrRVQaUFm/G2wql1yodRg7/MNTA/EjhtKIlobOvn1XZvNceaq9VVwzIggxWYA
	 +OzoMaZmUJ6WHm1x6HwH3T7sQnFwTc+bTLwyBjfzsomV660Zn/jrc5jdujh5nx0U3g
	 s/hwZq7Gn78w26txhUHKZr5pCRm5EHQKcjaQCUJSLgEI9bItx0mk883pT+vOsqOv5f
	 /fLNKv0GWEAIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-glymur_camss_dts-v1-4-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-4-6c2ced5ea5f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:20:49 +0000
Message-Id: <20260907102050.3F2201F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree node uses an undocumented and unsupported compat=
ible string 'qcom,pm8010-i2c' with no corresponding dt-bindings or driver i=
mplementations in the kernel tree.
- [Medium] The PM8010 PMIC node is missing an `interrupts` property, which =
is architecturally necessary for I2C PMICs to signal thermal alarms and fau=
lts.
--

commit c57ad5fec12bca214fc8171c9ab4ce19cbc0631e
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC

This commit adds a new device tree node for the PM8010 PMIC over I2C to the=
=20
Glymur CRD. It configures the PMIC's seven LDO regulators, reset GPIO, and=
=20
associated pinctrl states.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index 4df3ccfee106a..68a191890b7d8 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -671,6 +671,66 @@ ptn3222_1: redriver@47 {
> =20
>  		#phy-cells =3D <0>;
>  	};
> +
> +	pm8010: pmic@8 {
> +		compatible =3D "qcom,pm8010-i2c";

[Severity: Medium]
Will this compatible string match an existing driver? The "qcom,pm8010-i2c"=
=20
compatible string appears to be undocumented and unsupported in the kernel
tree.

When building device trees with make dtbs_check, this will result in=20
validation failures since there are no corresponding dt-bindings. The pm8010
device node will also remain inactive because no driver core can match it,=
=20
leaving the PMIC and its regulators uninitialized.

> +		reg =3D <0x8>;
> +
> +		reset-gpios =3D <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply =3D <&vreg_l6p>;

[Severity: Medium]
Should this PM8010 PMIC node include an interrupts property?

The pm8010 node in arch/arm64/boot/dts/qcom/glymur-crd.dtsi defines a reset
line but is missing an interrupt line, which is architecturally necessary
for I2C PMICs to signal thermal alarms and faults.

Without an interrupt line, the SoC cannot respond to critical PMIC hardware
events like over-temperature or over-current faults. Additionally, if a=20
future driver follows standard Qualcomm I2C PMIC patterns, passing a missing
IRQ to devm_regmap_add_irq_chip_fwnode() will cause the driver probe to fail
entirely with -EINVAL.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-glymur_cam=
ss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com?part=3D4

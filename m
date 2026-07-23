Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D01353A82
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772726; cv=none; b=KsPVLs8kMAltmX0eQTnCNjit62kqmyd/7b0NXqglYB8YimLvssRiUwXb3PRrhlLaU/hrudY9kqIRJPYwFcTvLnmUtjpnsitRygS/Sngd1Kd2rJXH3BhAo4gFZk9SGtgsYaySst4l9neN0RrWupzuIMmYxQL/nHX4lJvUROY/+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772726; c=relaxed/simple;
	bh=2C2+SUCqB5lb+02+WUVEnEMEuxT8lGaa8JEQaygftsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Aj/AUH5d5jFsQti2Q7l8jaKoLBMsQhU4dvYgjGPLK49/Pu45/TzTkkaR6On027kheGWRaH9m+8Z9jsL2np+e1P8Gx3Ka4GMDb2eCEvtfItxyMCXNrB+UAKuhZXS0qVWg6tl6emcv3envUzbkwzBSOrnSeWO0B0VjlXkAjVvFDIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaSigNy/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaSigNy/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B29F1F000E9;
	Thu, 23 Jul 2026 02:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784772724;
	bh=LrTk/nfvNHVcc396RVf5BI4a0jxMcnTliOYbYabcZNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NaSigNy/wylq397YMSEemuBElTMLykUChC0WClMeDA86VRvlOr/nigPwZ00p5NEqZ
	 TbQfYmqEhF57L5USfFrxUnEgrqYPqoUpFVmJx+Rb40Mr6yF+lR7MVwdW797uBroKGT
	 0+IELxdk2oYushe7ncCC9IfPVQCSrsb7avl6VoE7R7uqlH5gDMpk+6n6347cFCHeB0
	 xrFaMfXbdZplezJ9kamRHScYhdTrTzl5+vjOYuCEcBemsDcNHAqE/rXjh4GqRYFT18
	 kn1Uz4ydrOVGN2xtZ7XImgRAkuvHfK0eHqCCPFY4A5LPv8OTecEtCJNiJ9qH7YvAYj
	 de4wrFeaZ1Ikw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add initial Motorola Moto E4
 (perry) support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aneesh Pradhan" <aneeshpradhan2004@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723014627.63310-4-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
 <20260723014627.63310-4-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:12:04 +0000
Message-Id: <20260723021204.8B29F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Critical pins for the touchscreen interrupt, sensor I2C bus, sen=
sor interrupt, and regulator enable lack pinctrl configurations.
- [Medium] Battery design capacity is incorrectly specified for the hardwar=
e.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: add initial Motorola Moto E=
4 (perry) support ---
commit 456da8a21ca3d3b4649cf6cd9b340f36af9edbf2
Author: Catherine Frederick (coolguy) <serenity@floorchan.org>

arm64: dts: qcom: add initial Motorola Moto E4 (perry) support
   =20
Adds MSM8917 and MSM8920 board files for the Motorola Moto E4 (perry) shari=
ng a
common dtsi. Includes regulators, eMMC/SD, USB OTG, gpio-keys, touchscreen,
IMU, Wi-Fi, and WLED.

> diff --git a/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi =
b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
> new file mode 100644
> index 0000000000000..1870958976fbe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
> @@ -0,0 +1,412 @@
> +// SPDX-License-Identifier: GPL-2.0-only
[ ... ]
> +	battery: battery {
> +		compatible =3D "simple-battery";
> +
> +		charge-full-design-microamp-hours =3D <4000000>;

[Severity: Medium]
Does the Moto E4 have a 4000 mAh battery? The design capacity here specifies
4000 mAh, but this device usually ships with a 2800 mAh battery.=20

Could this incorrect capacity confuse the fuel gauge algorithms and lead to
inaccurate state-of-charge calculations?

> +		constant-charge-current-max-microamp =3D <1000000>;
> +		voltage-min-design-microvolt =3D <3400000>;
> +		voltage-max-design-microvolt =3D <4400000>;
> +	};
[ ... ]
> +	i2c-sensors {
> +		compatible =3D "i2c-gpio";
> +		sda-gpios =3D <&tlmm 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +		scl-gpios =3D <&tlmm 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

[Severity: Medium]
Are we missing pinctrl configurations for the I2C bitbanging pins (gpio14,
gpio15) and the IMU interrupt pin (gpio41) below?=20

Relying on bootloader state for these pins could lead to initialization
failures if they are left floating or improperly muxed.

> +		i2c-gpio,delay-us =3D <2>; /* ~100 kHz */
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		imu@18 {
> +			compatible =3D "bosch,bma253";
> +			reg =3D <0x18>;
> +
> +			interrupts-extended =3D <&tlmm 41 IRQ_TYPE_EDGE_RISING>;
[ ... ]
> +	ts_default: ts-default-state {
> +		pins =3D "gpio64";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};

[Severity: Medium]
Should the touchscreen interrupt pin (gpio65) be configured in this state as
well?

The touchscreen node explicitly uses it:

&blsp1_i2c3 {
	touchscreen@20 {
		interrupts =3D <65 IRQ_TYPE_EDGE_FALLING>;
		pinctrl-0 =3D <&ts_default>;
		reset-gpios =3D <&tlmm 64 GPIO_ACTIVE_LOW>;
	}
}

Missing pinctrl on this falling-edge interrupt could result in an interrupt
storm if the bootloader doesn't set the correct pin bias.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723014627.6331=
0-1-aneeshpradhan@acm.org?part=3D3

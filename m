Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF0633E7
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546876; cv=none; b=QJr5AnfyeFkoiFEY650yktxUs/VuLQp+0eAr8QM+gS9d0gRx0d4mjYyQn5KYNJxXL6ivIJWXRLXl2fHz283B91IQwgX+36hPTxuoOwrMRLEyH3H3LnCyHaKBdTZSU+nt7n/yePBCVkUHoR72KYp2TELwerFy5yeJQGAciQJ/2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546876; c=relaxed/simple;
	bh=4WJSaC/7HcNpmVM5+2ihQjKaQJ1bSHNi8mD+vhH/iAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M3QQEEfuivvlawXzurWPyohFTyLN3QYMYB+CzcPHUPA9RttnA80HxnVwe69ITBC12UfqHwIj1xgRztQdCoFFt/Dx1IiDMad9EJChPeUkzXo6jiPxv8Ic2CJKKgHzON1yFFZ/DxBeOQu/en70AvBjz0VVSSfmHJK4W+RETWq/vR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rj3PB7h/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rj3PB7h/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22C4C2BCB0;
	Tue, 12 May 2026 00:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778546876;
	bh=4WJSaC/7HcNpmVM5+2ihQjKaQJ1bSHNi8mD+vhH/iAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Rj3PB7h/AnSkGo+a/OPYbaqmG76iJMUkSNcEgfXLIANcamecLrGDiuCcWUyfpFvpS
	 1cs/dADyVurs/WYVCRcVisOAzHrKoMRcK67ildXQHoXI8SVgiDh0NcGpgeGiNDPhhh
	 jxPlWJs5+I6nR6pD2jJI8mtF+SED7HgRuQLCAEEC9EnoEZMjItVrOra0gkLRqAP4Jp
	 1pBIW3m7g4/WlIj+xzcWRXGaaIJuNcHbHgJRgit3e81zHq992zuCDmLuI2rx4JSSY6
	 xirGQIZDFAJVjKuIgWz4JAqPmd1lDU9KDwZ37Y/iwYKA1zXGJMlEx0pBe4w3boZc7m
	 ufDf6eYh8bZQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/9 RESEND] ARM: tegra: lg-x3: Complete video device
 graph
Reply-To: sashiko@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511074859.24930-2-clamor95@gmail.com>
References: <20260511074859.24930-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:47:55 +0000
Message-Id: <20260512004755.C22C4C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Invalid 'orientation' property in 'onnn,mt9m114' node.
- [Low] Inaccurate 'compatible' string for the ST EEPROM.
--

commit df21cf02565cc61e444d4c72eaf7861addc90fb0
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: lg-x3: Complete video device graph
   =20
Add front and rear camera nodes and interlink them with Tegra CSI and VI.
Adjust camera PMIC voltages to better fit requirements and fix the focuser
node.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot=
/dts/nvidia/tegra30-lg-p895.dts
> index 414117fd43824..896639599c126 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
[ ... ]
> @@ -118,6 +118,52 @@ rmi4-f1a@1a {
>  		};
>  	};
> =20
> +	i2c@7000c500 {
> +		/* Aptina 1/6" HD SOC (MT9M114) */
> +		front-camera@48 {
> +			compatible =3D "onnn,mt9m114";
> +			reg =3D <0x48>;
> +
> +			clocks =3D <&tegra_car TEGRA30_CLK_CSUS>;
> +
> +			reset-gpios =3D <&gpio TEGRA_GPIO(BB, 5) GPIO_ACTIVE_LOW>;
> +
> +			vddio-supply =3D <&vio_1v8_front>;
> +			vdd-supply =3D <&vt_1v8_front>;
> +			vaa-supply =3D <&vt_2v8_front>;
> +
> +			orientation =3D <0>; /* Front camera */

Could this property cause a dtbs_check schema validation error?

The device tree binding for this sensor enforces additionalProperties: false
at the top level and does not appear to include a reference to
/schemas/media/video-interface-devices.yaml, which defines standard camera
properties like orientation.

> +
> +			assigned-clocks =3D <&tegra_car TEGRA30_CLK_VI_SENSOR>,
> +					  <&tegra_car TEGRA30_CLK_CSUS>;
[ ... ]
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index 768e201456d8a..d2a5904cebedd 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
[ ... ]
> @@ -1112,29 +1198,68 @@ dw9714: coil@c {
[ ... ]
> +		/* rear camera sensor eeprom m24c08 from ST */
> +		m24c08: eeprom@50 {
> +			compatible =3D "atmel,24c08";

This isn't a bug, but since the comment notes this is an ST Microelectronics
EEPROM, would it be better to use a compatible string array that includes t=
he
actual manufacturer followed by the Atmel fallback?

For example: compatible =3D "st,24c08", "atmel,24c08";

> +			reg =3D <0x50>;
> +
> +			/* if high then WP is on, if low then off */
> +			wp-gpios =3D <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511074859.2493=
0-1-clamor95@gmail.com?part=3D1

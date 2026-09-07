Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428B3644CB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 06:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763444; cv=none; b=VWG19FLaFpL4tepo0zKS0GzYY7UnGf8mqih3jZ4Xp+gaQ9GUn+WI3BfUNCQE3Tjon4yXIqUDsmALlpPgUcPoAo0+PlQHASBGsf9x0yqR5t/IC5ceXoOhSuWotkqIrLeh9HpjoIq/BG1IKPnkbW40zmAqb8lQ1CUCfRovzKxeJuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763444; c=relaxed/simple;
	bh=j1VBciYU+56lFSPL/ui8DISKuAMHYfojI7BVoU5F1n0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X3FIuIjnFV0XxZWJsqT0XVKfaVI/yOSSusN2h3dAcaFCua5gJwEwN0lG8LeMP+SHwkOYQD1LUEZic2mOBxO+eyn61HoLwrjlWUaonw8vBiJqNv1FD8xBC3CHZJ8W9wOVxX0tt/C3Qi4Ooc99bPDSIMOi59KCZshN9YFFBMc+UsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMerDzm7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMerDzm7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9954B1F00A3A;
	Mon,  7 Sep 2026 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788763442;
	bh=NsZtcAtdnSPUU624lrdpdvYpBYbtMaS2ZGVy7VpsVhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GMerDzm7qMg7I9wmAQJDBrg/I4938/49JjmGgpYC4C9TdGLPgO4fy73NMd0RSDVuy
	 KlyUJwXX6rcwd9pN0AhQngZYcxVJXFLc0TC5X6rfCdhHcYFI3pYERnBVOYLD2vtuE8
	 YGSQsWYZeE0VHXHujuJj9HyVHdbsMKdmtcz0vHAlweUXVnbHiM47EDLtLMrFWDSVYV
	 EUwbpi6fpppCsF/aK+4AqPEsB72KuX+xo4X9GKVbNADClOMC/4Hbi53vDCO3zCsTxy
	 ANGpplHsrJg+kxDeFkYM0rHxw+yQVuprehaHBU8nLsmmg/vso6JqXGG51kjAH6s2J1
	 TMeIn0+4jyJSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shashank Maurya" <shashank.maurya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-rpi_dts_overlay-v2-2-a4989322ce00@oss.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-2-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 06:44:02 +0000
Message-Id: <20260907064402.9954B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Downstream-only I2C properties (`qcom,load-firmware` and `qcom,xfer=
-mode`) are leaked into the upstream device tree.
- [Low] The panel node is missing the mandatory fallback compatible for the=
 ILI9881c driver.
- [Low] The regulator MCU node uses an invalid node name and includes an un=
supported vcc-supply property.
--

commit c29fa706b8fbecd36dcc880f57d516cffcc9f530
Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay

This commit adds a device tree overlay for the Raspberry Pi 7" DSI touchscr=
een
panel on Lemans EVK. It configures mdss0_dsi0 with 2 data lanes and adds the
panel MCU on I2C1.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dt=
so b/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso
> new file mode 100644
> index 0000000000000..14743b3c38637
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso

[ ... ]

> +&i2c1 {
> +	qcom,load-firmware;
> +	qcom,xfer-mode =3D <1>;

[Severity: Low]
Are these downstream I2C properties intended to be included in the upstream
device tree?

They do not exist in the upstream devicetree bindings and are not parsed by
mainline drivers, which will cause schema validation errors during make
dtbs_check.

> +
> +	status =3D "okay";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	reg_backlight: reg_backlight@45 {

[Severity: Low]
Does this node name violate the expected naming convention?

It seems it should match the ^regulator(@.*)?$ pattern inherited from
regulator.yaml to avoid dtbs_check schema validation errors.

> +		compatible =3D "raspberrypi,touchscreen-panel-regulator-v2";
> +		reg =3D <0x45>;
> +
> +		vcc-supply =3D <&reg_dsi_touch>;

[Severity: Low]
Is this vcc-supply property supported by the binding?

The raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml specifies
additionalProperties: false and does not define vcc-supply. Since the panel
explicitly enables reg_dsi_touch anyway, should this be removed to pass
schema validation?

> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		#pwm-cells =3D <3>;
> +	};
> +};
> +
> +&mdss0_dsi0 {
> +	vdda-supply =3D <&vreg_l1c>;
> +
> +	status =3D "okay";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	panel@0 {
> +		compatible =3D "raspberrypi,dsi-7inch";

[Severity: Low]
Is this missing the mandatory fallback compatible for the ILI9881c driver?

According to Documentation/devicetree/bindings/display/panel/ilitek,ili9881=
c.yaml,
this should be an array of two strings containing the specific panel and the
fallback ilitek,ili9881c.

> +		reg =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-rpi_dts_ov=
erlay-v2-0-a4989322ce00@oss.qualcomm.com?part=3D2

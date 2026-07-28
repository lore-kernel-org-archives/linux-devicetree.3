Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05737C902
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256178; cv=none; b=aTAUMCfvttLunuyhEV985La2c7EqEB0FPQ98TNgZv/DZvteVNZsY5umO/4tU6SQZPSYePNTmcPuj3i0Borx9M0qpK7rcHv3sVQIKr+6KXyb23O7Wfgo5141kG6+InRssRDSYA+4WHjHuFJxtsPSc98PB0S6a/nwlGYTN4WCc/GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256178; c=relaxed/simple;
	bh=489Ayo/RBcyK87e0Elaxl82x+FLN5tv8qEO1gO+qhJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u1+UYUGtHLYi9dmijxqPIUonYAMcCXB7TBep2glKszVIxRe/Qo+O4E9IsicWEl0xBzYqdLvwBwuTnA9ZsO39MKkBKmQOeQboLkP2T1y9Xx5Kb8P+oU4/tP41hwN9T4fMj+BE6UZyih6txiAZi2MJ4VexRk9t5qqSr8Q2PIKrgXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqJqapZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqJqapZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77AA1F000E9;
	Tue, 28 Jul 2026 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785256177;
	bh=QZj/5p0LAz1CI+ka+ex3k4TwSujqXNdOzhYIt9cRvHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqJqapZZfnETHcehPo2gIGPZ+GVs4Wtk8/xRW4RPKiW0CLsc6wHsRRlOh9u1BQlrh
	 Ki5tl9TC1jZ82n/1VKorMrfAVAiiIB8aT/i9MYLjJ9YeXrOzhZtaKJLfJO0w7ft3SN
	 QQgIMOEZlNoNm5H4Pv40QGQtX5YqFmOPwEoUowj25n0eZzejVFxQcX69Sg85eLXTQI
	 19Yo/Km7bBUe2Mp4/E4X5WQMzHhc2wW7lkfphplZYdmjKyJfEpvj/H5jDq2GbNXilD
	 rr3ac/XFB5jAFnJ9mVT6eEYLnNoho2jdztTQliFmIH5IG1iuX0um+QHMFoVBow08D9
	 yWUg7ePkMYXpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-adc5_gen3_dt-v4-4-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
 <20260728-adc5_gen3_dt-v4-4-355f0edece77@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:29:36 +0000
Message-Id: <20260728162936.A77AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between configured pinctrl pins and ADC AMUX channels f=
or system thermistors.
--

--- Patch [4]: [PATCH v4 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC suppor=
t ---
commit abcfdfa0b33d2473870045c8d56652b236189ed1
Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

arm64: dts: qcom: hamoa-pmics: Add ADC support
   =20
This commit adds ADC nodes and defines channels for die temperature, VPH po=
wer,
and system thermistors for various PMICs on hamoa boards. It also wires up
io-channels for the temp_alarm nodes to get temperature readings.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/=
dts/qcom/hamoa-pmics.dtsi
> index 6a31a0adf8be4..17d754d57e189 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi

[ ... ]

> @@ -277,6 +279,134 @@ pmk8550_pwm: pwm {
> =20
>  			status =3D "disabled";
>  		};
> +
> +		pmk8550_vadc: adc@9000 {
> +			compatible =3D "qcom,spmi-adc5-gen3";
> +			reg =3D <0x9000>, <0x9100>;
> +			interrupts-extended =3D <&spmi_bus0 0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING=
>,
> +					      <&spmi_bus0 0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#io-channel-cells =3D <1>;
> +			pinctrl-0 =3D <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
> +			pinctrl-names =3D "default";

[ ... ]

> +			channel@14a {
> +				reg =3D <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +				label =3D "pm8550_gpio_01";
> +				qcom,ratiometric;
> +				qcom,hw-settle-time =3D <200>;
> +				qcom,pre-scaling =3D <1 1>;
> +			};
> +
> +			channel@14b {
> +				reg =3D <ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +				label =3D "pm8550_gpio_02";
> +				qcom,ratiometric;
> +				qcom,hw-settle-time =3D <200>;
> +				qcom,pre-scaling =3D <1 1>;
> +			};

[Severity: Medium]
Is there a mismatch between the configured pinctrl pins and the ADC AMUX
channels being read here?

The pinctrl explicitly configures GPIO3 and GPIO4 (sys_therm_0_gpio3 and
sys_therm_1_gpio4) as analog inputs for the system thermistors. However, the
channel definitions above use ADC5_GEN3_AMUX1_GPIO (GPIO1) and
ADC5_GEN3_AMUX2_GPIO (GPIO2) with labels pm8550_gpio_01 and pm8550_gpio_02.

Could this cause the ADC to read from unconfigured pins and return floating
temperature values, while the actual thermistor pins remain unread?

[ ... ]

> @@ -301,6 +433,18 @@ pm8550_gpios: gpio@8800 {
>  			#gpio-cells =3D <2>;
>  			interrupt-controller;
>  			#interrupt-cells =3D <2>;
> +
> +			sys_therm_0_gpio3: sys-therm-0-gpio3-state {
> +				pins =3D "gpio3";
> +				function =3D PMIC_GPIO_FUNC_NORMAL;
> +				bias-high-impedance;
> +			};
> +
> +			sys_therm_1_gpio4: sys-therm-1-gpio4-state {
> +				pins =3D "gpio4";
> +				function =3D PMIC_GPIO_FUNC_NORMAL;
> +				bias-high-impedance;
> +			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-adc5_gen3_=
dt-v4-0-355f0edece77@oss.qualcomm.com?part=3D4

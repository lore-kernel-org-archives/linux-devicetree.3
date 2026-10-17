Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAAD3B2FCA
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259041; cv=none; b=ke//XLHFv/3s45hm/A207qq6y1JVFq7UoY0Uxmor+QVDWrc9fva2R/+24+O6gBxuRw3v16dFJJN6KAZgZ4WueBHMyg+Udn5DJJS4L+MQGlDk6XQcJ8yCWpAo7F00uhYYQklQnk3xbMGSSwN4K9rPTipRrveqxMH+b35i7BTKPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259041; c=relaxed/simple;
	bh=0nXyg9cVcoscPsYcY/a+BPtBctyIfAwx2jJ1VO972Nw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sInePwrFM2YnQtNx/0mdZuHeX1v7wc+WZjmHlfT1il79zLM4CdOOjeD8qqSz0E4G1QEp/mf7fbT/Hc/XE8m3Qaolo+cqXt5gGVLitZgPk0t/3Ut6fUuD+YikNrDOrNDFhRErLtkVCZxUa7J9q3HouW1LnRSQ1i8iEI6IgGYeCPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=na0UhTOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="na0UhTOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11C31F000C5;
	Sat, 17 Oct 2026 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259040;
	bh=/vYJbLNdTb8nPudpVveDb/rlrJfACCvNyCfrsHenUlw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=na0UhTOsNGvprh4Hb8WKR7dc3glYHul1k8Wv2FeV7KBp5dBEizCP/rb9LsnXyV8hY
	 4fhDlbNdrWPWQxx+TlJGbksZhHlbKM0CQ2ll1k2QzwDWWaDuDLqNVZwHijr8y+LTw8
	 YW3xrAENhYRildu2xfndcjhT5SPKh/LKaEmExQ9qn54e/IZiFUjR1n5/oFLgvJ9rg1
	 voQiUYMyrX2UaeI+4empGmSY1Kci+CtH7yvhzAw0dOiYpkm3nh8e42wZ4lBugxc9HO
	 H/JDChbD/QmQ2wWwfg3802GMRQmBOg62YhQq0Is5F6ZdnJTWslXLGVbiWEhTa8CYO0
	 JkW6RJyTbUgmA==
Message-ID: <sashiko-outbox-175713@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christoph Rudorff" <chris@rudorff.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-iio-light-gp2ap002-v2-3-d6879767a446@rudorff.com>
References: <20261017-iio-light-gp2ap002-v2-0-d6879767a446@rudorff.com>
 <20261017-iio-light-gp2ap002-v2-3-d6879767a446@rudorff.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 17:43:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: missing pinctrl properties on J5 proximity sen=
sor nodes
- [Medium] iio: light: gp2ap002: premature regulator disable and reversed s=
upply order
--

commit acd01033cc23e7bb1ae4313e5e36f583020f5515
Author: Christoph Rudorff <chris@rudorff.com>

arm64: dts: qcom: msm8916-samsung-j5: Add proximity sensor

This commit adds the Sharp gp2ap002s00f proximity sensor, its regulator
supplies, and associated pinctrl states to the Samsung Galaxy J5 device
tree.

> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi b/ar=
ch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
> index 697f25d51d9d0..292e7d8b85a4b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
> @@ -149,6 +149,14 @@ &pm8916_resin {
>  	linux,code =3D <KEY_VOLUMEDOWN>;
>  };
> =20
> +&pm8916_rpm_regulators {
> +	pm8916_l17: l17 {
> +		regulator-name =3D "proximity_vdd";
> +		regulator-min-microvolt =3D <2850000>;
> +		regulator-max-microvolt =3D <3100000>;
> +	};
> +};
> +
>  &sdhc_1 {
>  	status =3D "okay";
>  };
> @@ -248,6 +256,13 @@ sdc2_cd_default: sdc2-cd-default-state {
>  		bias-disable;
>  	};
> =20
> +	proximity_int_default: proximity-int-default-state {
> +		pins =3D "gpio113";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
>  	sensors_i2c_default: sensors-i2c-default-state {
>  		pins =3D "gpio31", "gpio32";
>  		function =3D "gpio";
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64=
/boot/dts/qcom/msm8916-samsung-j5.dts
> index ba8650971d6a9..efd6c0357d537 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> @@ -8,6 +8,14 @@ / {
>  	model =3D "Samsung Galaxy J5 (2015)";
>  	compatible =3D "samsung,j5", "qcom,msm8916";
>  	chassis-type =3D "handset";
> +
> +	reg_vled_proximity: regulator-vled-proximity {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "proximity_led";
> +
> +		gpio =3D <&tlmm 73 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
>  };
> =20
>  &accelerometer {
> @@ -19,6 +27,21 @@ &blsp_i2c5 {
>  	status =3D "disabled";
>  };
> =20
> +&i2c_sensors {
> +	proximity-sensor@44 {
> +		compatible =3D "sharp,gp2ap002s00f";
> +		reg =3D <0x44>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <113 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply =3D <&pm8916_l17>;
> +		vled-supply =3D <&reg_vled_proximity>;
> +		vio-supply =3D <&pm8916_l5>;
> +
> +		sharp,proximity-far-hysteresis =3D /bits/ 8 <0x2f>;
> +		sharp,proximity-close-hysteresis =3D /bits/ 8 <0x0f>;
> +	};
> +};

[Severity: Medium]
Also, looking at the preceding commit in this series ("iio: light: gp2ap002:
add led power supply") which binds to this proximity-sensor@44 node and
manages vdd-supply, vled-supply, and vio-supply:

drivers/iio/light/gp2ap002.c:
static const char *const gp2ap002_supply_names[] =3D {
	"vio", "vdd", "vled"
};

static void gp2ap002_remove(struct i2c_client *client)
{
	...
	pm_runtime_get_sync(dev);
	pm_runtime_put_noidle(dev);
	pm_runtime_disable(dev);
	regulator_bulk_disable(NUM_SUPPLIES, gp2ap002->supplies);
	iio_device_unregister(indio_dev);
}

In gp2ap002_remove(), pm_runtime_get_sync() resumes the device through
gp2ap002_runtime_resume(), which enables the regulators, configures the
sensor, and calls enable_irq(gp2ap002->irq). Calling regulator_bulk_disable=
()
before iio_device_unregister() powers off the sensor while its IIO sysfs
interface is still registered and its interrupt line is still active. Can
concurrent gp2ap002_read_raw() calls or a VOUT falling-edge interrupt into
gp2ap002_prox_irq() upon power collapse issue I2C transfers to the unpowered
sensor?

In addition, placing "vio" at index 0 and "vdd" at index 1 in
gp2ap002_supply_names[] causes regulator_bulk_disable() (which iterates in
reverse from NUM_SUPPLIES - 1 down to 0) to disable VDD before VIO during
gp2ap002_runtime_suspend(), probe error paths, and gp2ap002_remove(). Doesn=
't
this reverse the power-down sequence where VIO was previously disabled befo=
re
VDD to maintain VIO <=3D VDD?

> +
>  &pm8916_codec {
>  	qcom,micbias1-ext-cap;
>  };
> @@ -30,3 +53,12 @@ &touchscreen {
>  &usb_hs_phy {
>  	qcom,init-seq =3D /bits/ 8 <0x1 0x19 0x2 0x0b>;
>  };
> +
> +&tlmm {
> +	proximity_ldo_en_default: proximity-ldo-en-default-state {
> +		pins =3D "gpio73";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +};

[Severity: Medium]
Should reg_vled_proximity and proximity-sensor@44 reference these pinctrl
states via pinctrl-0 and pinctrl-names?

Both proximity_int_default (for gpio113 in msm8916-samsung-j5-common.dtsi)
and proximity_ldo_en_default (for gpio73 in msm8916-samsung-j5.dts) are
defined under &tlmm, but neither node references them with pinctrl-0 and
pinctrl-names =3D "default".

When drivers/regulator/fixed.c and drivers/iio/light/gp2ap002.c bind to
reg_vled_proximity and proximity-sensor@44, pinctrl_bind_pins() finds no
pinctrl properties on either device node, and drivers/pinctrl/qcom/pinctrl-=
msm.c
only sets pinmux direction and function on GPIO/IRQ request without applying
pinconf settings like drive-strength and bias-disable. Also, since
proximity-sensor@44 is only added in msm8916-samsung-j5.dts, should
proximity_int_default and pm8916_l17 be in msm8916-samsung-j5.dts as well,
rather than msm8916-samsung-j5-common.dtsi where they remain unused on
msm8916-samsung-j5x.dts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-iio-light-=
gp2ap002-v2-0-d6879767a446@rudorff.com?part=3D3

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576680;
	b=b+6V5DxZxDuq28urZ61EVngRiSuW1gmiATpbcOvoT/iULqDQcdbd1KYml+s5u5c4ODQX
	 NkcNLra8lTjR/E1isBneqg+ZFE68I1SeTGjrScpMtTrKi9hX6tV2DQU32gFz7/XMItRhr
	 oPQlqp6b+FMWm4hnYP/+hgLsLg6MJ0CeXc+G57Vft7H0UAHC4ewYwr3wwMSKCx2VYsQBy
	 BMC3ovYAwRbyjXXwMpRWaYs5X3EAXc/EjOz9erc9guvdAyPn6wqtWgPMAT+PZCCy09WP4
	 j3UqPrGuvXMZufBluF8ag1ySyzMolNqHTeza58m2l37j7fQw/XtdBSI6rJP1xp3SiGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576680;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xozY84m972HaNKrwKhJYk/HUZLFUYAISYmJy3d7X/Uo=;
	b=Xcvic4k/E9XZ7Wjas86Bd1gOeXhUMLfDFroQRx+dHG8UP/P8odRDhSiREx8vYWeX1awH
	 kN/rAuFkojX5Ju4vJ1ubfx6Mmvv1MCiKV4VRk/xJBpYHJfrpcPo1Zv4vTDyKY0IdmHRrm
	 ja+JItJlFHFwPWKUxQbr5oW8lVJoNgzOYvHp+FyllL8VVq2QIsiJ3EPgYtMBgFbX+PnUe
	 T8Vim3bEOWF8cnHZwjIGkPiOPVeb5AuyX3PoT4ifsBNX/88XksTdizTfikj6FaBMRxCOZ
	 qE01DU1cvTE1eWmg4EVKwIii5HbbJYyqDVHvfFMJrYxlRponywcqWRt2PnxhZFR0Qug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gc6tpBCH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F09606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gc6tpBCH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3361F000C1;
	Sun,  1 Nov 2026 23:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793576680;
	bh=xozY84m972HaNKrwKhJYk/HUZLFUYAISYmJy3d7X/Uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gc6tpBCHI0GLFRjb8mLaeEU4pIxwmvlgj2Cn41Ieiq+7oz5BfNhE96s3ngOmwyeZR
	 fLhmWrJIOdz3twGv856RAlqvK7+i78YM33V5oY6khRoSfMpfztCS0/u3RMdy8EbS63
	 DCw+6+UjvnCcr/zuDG72Uksc6NBAxD6eVq5vG2wDWcChxM8KAtSfqWUSX05wQL+b0t
	 aLcyNW5/v6Rg5ttbXxVq3XKKjBP/N/uZ8/MxEBNce3QwUJFJxwzqhiDiuOqc8BmQzQ
	 1zYdubpD2bN4BC+2QjWQ5uBzHJBorK3rWTNBWfMH/HbZrfiM6T6fjhwxzJteKl++Bi
	 dcM+PKsTzErSQ==
Message-ID: <sashiko-outbox-192768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 23:44:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: wrong io-channels specifier on rear_cam_sensor
- [Low] arm64: dts: qcom: misplaced xo-thermal, unused includes, and style =
issues
--

commit ac86db420f5582034afb81e70777f975abaf47c9
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Add PM6150L thermals

This commit adds ADC channels, ADC_TM channels, generic-adc-thermal sensors,
and thermal zones for the thermistors connected to PM6150L on the Sony Xper=
ia
10 III (lena).

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 4e9707712a651..487ef75f2f1de 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -12,7 +12,9 @@
>  #define PMK8350_SID 6
> =20
>  #include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -70,6 +72,20 @@ lcdb_dummy: regulator-lcdb-dummy {
>  		regulator-boot-on;
>  	};
> =20
> +	msm_therm_sensor: thermal-sensor-msm {
> +		compatible =3D "generic-adc-thermal";
> +		#thermal-sensor-cells =3D <0>;
> +		io-channels =3D <&pm6150l_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names =3D "sensor-channel";
> +	};
> +
> +	rear_cam_sensor: thermal-sensor-rear-cam {
> +		compatible =3D "generic-adc-thermal";
> +		#thermal-sensor-cells =3D <0>;
> +		io-channels =3D <&pm6150l_adc ADC5_GPIO6_100K_PU>;
> +		io-channel-names =3D "sensor-channel";
> +	};

[Severity: Medium]
Should rear_cam_sensor reference ADC5_GPIO2_100K_PU instead of
ADC5_GPIO6_100K_PU here?

On PM6150L, physical pin gpio6 is routed to ADC5_GPIO2_100K_PU (0x53), and
under &pm6150l_adc below the rear camera thermistor channel is defined as:

	channel@53 {
		reg =3D <ADC5_GPIO2_100K_PU>;
		label =3D "rear_cam_therm";

When gadc_thermal_probe() calls devm_iio_channel_get() for rear_cam_sensor,
adc5_fwnode_xlate() in drivers/iio/adc/qcom-spmi-adc5.c searches the channe=
ls
registered under &pm6150l_adc for a matching channel number:

	for (i =3D 0; i < adc->nchannels; i++)
		if (adc->chan_props[i].channel =3D=3D iiospec->args[0])
			return i;

	return -EINVAL;

Because no channel is registered for ADC5_GPIO6_100K_PU (and adc5_chans_pmi=
c[]
only defines 100K pull-up GPIO channels up to ADC5_GPIO4_100K_PU), probing
rear_cam_sensor fails with -EINVAL and leaves rear-cam-thermal non-function=
al.

[ ... ]

> @@ -115,6 +131,99 @@ active-config0 {

[ ... ]

> +		xo-thermal {
> +			thermal-sensors =3D <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
>  	};
>  };
> =20
> @@ -392,6 +501,99 @@ &mpss {
>  	status =3D "okay";
>  };
> =20
> +&pm6150l_gpios {
> +	pm6150l_adc_default: adc-default-state {
> +		pins =3D "gpio6", "gpio7", "gpio10";
> +		function =3D PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};
> +};
> +
> +&pm6150l_adc {

[ ... ]

> +&pm6150l_adc_tm {
> +	status =3D "okay";
> +
> +	pa-therm1@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pm6150l_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +
> +	pa-therm0@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pm6150l_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +
> +	rear-cam-flash-therm@2 {
> +		reg =3D <2>;
> +		io-channels =3D <&pm6150l_adc ADC5_GPIO3_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +		};

[Severity: Low]
This isn't a runtime bug, but there are a few patch split and style issues
across this change:

1. Earlier in the series, commit ff24120a08d6 ("arm64: dts: qcom: sm6350-le=
na:
Add PMK8350 thermals") added xo-thermal, and the next commit f17bc49f693d
("arm64: dts: qcom: sm6350-lena: Add PM7250B thermals") accidentally removed
it. Re-adding xo-thermal here puts a PMK8350 thermal zone into the PM6150L
thermal patch. Could xo-thermal be kept in the PMK8350 patch instead?

2. The newly added dt-bindings/gpio/gpio.h and dt-bindings/input/input.h
includes at the top of the file do not appear to be used by this patch.

3. Label references at the bottom of the file are sorted alphabetically, so
should &pm6150l_gpios be placed after &pm6150l_flash rather than before
&pm6150l_adc?

4. The closing brace of rear-cam-flash-therm@2 has an extra tab of
indentation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-pdx213-ups=
tream-3-v3-0-cdc3be96d257@erebion.eu?part=3D11

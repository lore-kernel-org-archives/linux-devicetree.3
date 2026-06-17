Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E9B3F54C9
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701969; cv=none; b=e4MkJ0sTJJdlZFISd6LTuvejgB8ppyDi1vcWzaARHi1OU16lsFlEaIlRK9m0THv41gB/PKWf2Mi4c38P+4H30lQvjI6+XtNNAnp8F4upKxrqH1fACLfV8YfbeN0g4FNWopKpjIolCbmiiakss/sXS6MinKYUN6Kw1kxD9C+w4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701969; c=relaxed/simple;
	bh=lbJmgASzPefpd1S6Y07gEkBt+a0EAuk07RGPla3kedc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OvI75XvK2EYt6aPTurrDDVGL8oTuqKAN8mQhm3Pzqpih7CjxUCpe4CC827//WjOZQ+GHLD4wx78x7iRl559N4PchhgdQOu1OcAu1K2v3EViOEL0jTkhJ4b/fc0WyePksuyZlkOsiaFUsbdqAd+qlBQfGpTS/eFK4OCS6uONshSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGOL5MM2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGOL5MM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61DC1F00A3A;
	Wed, 17 Jun 2026 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781701968;
	bh=wHH6bkItYBS73vWI5v2ujYNM1oen/6or+UClc0qcjEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGOL5MM2BK+x8W+BzBhCBSGl+OB6TI/RwgokyOgpkWz3xMj8/KtlQulBnY5bg9JrU
	 rxV4c9uaZvJM6ubyKfefzD3iFWgXUOGMPBvAY36YFmoxYzn7YdTjtk2/5GkwEmMo8P
	 Y6XiXHIZN3siFfQA2GxvmNZJQDXDDaXTQgYhVcYKiLtOHkweBxzaWP/BZoUvV15y2v
	 cKVTdyhnYp8o10GMa0tY0LUFBNieEV8khw1HMo/664vgFrTEsR04INevotVpzrTrID
	 i6Q9JlxAzZAM55RLWliFKQFyqZvrHQ3tvIDXq6ZVBQ8wdK13epqvDUFIyETTaGwe8E
	 xzOw+tqgZHklQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 13:12:47 +0000
Message-Id: <20260617131247.E61DC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch references missing function-like macros (e.g., `ADC5_GEN3=
_AMUX1_THM_100K_PU(1)`) and depends on a non-existent header `qcom-adc5-gen=
3.h`, leading to a dtc syntax error.
--

commit ffba2e8b8d47299d82f0442684ecd38fc3ef60a5
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes

This commit adds the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICs on the system. It also adds thermal nodes sorted by the
sensor channel to maintain coherency.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c6..9356b40a18507 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -205,6 +205,92 @@ platform {
>  		};
>  	};
> =20
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Will this compile correctly?

It appears that ADC5_GEN3_AMUX1_THM_100K_PU and similar macros are being
invoked as function-like macros taking an argument. If the intended header
is missing, the preprocessor might fall back to definitions that do not take
arguments, expanding this to invalid syntax like 0x44(1) and causing a dtc
syntax error.

[ ... ]

> +&pmk8550_vadc {
> +	/* PM8550 Channel nodes */
> +	channel@100 {
> +		reg =3D <ADC5_GEN3_REF_GND(1)>;
> +		label =3D "pm8550_offset_ref";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@101 {
> +		reg =3D <ADC5_GEN3_1P25VREF(1)>;
> +		label =3D "pm8550_vref_1p25";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@103 {
> +		reg =3D <ADC5_GEN3_DIE_TEMP(1)>;

[Severity: Low]
Are we certain this macro expansion is valid?

Similar to the thermal-sensors property above, using ADC5_GEN3_DIE_TEMP(1)
as a parameterized macro could lead to a syntax error if the available
definitions do not accept arguments.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-topic-sm8x=
50-adc5-gen3-v4-0-4af9251731f1@linaro.org?part=3D2

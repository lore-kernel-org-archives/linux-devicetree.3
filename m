Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C417BEBF
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786286166; cv=none; b=WNmmZvmeq6dPYh2/m3ujzy3SpJsCCf440RFPZc52PyyX2hnhphodquVNj3EHoFNq2NaelRtMYMJdBf8Ka6/LGXPS5uzC7q5qrTLgwbqwfUG36Kh2whIzuCuGleCZG/+SAld0YIvBUzM28a7Hc00tBsaXVjmkRCKsjv8mrH5i2Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786286166; c=relaxed/simple;
	bh=asSmC/zu8pqx5RMe5oJ6Byp28vt1ckIwrENwxywQUJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DPdzCpHFuOkqAtxQRnXdK0sGdJICjC8PgalB03R/j0d06YGQGu/FWRe6BgnixsOc0v6aA+/hczahnr6QAlwp4WMoYL2hChiFE4EqvUlWrOFaQRqSqne0Vzz4rlAG2wGBwwzG+Z+hXLhpS0cu6mnUE0RmBmMWADqnbfdPRgXoK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMRTAXos; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMRTAXos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636C61F000E9;
	Sun,  9 Aug 2026 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786286164;
	bh=ampX3rpVKR5yO67K8UzCZeK6eap9gcHyn1w2vVunx6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HMRTAXosddLifbiNs9ajrI3PI+zHA8qNYbtRi4TCZVEZsovNu2eqSkKJG9zEzF31Y
	 I+Fnkx6fiAu5OonePo0GJB470fkMiK4egXGksAGT+1GtU6GgdsQPwmZ91CLhnDIvpq
	 i17OFbLXMnp67iCAzXHvRv6nCpOV6vohJlnsJvVM/Uw2uaPv1w2KPCGgVMMs42nXvI
	 FrppLRE4bwdkZg+z66E7aQQO/Os4nC5kQCo6zA0+cUcThLxBpNNrAl8KOwPEEqNZej
	 wgE9/2HCzTa64xZe8bQUra3ZRr67XKs9556A7GWYWx0jzFwRgqTV0EnN5eyurPdk1u
	 8ud5TeIfGq9dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-shikra_adc_support-v5-4-bf6882d18bad@oss.qualcomm.com>
References: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
 <20260809-shikra_adc_support-v5-4-bf6882d18bad@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 14:36:03 +0000
Message-Id: <20260809143604.636C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The pinctrl configuration incorrectly targets PM8150 GPIO2 and GPI=
O3 instead of the actual GPIOs (GPIO1 and GPIO4) used for the thermistor AD=
C channels.
--

--- Patch [4]: [PATCH v5 4/4] arm64: dts: qcom: Add PMIC thermal support fo=
r Shikra IQ2390S SoM platform ---
commit 8dee766ba238404c7e2305d90f5d025e6c4cba41
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

This commit adds ADC channels for system thermistors used for thermal
mitigation on the Shikra IQ2390S SoM platform. It also adds ADC_TM nodes
for the pa, quiet, and msm thermistors along with their thermal zones.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> index 4ff97945274dd..ede34d82de76e 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi

[ ... ]

> @@ -76,7 +115,81 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
> =20
> +&pm8150_adc {
> +	pinctrl-0 =3D <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;

[Severity: High]
Does this pinctrl configuration specify the correct GPIOs?

The pinctrl nodes target gpio2 and gpio3, but the gnss_therm and pa_therm A=
DC
channels defined below use ADC5_GPIO1_100K_PU (GPIO1) and ADC5_GPIO4_100K_PU
(GPIO4). Leaving GPIO1 and GPIO4 unconfigured as high-impedance inputs may
corrupt the analog measurements and lead to incorrect thermal throttling.

> +	pinctrl-names =3D "default";
> +
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		label =3D "msm_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};

[ ... ]

> +	channel@52 {
> +		reg =3D <ADC5_GPIO1_100K_PU>;
> +		label =3D "gnss_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@55 {
> +		reg =3D <ADC5_GPIO4_100K_PU>;
> +		label =3D "pa_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +};

[ ... ]

> +&pm8150_gpios {
> +	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
> +		pins =3D "gpio2";
> +		function =3D PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};
> +
> +	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
> +		pins =3D "gpio3";
> +		function =3D PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-shikra_adc=
_support-v5-0-bf6882d18bad@oss.qualcomm.com?part=3D4

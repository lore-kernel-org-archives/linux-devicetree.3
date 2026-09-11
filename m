Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0B310645
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145345; cv=none; b=MNl2fPnUA/osv/3Dbnv8N7ZQvh7pvs14/vXBiGLicTOAwTxBNFC7H0V6I2FIDW1ca3xYeA714GY8jZnnfP50Wditr3CmkEpF490gvtKma2A4gbUy6PEoSOUqLSUtn5zUCJ73jJtzfz42LgUDRbZN6e2hc613UXem8+YUiWKJtEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145345; c=relaxed/simple;
	bh=d4s+s96VHQJpmGfJ08n1vuewhhd5qlHxrKFWrCFa278=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mHI7nmIkD2Z+1EZr+CNtlir+L08fCGc5V5goq6Ji8OwA7E7aIICLWoZe1BffXajndfazycAMhcAPym+4pw7lYHwqjIP14ISaGznwvXCjylvGB/nPnL8Wizn+wQmqTP66E1v+xLoqp4Qa9lJ7w2lQ3q9/jZdeGKlro0AaD34a5R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT7Q4/rP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT7Q4/rP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DA61F000FF;
	Fri, 11 Sep 2026 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789145343;
	bh=hCY1U7eVhNOclZLfD4E/0Di9zUdB1FWXUXi/a+htYIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NT7Q4/rPs3IyvzhcjNghUlT9OVUQ9ZpaM59gIjE7wkwnEBazQOsdKdMqZRQUGST+4
	 YZJXfMyu7gwWpYJ9O8eUL1yReBZRbb6kTFP4xmz9/bAGywX7zodrtFrFSlTcbEgDw3
	 fPT/hHraPLVmlJC8Wnuv5Wo9wmAzLe1dulOSeL3QIcVsBxV43WbMQfKLWRkNOv00vY
	 0l0s50lVaot8135VQ8bIplGYlmrPPPvptRXFQqAz6b+90IkH2XYriR8SJoefWMnvvf
	 UvUtvgAzmA1wkVeNSsXGQzHE4zyVVUB9z+8zqB0bvZ6l2SKcMq9ek2Z5gQxafLctrw
	 VOLFWA5z95+Dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 16:49:02 +0000
Message-Id: <20260911164902.A5DA61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The pinctrl configuration for the PMIC ADC incorrectly sets up PMI=
C GPIO2 and GPIO3 for analog input, but the configured ADC channels are act=
ually mapped to read from PMIC GPIO1 and GPIO4.
--

commit 16888acda3cf4c853fe7f5fde0d880b0e2116d1a
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

This commit adds ADC channels for system thermistors which are used for
thermal mitigation. It also adds ADC_TM nodes for pa/quiet/msm thermistors
along with their thermal zones.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> index e119ace54e588..a6769364c1921 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
[ ... ]
> @@ -76,7 +115,81 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
> =20
> +&pm8150_adc {
> +	pinctrl-0 =3D <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
> +	pinctrl-names =3D "default";

[Severity: High]
Does this incorrectly assign the pinctrl states for GPIO2 and GPIO3,
rather than GPIO1 and GPIO4?

As seen in the channels defined below, the gnss_therm and pa_therm are
mapped to read from ADC5_GPIO1_100K_PU and ADC5_GPIO4_100K_PU.

> +
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		label =3D "msm_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@4e {
> +		reg =3D <ADC5_AMUX_THM2_100K_PU>;
> +		label =3D "quiet_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
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
>  &pm8150_gpios {
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

[Severity: High]
Should these pinctrl states configure GPIO1 and GPIO4 instead?

Without high-impedance configuration on GPIO1 and GPIO4, their default
digital states or internal biases might interfere with the analog thermistor
voltage. This can result in incorrect temperature readings, potentially
causing the system to either overheat or spuriously shut down.

> +
>  	vol_up_n: vol-up-n-state {
>  		pins =3D "gpio6";
>  		function =3D PMIC_GPIO_FUNC_NORMAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-shikra_adc=
_support-v6-0-e4b2da5cd55c@oss.qualcomm.com?part=3D4

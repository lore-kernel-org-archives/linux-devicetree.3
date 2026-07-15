Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1763C2931D1
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102321; cv=none; b=TW/Q57e6tWewI7JCcLsALW8iPtJDU3E7eu41fMEiNCcHHnt0QLnDxAcuWgolUFrtlwvxP8vs++b4GJ6NUsEUXPq2+G0PaSRl57ZYR2hjXBJqzO+VbBLVl5FQOmf+OGo63AhjbjZUJfFXWQrOOYZEdhWa1ToKVlYGq3Wg5htvJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102321; c=relaxed/simple;
	bh=LkpO0tnGsZMb5t8iMQeCtxkCUVzeU73dpwO959Eo93k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s65AZfl66sxh/AuPGjIvRL6NCA2VKR/t42NDe6UFvTR6wQC0Xpd36Zt1gIEetYT+Do3mYD9sutJ1gdS/qeX43xldNzYfwWBz8uDhdjyHF8y6ozDAJQStNmAMtyOfONAACRF+GNUBC+aCUdiFtpTP150FcqvvxOF/POs0GKQ86aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naoOr7K5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naoOr7K5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05821F000E9;
	Wed, 15 Jul 2026 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784102320;
	bh=moFLjJFa94jBTakZEpTYQAIJRzKAQpfyiG4QVaZtvV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=naoOr7K5Ucfc5XFQ+Kid+RRHV1zCjdVeK3Innj8bZ45Ut+Kt6MqEvccINRjmodT3n
	 PYnRCk1Gg/zWJnPFJy2u5FfCKGoxpAERVWtSMbtH2/QH0rKZqnlZgVdSuOiHDvqaBS
	 HEACjGgJLM/xZ7r1cC4Kfm5CNRO9VqxzwH806kpNdR7y1x3+Jn+pvSlU82Y6F8c0Wl
	 sZerL6zZYzi9/+zw1oPiXGxdbKsQHlAI0u8kGub0r0ybfLSzCK4yPyHTdbJ2FUqOYR
	 t4BWYO8k0PaByANLg9g8q4gUqO3OkySA8fArAQJKFXf4wSdXQAlaugDYfRAZU1Lwyz
	 pjt3fTJXjaDwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-shikra_adc_support-v4-4-5e07b6d21429@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
 <20260715-shikra_adc_support-v4-4-5e07b6d21429@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:58:39 +0000
Message-Id: <20260715075839.B05821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Mismatched PMIC ADC channels and pinctrl configurations for thermi=
stors.
--

--- Patch [4]: [PATCH v4 4/4] arm64: dts: qcom: Add PMIC thermal support fo=
r Shikra IQ2390S SoM platform ---
commit 5e80ce0d3c9c4dc567c3d3d335a508d11f309e50
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

This commit adds ADC channels for system thermistors used for thermal
mitigation. It includes ADC_TM nodes for PA, quiet, and MSM thermistors,
along with corresponding thermal zones.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> index 73945bf42112d..9ab0b44b00bed 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi

[ ... ]

> +&pm8150_adc {
> +	pinctrl-0 =3D <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
> +	pinctrl-names =3D "default";
> +

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

[Severity: High]
Is there a mismatch between the pinctrl configurations and the ADC channels
being used?

The pinctrl-0 property specifies configurations for gpio2 and gpio3, but the
ADC channels instruct the hardware to read from ADC5_GPIO1 and ADC5_GPIO4.

Could this result in the gnss_therm and pa_therm thermal zones reading
garbage data since they point to unconfigured PMIC GPIOs?

If the unconfigured pins float to a voltage that translates to a temperature
above the 125=C2=B0C trip point, it might cause spurious system shutdowns or
unnecessary throttling.

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
> +

[Severity: High]
Because these configurations explicitly target gpio2 and gpio3 instead of t=
he
pins actually used by the ADC, does forcing them into high-impedance mode
risk breaking or interfering with whatever hardware is actually connected
to them?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-shikra_adc=
_support-v4-0-5e07b6d21429@oss.qualcomm.com?part=3D4

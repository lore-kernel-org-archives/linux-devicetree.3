Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8151B413D8E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543721; cv=none; b=CBPMhudWXqj1oeuW10agNvJh5+WCHufErJKXuHTaqNIwq4zm3BUmeHyV/1b3qTwoi9RrbRDtS974sN1oNNYYDW1d6mohvdflXqNdAnL8i2P8tNZIBlbS63plTuMnDvJ6NfPPTwyG46aQVvHuwNLiOMnRpfHQtUEfylLdGCkK3oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543721; c=relaxed/simple;
	bh=v5KfdHvCnscjRhOMhbFDkPwMF97IeaiHjRG4YZOt1pA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NX2Ki4mNeXycNhYUbuj/aeknlZxRqdlVHXVsmBeE3D+MXLV2Q9Q9iaX8l4CmS4TvJqA1jfceEZHs9wNpPnQmIydFSMBqirAy1zZmYDVIZ+Bcfd8sE2CZAv405z92I9TmOxmxYl+cN1Uy8gfNneXDGn0j/h96coMcSbV3ks+GqYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfWn0k8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfWn0k8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A851F00A3A;
	Mon, 15 Jun 2026 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543720;
	bh=9fXwfg/nvfuQa1c+eP6P1Jrt2Jf79sBmJYAoXlT3AlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AfWn0k8U+piwrbtCDyuDVsYMT5G0JXFm82FqfzvO4kKipbdlW0zP3LSxAp5ZiYiBa
	 dEAJDt7t1dnhbz1oDrOnCbIa3cfjZ9mDhePsKh/jrEasy5WrmPnwqWJ5RZ5tUHRC3G
	 XnB+lIg3Ydjb/OMYSJtwLddwfe/y3Hx4cwzfHy0dbq4NCC1KO4q+K8JCNKwmt6XXdF
	 028+QaImy+tA1QgaON+bgLIPBvPTxTOoBArWjE/UWQoMecUK6zwx422cAUu5EZMfAD
	 JGzHG1QJsZbSKIdLu4PMUVPOkiKPW34eE6x98Kicrd6QCZMdkG4vbhMgXM69ysgj+S
	 D/jDVnVhSLR/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-3-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-3-216a2b5ccb85@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:15:19 +0000
Message-Id: <20260615171519.F2A851F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `qcom,hw-settle-time` for the `channel@749` 100k=CE=A9 p=
ull-up thermistor (`pm8550b_wls_therm`), leading to inaccurate temperature =
readings.
- [Low] The ADC channel nodes are not sorted by their unit address, violati=
ng standard device tree conventions.
--

commit 4a45cdf2d6ed588ab63165c08752b51ef046be4f
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
   =20
Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c6..8405cb9e0d6db 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts

[ ... ]

> +	channel@18e {
> +		reg =3D <PM8550_ADC5_GEN3_VPH_PWR(1)>;
> +		label =3D "pm8550_vph_pwr";
> +		qcom,pre-scaling =3D <1 3>;
> +	};
> +
> +	channel@144 {
> +		reg =3D <PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(1)>;
> +		label =3D "pm8550_msm_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,adc-tm;
> +	};

[Severity: Low]
This isn't a bug, but should channel@18e be placed after channel@144
to keep the nodes ordered alphanumerically by unit address?

[ ... ]

> +	channel@78e {
> +		reg =3D <PM8550B_ADC5_GEN3_VPH_PWR(7)>;
> +		label =3D "pm8550b_vph_pwr";
> +		qcom,pre-scaling =3D <1 3>;
> +	};
> +
> +	channel@78f {
> +		reg =3D <PM8550B_ADC5_GEN3_VBAT_SNS_QBG(7)>;
> +		label =3D "pm8550b_vbat_sns_qbg";
> +		qcom,pre-scaling =3D <1 6>;
> +	};
> +
> +	channel@747 {
> +		reg =3D <PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(7)>;
> +		label =3D "pm8550b_usb_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,adc-tm;
> +	};

[Severity: Low]
Similar to the above, this isn't a bug, but should channel@78e and
channel@78f be placed after channel@747 and channel@749 to maintain
proper unit address sorting?

> +
> +	channel@749 {
> +		reg =3D <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
> +		label =3D "pm8550b_wls_therm";
> +		qcom,ratiometric;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,adc-tm;
> +	};

[Severity: Medium]
Does this node need qcom,hw-settle-time =3D <200> like the other 100K
pull-up thermistor channels in this patch?

Without it, the ADC measurement falls back to the default settle time,
which might be insufficient for this high-impedance path and lead to
inaccurate temperature readings for the pm8550b_wls_therm channel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm8x=
50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org?part=3D3

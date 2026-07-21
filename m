Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34946D55F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648984; cv=none; b=mXfsd2br/bigYyntSW5PaE6skZgJcxXRsYiNtFRmPxvlIZMsw0hGS/q+mCMKWuNTSwg8nu+4QGzJATsnwLd6EVRNGFsClaF0+H6te7GoZ/wbuzwlcw5P4qQOk68/8tnfWHosMftScztB57f4ANsO0F6t6S1OrRhjnj7WxvmysDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648984; c=relaxed/simple;
	bh=V6HnFvhryftn/FLKlNyf++VUH4fBiHPjr2xajt32Dys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gDIy/jbu9TrmlFYsUl6w34UBUBKvyk0WIlHzfvAcDUT/fIrpecu021CcWbtdGGmRSFzQaYfl2V8NbXmlA1BQoR5DeKR+DXQ3oTLv9WHCdEcMk9qm70TVAfC8631YEN7pvXg0Jsr7+L2Ur9zw6t+pFGFVEV5ZDju1nHbDdBo/b44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3PKf5S8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3PKf5S8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD441F000E9;
	Tue, 21 Jul 2026 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648983;
	bh=xH80VBxXN+35CSeL87lgIz5/nnxbdZK5I+K3FUKz6JU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z3PKf5S8W9izoT9yrlloplOEKTlYqmXqfRfKxsdws1efudJ8/jWr06T0wLim4Acf8
	 rart1UUkgWuQR/vvUBaKHG3KS2J2S1oFOutp/UYG3bzQ2Rn3Fujqx6dUq7QVrcSuSm
	 krz+Z9MYH5NJyKRG4A9aksBJ9NRT+kbMz08sG/MDCdF5wvRF8Guj/m2O4tN0KOiW4o
	 oicqC2kXW2MzV8aCfvqgLEBJ2gOKxTi8o+VF+WycfwCNYk9eL962M5S2G+KzDNfUx3
	 xXciVfaeoCic4PT119eZz5pJQR+95QQRm+yDVfNSX5TZSmCKtRvbE9MLHKDPa8qBfX
	 t+e3q+vTuXLlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-2-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-2-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:49:42 +0000
Message-Id: <20260721154942.DCD441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing device tree header `qcom-adc5-gen3.h` and undefined paramet=
erized macros cause DT build failures.
--

--- Patch [2]: [PATCH v6 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC ch=
annels and thermal nodes ---
commit 10ac856253ee6a9bfd1b29cd5e0fd011493eaf4e
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the other PMICS on
the system. The thermal nodes are sorted by the sensor channel to be cohere=
nt
with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c6..f0cee98df35de 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
[ ... ]
> @@ -205,6 +205,92 @@ platform {
>  		};
>  	};
> =20
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Does this device tree compile cleanly? It looks like the macro=20
ADC5_GEN3_AMUX1_THM_100K_PU(1) is parameterized, but the necessary header
(qcom-adc5-gen3.h) doesn't appear to be included or added in this series.

Without the proper header definition, existing parameterless macros might
cause this to expand into invalid syntax like 0x44(1) during the device
tree compilation phase.

[ ... ]
> +	channel@144 {
> +		reg =3D <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Another instance of the parameterized macro usage here. Is there a missing
patch in this series that adds the qcom-adc5-gen3.h header and macro
definitions?

> +		label =3D "pm8550_msm_therm";
> +		qcom,ratiometric;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-topic-sm8x=
50-adc5-gen3-v6-0-a507f4a1e537@linaro.org?part=3D2

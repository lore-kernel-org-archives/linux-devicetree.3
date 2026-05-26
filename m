Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DA3B0AEA
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812203; cv=none; b=XpN8XwE4Wqx67RzP7gD2oM+esLs75dxipQUDIKT1T46RgnMkk5nZf+m//f2kCzevcZ4XRRM3d441hRgpw5iDdLf63vJxWzXdpLL+M0FEuXn6Na65Ag8lf1RbMUqSejkeM64+xLvotV3H/uUvRnkp2P3lGgfP7C+lpi6l1827Lns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812203; c=relaxed/simple;
	bh=Q6bYMtYZ8jh0hj1YjPhP9pdD/mMOZFj19j9mpcP4EBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lhj+xd6Z+XdrFoMvUFlnXobk43vwoQ8MkG7vPY2X0ICuqP/r/ijv6cx01/csYcrX0kiZYefy7tPgq35X9GZqUsb3BdiYsR1as/wGGJek8zzxHmFOdwWGPntP91zEs4j4HNJY7rcqqKXyvDHaS6mHoCiAQJjbSyCbJk4blVZxolk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVuSbt/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVuSbt/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4B91F000E9;
	Tue, 26 May 2026 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779812199;
	bh=H+3ClvZW5MHMHDIqU+gvTuSfQv2ysx//KaRkX9qwnnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVuSbt/Y/Olh8TKi3hrx0OP4Z1WiTILwbiYknjY95jKe/lU8Vff0chxnWxMYREAGX
	 sYr3+XbLfkB/DPIhKVFbGPP24d9OEr0up9WKjm02vRjmDiS3mVPQ4YLJDxuEGPAOM8
	 AMcOcfpjwKmpymw8P6snISJULwCoH6tqUY9DlEWMhRjdEQTzs+MNEZuPMCDcycnZdd
	 PzOFtcDXmqcO1crckvwggrzBJW8QnqFrC2og2Y0+vV/3mTp8+gr0TaA/6c51XbT5hN
	 Avdzn6DNV0NEGW3EbiQ3JsNR01ghE1d6bo6cf15v54V90En7HuJZhsVzR1EN5u5sWV
	 Kgkrig9QTmfIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: kodiak: Fix up LPASS TX macro
 v9.4 control names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260526-sc7280-tx-macro-v1-2-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-2-1aad6900fec0@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 16:16:37 +0000
Message-Id: <20260526161638.5A4B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Critical ABI Breakage: Unilateral ALSA control rename breaks u=
serspace UCM and DT backward/forward compatibility.
- [Low] Binding Schema Consistency: YAML device tree binding example retain=
s obsolete audio routing strings.
--

commit e8146d6a5dc9b62baace794be0e79e57fb705798
Author: Luca Weiss <luca.weiss@fairphone.com>

arm64: dts: qcom: kodiak: Fix up LPASS TX macro v9.4 control names

This commit updates the audio routing properties in several Qualcomm device
trees to reflect changes in the LPASS TX macro v9.4 control names.
Specifically, it renames "TX SWR_ADC" and "TX SWR_DMIC" to "TX SWR_INPUT".

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> index bdc02260f902b..565f7db91e77c 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -860,7 +860,7 @@ &sound {
>  			"TX DMIC0", "MIC BIAS1",
>  			"TX DMIC1", "MIC BIAS2",
>  			"TX DMIC2", "MIC BIAS3",
> -			"TX SWR_ADC1", "ADC2_OUTPUT",
> +			"TX SWR_INPUT1", "ADC2_OUTPUT",

[Severity: Critical]
Does changing these control names without providing an alias break existing
userspace ALSA UCM configurations?

Since older device trees and userspace setups might still expect the
"TX SWR_ADC" and "TX SWR_DMIC" routing strings, does this unilateral rename
cause backward and forward compatibility regressions for systems relying on
the previous names?

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi=
 b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
> index ce48e4cda1708..bc492346f7dc2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
> @@ -20,17 +20,17 @@ sound: sound {
>  			"VA DMIC1", "MIC BIAS1",
>  			"VA DMIC2", "MIC BIAS3",
>  			"VA DMIC3", "MIC BIAS3",
> -			"TX SWR_ADC0", "ADC1_OUTPUT",
> -			"TX SWR_ADC1", "ADC2_OUTPUT",
> -			"TX SWR_ADC2", "ADC3_OUTPUT",
> -			"TX SWR_DMIC0", "DMIC1_OUTPUT",
> -			"TX SWR_DMIC1", "DMIC2_OUTPUT",
> +			"TX SWR_INPUT0", "ADC1_OUTPUT",
> +			"TX SWR_INPUT1", "ADC2_OUTPUT",
> +			"TX SWR_INPUT2", "ADC3_OUTPUT",
> +			"TX SWR_INPUT4", "DMIC1_OUTPUT",
> +			"TX SWR_INPUT5", "DMIC2_OUTPUT",

[Severity: Low]
Does the device tree binding example for this hardware also need updating?

The schema at Documentation/devicetree/bindings/sound/google,sc7280-herobri=
ne.yaml
still contains the obsolete "TX SWR_ADC" and "TX SWR_DMIC" audio routing
strings in its example section, which might now be out of sync with these
driver updates.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-sc7280-tx-=
macro-v1-0-1aad6900fec0@fairphone.com?part=3D2

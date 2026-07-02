Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CF3B442F
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991245; cv=none; b=giPFjGLa/t4qYy0+fuG4i9AHUhGQI1mnn1HFW22fz6TSU0HedzHv1p5Ru0cArXJI2A5IHf7/wSxAIW8aat4Lsgcy4KrbXH9Be6YF21Wxc+IBC5nvk5ZetR12Jhxi3iS+K08aXQu3AZd2hzuBoLsgQdvrriz/VmEnTrPN+C24ALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991245; c=relaxed/simple;
	bh=Sqw8D9ezrF+3PH75GoDhMjTdZtP6AMaBZDJvAG8uucI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PwL2pbIqL617dZ66eANXHnQji7Vypkozhf2kggG8hERrCYPiP4PB3RGV3yEL+hJU9J/ga09UNV104gZ8SiR66uX3gll8Z+QturBpBEcdeIc8S2fmpq/BbXV6d2SYtym8oqIgOrvJXES+07t/GlLSbQs5TG82MjrTxON7FZsEIwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrCTKMKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrCTKMKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6585A1F000E9;
	Thu,  2 Jul 2026 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782991244;
	bh=rDVpU5hVsxexcZEb9VIKROWXnzpTkE7Yf2aGGMorG3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XrCTKMKS75Xk3ZnhY+DNB+xxBOcxq3xANCot0zdyG/9Ie5AKRnBlxFy0VfRidG+UM
	 mMXuXiBfcgS4uvpI16UkVg2y/YYcgOIND+pAa0w0fydKK8BFvsBPn/lnxyBfhvKTO7
	 8Qhd+AnY6sXdW5RGG3RZdFfCwKHwzlJkJEgsLBC1f2FHsNe8jp8mVrRdK6GkxekJyl
	 4JEwqvBHzDZdH7zuoBoRnfAzehmDlIIr00pCn7BZxLajqu1bKJbdH3C/92WsmsgTIp
	 dzLdftl6ME9zPIxFnlnZHNF4TJ9WpqO+Nx32MhXS0M/RJIz4NuejbryBWel5WJ9Vaa
	 0+JeVtaM107sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-5-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-5-8169953634ad@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 11:20:42 +0000
Message-Id: <20260702112043.6585A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Device tree compilation fails due to a missing header file and synt=
ax errors from undefined parameterized macros.
- [Low] The unit address for the `pm8550ve_die_temp` channel node incorrect=
ly diverges from its evaluated `reg` property value.
--

commit 566210e29c0d3e21f9b57c08b13ab044688d190b
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes
   =20
Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the other PMICS on
the system. The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index eabc828c05b4c..3a4a27e528c5f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -220,6 +220,92 @@ platform {
>  		};
>  	};
> =20
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Does this device tree compile successfully with these changes? It appears
parameterized macros like ADC5_GEN3_AMUX1_THM_100K_PU(1) are being used
here, as well as ADC5_GEN3_DIE_TEMP(1) later in the patch, without their
definitions being included.

Could this file be missing a header inclusion (such as qcom-adc5-gen3.h)
that would prevent a compilation failure during make dtbs?

[ ... ]

> +	/* PM8550VS_E Channel nodes */
> +	channel@403 {
> +		reg =3D <ADC5_GEN3_DIE_TEMP(4)>;
> +		label =3D "pm8550vs_e_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	/* PM8550VE Channel nodes */
> +	channel@503 {
> +		reg =3D <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;

[Severity: Low]
Does this unit address match the evaluated reg property?

If PMK8550VE_SID evaluates to 8 on this board, the reg property resolves
to 0x803 instead of 0x503. This mismatch would trigger a unit_address_vs_reg
warning during dtbs_check validation.

> +		label =3D "pm8550ve_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-topic-sm8x=
50-adc5-gen3-v5-0-8169953634ad@linaro.org?part=3D5

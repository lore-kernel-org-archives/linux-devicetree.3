Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83532931D1
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102005; cv=none; b=Dl34jlzSzJ2wpgt1Vagixow9US9rwVbNyYMHsWF7ktUWHs7H74Wo8UKEmCeingqQgh0y54lGMicxVZUno8OSiZ9gotINRElDrWL4g/W3mqOa6C1u9UcHuWT+1ydp9MqcAruU+d54SFSpK8frjvubLV/AH/2Mpx7iSi8EnKxyQvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102005; c=relaxed/simple;
	bh=w8Sr/yZ5IDen0Rto2IjpnojLO6iEGCgnq1kkTY2e0Ds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GLMxnywAep418naJDOb4Ym3OkpoR4EAtsBVGhiwn3HAH/BrbVn4aPr+G7bW+Ns2Sh8eMKKV0LQ6RPDXJ96T4So/tOcL95BHDjq4jTrlHioLpgX1srDMX9L55AZUtfU3RbbwqlaB65NCbvkGNyRF1W4A+d3RKzAikADO+rZzN2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ru1NgFqa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ru1NgFqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7861F00A3A;
	Wed, 15 Jul 2026 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784102002;
	bh=FnI9/0K5gwuJAgN+woXwNCCGMyoOoB3nUGCjh0lvWJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ru1NgFqaJ5wKnEH+HLU1Sste8zw4BrHhQNjT9NiEr+p5efA/Org1wR8yQIqgJZYZ7
	 oD3I2iSQ5VlV7IjUPW7g9P8ycRdREzLNL19jVzv3ztu/xeqpYmLjuqPlutb7rQUagl
	 eV67/qwBM48WoaZ+lo7pByiQDlmENaCW0TXWtntJ7RVocBUYDcrvevmFmEJyg/LKm7
	 mYfTH1QPVZu21hGeO+CS+rXQPw2dT2HtuYKDbVBTJGL/RHl9vvBmKI9cO+t4uChK8l
	 5IoSXKxUK6SgCezuG8xq7Mp2o6JVI5Mrva2sX1QruOPCa5HpOA472Rn9uy9jYTJFe4
	 pvdrMJuziFMFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
 <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:53:21 +0000
Message-Id: <20260715075322.1E7861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The critical thermal trip exceeds the hardware maximum limit for a=
 PMIC temp-alarm without an ADC, causing sudden hardware shutdown and boot =
warnings.
--

--- Patch [2]: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node=
 ---
commit 6fe65cc601cbda83fdc5adbaeaef49d876e5ddff
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: pm8005: Add temp alarm node

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/q=
com/pm8005.dtsi
> index 0f0ab2da83055..ce31a85450200 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -4,6 +4,34 @@
>  #include <dt-bindings/spmi/spmi.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> =20
> +/ {
> +	thermal-zones {
> +		pm8005-thermal {
> +			thermal-sensors =3D <&pm8005_tz>;
> +
> +			trips {

[ ... ]

> +				pm8005_trip2: trip2 {
> +					temperature =3D <145000>;
> +					hysteresis =3D <0>;
> +					type =3D "critical";
> +				};

[Severity: High]
Does this critical trip temperature exceed the hardware maximum limit?

The critical thermal trip is set to 145=C2=B0C, but the temp alarm node bel=
ow lacks
an io-channels property to specify an ADC.

Without an ADC, the qcom,spmi-temp-alarm driver will clamp the critical tri=
p to
the hardware maximum (140=C2=B0C) and leave the hardware auto-shutdown enab=
led. This
can cause an abrupt power cut at 140=C2=B0C, bypassing the OS's graceful sh=
utdown
procedure that was intended to happen at 145=C2=B0C, and will also print a =
warning
on every boot.

> +			};
> +		};
> +	};
> +};
> +
>  &spmi_bus {
>  	pm8005_lsid0: pmic@4 {
>  		compatible =3D "qcom,pm8005", "qcom,spmi-pmic";
> @@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> +		pm8005_tz: temp-alarm@2400 {
> +			compatible =3D "qcom,spmi-temp-alarm";
> +			reg =3D <0x2400>;
> +			interrupts =3D <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells =3D <0>;
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-shikra_adc=
_support-v4-0-5e07b6d21429@oss.qualcomm.com?part=3D2

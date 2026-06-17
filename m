Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BC44E049
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709227; cv=none; b=eCmMtX13tCe/P34/GkqB69YREm0BQlDYuLdPdxN0opOXYEBZHpuNV5TUTifzOaYsLHxRaqaO6RH6GtD5w0pCfwf+O+SBr5Ebp9vK2uBSgifH4obt/Kp4mgKF9Oof0G4LNBAxRCkERraeav4T0RDrg1gvyiudAwP4wQwRzTKWUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709227; c=relaxed/simple;
	bh=SIL+jy4mEVP2foXa6xPAsX/ZlEUybzcAgbkxx4FmqmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qrOQw9+1XJXwBTxPrVCzlUcwWDjDQgPLlrVLPFUk5vZyMDkyEbgZ6vtTX3/Y5Hyj7fpy0b+hhul0NPWEVWIZivEwJ+Q8ikoynXw5b3ld2iqDl6a0Deu5GNfEUgS8IrLuyc4w3HelE9s4P1ax6aY/cKtcfisvt8QDUlALAPBCLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyfJabOf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyfJabOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185B81F01566;
	Wed, 17 Jun 2026 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781709226;
	bh=hYSh4cYdbzGjJvAfhRuuw7YLp++eieNy2IbStuhjcqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IyfJabOflbVzr7zHxErC2552/645pA6pAUECYhI5juh1Mz1t4gMjQyxIiuyL5tL5A
	 w1xlBx5stQ75nJ2Je9R0JDd/lFRkaNIxRmzeG9YhtfYD2DyRoLRKhsIJS1nUatCWKk
	 iA6bGoOMpbK/kSSvrK4TqV/2UHy287sUKqpBqOVCeEGvQqCkP1t6MKllV8lS8MAU1g
	 EJVDd3fWCmXMBSd7GydeOXcvfs8hpO2YuC5XaU5+mJIlrhrkUdaQCCduB86OHNVfvb
	 OCCflQ8vwkbtnSx5rf55AI/ZWeWmr9NlZuE4l0abcTAiosYMu+cMNSvng78LEnwuXf
	 Xf3BxQISY4yQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-3-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-3-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 15:13:45 +0000
Message-Id: <20260617151346.185B81F01566@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree compilation fails because the patch uses parameterized =
macros (e.g., `ADC5_GEN3_DIE_TEMP(1)` and `ADC5_GEN3_AMUX1_THM_100K_PU(1)`)=
 that are undefined. The required local header `qcom-adc5-gen3.h` (included=
 via `#include "qcom-adc5-gen3.h"` in `pmk8550.dtsi` in patch 1 of the seri=
es) is completely missing from the tree and was not added by any patch in t=
his series. Furthermore, the similarly named kernel-internal header `includ=
e/linux/iio/adc/qcom-adc5-gen3-common.h` defines these as flat integers (e.=
g., `#define ADC5_GEN3_DIE_TEMP 0x03`), not parameterized macros, so even i=
f included it would cause DTC syntax errors (e.g., `0x03(1)`).
--

commit ab5e68d3e2e92bec8b24c3b38a79b453baff7e21
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the other PMICS
on the system. The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-hdk.dts
> index ee13e6136a825..f19419f63e36b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -280,6 +280,92 @@ platform {
>  		};
>  	};
> =20
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Does this compile? It appears the parameterized macro
ADC5_GEN3_AMUX1_THM_100K_PU(1) is undefined because the required header
is missing from the tree.

[ ... ]

> @@ -1102,27 +1188,218 @@ led@3 {
>  	};
>  };
> =20
> +&pm8550_temp_alarm {
> +	io-channels =3D <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;

[Severity: Low]
Similarly here, ADC5_GEN3_DIE_TEMP(1) seems to be missing its definition.

Even if include/linux/iio/adc/qcom-adc5-gen3-common.h were included, it
defines ADC5_GEN3_DIE_TEMP as a flat integer (0x03) rather than a macro
accepting parameters, which would cause a DTC syntax error.

> +	io-channel-names =3D "thermal";
> +};

[ ... ]

> +&pmk8550_vadc {
> +	/* PM8550 Channel nodes */
> +	channel@100 {
> +		reg =3D <ADC5_GEN3_REF_GND(1)>;

[Severity: Low]
Are these macros defined anywhere in the tree? The ADC channel definitions
throughout this file use these parameterized macros, which appear to rely
on a missing header.

> +		label =3D "pm8550_offset_ref";
> +		qcom,pre-scaling =3D <1 1>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-topic-sm8x=
50-adc5-gen3-v4-0-4af9251731f1@linaro.org?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F11E46A609
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649277; cv=none; b=HzRR5hlFwDHRInqKLqRz+H2wVHTewbwBu0yqXzENW7jAw4bSHohHHeSKnPslMb7rbHeayve9UfbzFK9PObQWeYXEnMetNPNf9QBAhSkw5dqhViM0MuzSNhPJ25Qm9MPlDCdUwRquK2CzhnOaZi5efXyZH0De2yMKVwuU7riHnpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649277; c=relaxed/simple;
	bh=IGGgkTc8ZWNR2qEXD/C2QZbTEoWCnel0xNEaWe8oyes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gvoqRb5thGS5O2ykBqaJQvInA3sXOM+G53U7LtPnjiQBPIPpVXVvaZLVQJPxpvYf2SDvUCYpzd8jMorQMSMXSOhCHirpRVIGnJX1/LxVheE3x7hmosDde0qbwSEmMBlporzkVzbcoLZGFXYTH7hRQd3DB21Uv5yivRpD3hImJUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NL9sU2bB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NL9sU2bB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C011B1F00A3A;
	Tue, 21 Jul 2026 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649276;
	bh=0lMaBNV7PQDHEVU84xJSK8vEhjsQvj8JWaGrMKTbfq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NL9sU2bBfzPHg/0z09fouPJ44Ih0CHyPgBIRPEFQ8LOOstXV1yXyoy91wbNq7WkJN
	 fo7+cHTqCVDYwG3DYtM7/60LFCb5DoAnDWRYsqxamgYfL5WFOYubOnWJf4cNuyA92v
	 gAfSfTsJD80gupPYxQtFeM2qKp47Wbe5OIxj0dIgdzkt+c1Ko4QXcXxqls9cICU2h2
	 NKwVJdZWh0n+AllYc9A2eWEQud+3Jr2eFjBmWiw3UrxZBAMADhuqkf0JeMAyu6KRSe
	 npO3DMpwT7m95EqTKhfcUA94etzHkXFX1smE33+fsfUiezZa9jitMg56MU6BsX/F22
	 FC8WsFBiCER2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-4-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-4-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:54:35 +0000
Message-Id: <20260721155435.C011B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unrealistic and physically dangerous 125=C2=B0C thermal trip point=
s for external surfaces.
- [Low] Missing DT bindings header causes build failure.
- [Low] Device tree unit address mismatch for pm8550ve PMIC temperature cha=
nnel.
--

--- Patch [4]: [PATCH v6 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC ch=
annels and thermal nodes ---
commit e319ddcc0f55ac8e62e9354e1059c060573915eb
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-qrd.dts
> index a3982ae229290..809c9efb23385 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -158,6 +158,92 @@ platform {
>  		};
>  	};
> =20
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};

[Severity: High]
Is a passive trip point of 125=C2=B0C realistic for skin-thermal and the ot=
her
external surface zones? This temperature seems extremely high for an extern=
al
surface and might prevent the OS from mitigating heat before causing hardwa=
re
damage or burns.

[ ... ]

> +&pm8550ve_temp_alarm {
> +	io-channels =3D <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;

[Severity: Low]
Does this rely on a missing header file? It looks like the macros
ADC5_GEN3_DIE_TEMP and PMK8550VE_SID are not defined in this patch or the
current tree, which might cause a build failure when compiling the device
tree.

> +	io-channel-names =3D "thermal";
> +};

[ ... ]

> +&pmk8550_vadc {
> +	/* PM8550 Channel nodes */

[ ... ]

> +	/* PM8550VE Channel nodes */
> +	channel@503 {
> +		reg =3D <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;

[Severity: Low]
If PMK8550VE_SID is defined as 8 on this board, will this evaluate to a reg
property of 0x803? If so, should the node be named channel@803 to match the
unit address and avoid dtc warnings?

> +		label =3D "pm8550ve_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-topic-sm8x=
50-adc5-gen3-v6-0-a507f4a1e537@linaro.org?part=3D4

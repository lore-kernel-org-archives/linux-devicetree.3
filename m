Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBB83955FF
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703056; cv=none; b=V+nPLwf+UjUUWVv4mMZKa8qpG68S19T0/ZtuJJ1az261jps6MogmMIY8GZV2phwWFeRhSyMbTMFFPeULrA6Q2hXWiZlXtlJdbTAvC4nkZndrgDy/SlRLepQpmdDJaqf7IJhYP02AePLAxw3JWmJQNV+HQu8MJYuQiQbL6A16YyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703056; c=relaxed/simple;
	bh=Ue6F+ODw+IB1CLabWbZPjiscthH7cNTFYKe0LHGHwZ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twQDRHZNKKIbs5bSTXOPcNk7OzAp3k9L/S2AyeMYeVT9C9oIJ4N/Q7QlfcDD6kzp2u/Gff7Fx8J358g3vWIIDy1oBECQY0oWjgAYCv65IhOqMDGwoUmuvJCAaLxM2Pje4ypI6HC08pxX5i8jFSq2rG0cTqvbpvvtdww57qC14wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9hwPkTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9hwPkTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F631F000E9;
	Wed, 17 Jun 2026 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781703055;
	bh=Ggj9ZBoOh3yVKHQ4vusAdDBjWOX+kdsAynkZS1OG5fA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O9hwPkTAfyY97IDkpYgjA3NlHD8oiZpZz6h8c1FuXzLtKb1v/sj5uJo/Mx5IgG6bb
	 hhaVikLwaqbdIr6us95sPjxbPskFp2lcWSwDcMuoerKzpkgoi5zBdgumMc65AQgOjg
	 q0xJHrfRpCvWu+MPBLb7ugrYv8SoOqv+9kE/wt1HgwyHrnPofsOMy9wDLvLsDG5kcF
	 0iJtHZrsvMU+nhaw+GT68pnJLd2d+osUPmBen6HbOBMtY5qxVPmJvYF42U8diiHoml
	 kh2qkV3YHN1T249ce9SYUbjBVRVMWoxU0aUkhfETjmO7E53/o77W+x3+5vuTNj3WVW
	 yqdDfYgWf6v5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-5-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-5-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 13:30:54 +0000
Message-Id: <20260617133054.D8F631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Dangerously high and ineffective passive trip points for skin and =
ambient thermal zones.
- [Low] Use of undefined macro ADC5_GEN3_DIE_TEMP(x) causes a DTC syntax er=
ror.
- [Low] The unit-address of the pm8550ve_die_temp ADC channel node does not=
 match its reg property.
--

commit f0b9d1fd765aad624439c8e56ebe37c1e26e52c9
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes
   =20
Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index eabc828c05b4c..05af2913055ed 100644
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
Is the header defining parameterized macros like ADC5_GEN3_AMUX1_THM_100K_P=
U(x)=20
missing? Without it, the C preprocessor leaves the macro unexpanded, or exp=
ands=20
the parameterless constant in include/linux/iio/adc/qcom-adc5-gen3-common.h=
 to=20
0x03(1), which causes a DTC syntax error and breaks the build.

> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};

[Severity: High]
Is it intentional to set the passive trip point for the skin-thermal zone t=
o=20
125=C2=B0C? While 125=C2=B0C is a typical critical threshold for internal s=
ilicon dies,=20
it is physically impossible for skin or external surface temperatures witho=
ut=20
causing severe burns or melting the device. Does this functionally disable=
=20
skin thermal mitigation?

[ ... ]

> @@ -1041,27 +1127,218 @@ led@3 {
>  	};
>  };

[ ... ]

> +	/* PM8550VE Channel nodes */
> +	channel@503 {
> +		reg =3D <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
> +		label =3D "pm8550ve_die_temp";

[Severity: Low]
Does the unit-address channel@503 match the evaluated reg property here?=20
Assuming PMK8550VE_SID is 8, the standard SPMI ADC encoding (sid << 8 | off=
set)=20
would evaluate to 0x803, making the unit-address channel@503 mismatched.=20
Should this be updated to channel@803 to avoid dtc validation warnings?

> +		qcom,pre-scaling =3D <1 1>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-topic-sm8x=
50-adc5-gen3-v4-0-4af9251731f1@linaro.org?part=3D5

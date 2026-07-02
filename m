Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A82395AE2
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988548; cv=none; b=Hqcv9U/33Fkpd8bBoZKEO+dsIgFlovSa4bgdgTLnkMtBJSFMR3V2pufHiW2jYvokRwsMmiVTaWyBUsy1lcEtdPhrValMuCKfbdTb2bpP5hUVOV0GXW67s4GX62aSasMAkH9WJCy4ZiJYzmXIJZRGPDHzZZaqpDUopng0OObg27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988548; c=relaxed/simple;
	bh=pshqbDQvCYZ3MLgabKeUmvv1ZlEyN8x/Pgp2Cl9zDIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=shqwKtUMV8p+Ds/TBujEm/P/sFWQcqmrDYaTmfzVvK/2VMjPRiDTxAQIp+Vjcv3gxA0PUazuuQWnPy9rDoOEMelIeGxkfmkx02rv7zzbmqkH4r5l3Q/vhM8A5f1kDwHkywjQvUNirht5U75Uri3YkgrzcGTVci9HoNI0334lysw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYxC/B4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYxC/B4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805291F000E9;
	Thu,  2 Jul 2026 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782988545;
	bh=FlW2g6XRHNY0JuPEd5CI44kWB9aKjKS+TvkMC0FX/Qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IYxC/B4KCPvNKPOUaXCp9QHI1E16Hl+g1axpnPG3kz6H9iKUjHS5VK7QgOiAJoWZH
	 uAhsXr00qaol7qDruKePZly2pA3VTu3XVWvxQw/lDFnqkCBZF1Q/+LtBS86toqUaTh
	 9TbXn3/IRa2Wy29SvqZbwDQbNsH3c9e1RPMnuTTrCSKIfpJLbwFx3+T7ZxBRPgcgY8
	 zVLAG5MHQz9huneegJPZIwiygmt7p0N+3pyZcjIvn6nOpXcFPyvy/EhWfepJt7/t/3
	 O6PTXAvbBJ95+z2HCWTdYh5BJ9kBatCI9HjnOYhRdm0pcfeimmrOYjkcffk/iG2i/e
	 fAv06XyHcIu7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-3-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-3-8169953634ad@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:35:44 +0000
Message-Id: <20260702103545.805291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces a dependency on a missing header file 'qcom-a=
dc5-gen3.h' and uses undefined parameterized macros, causing a device tree =
build failure.
--

commit ab1178c40eded5f1628ac18710847436d2e8339b
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes

This commit adds the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system. The thermal nodes are sorted by the sensor
channel to be coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-hdk.dts
> index ee13e6136a825..96ea55c8c9774 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts

[ ... ]

> @@ -280,6 +280,92 @@ platform {
>  		};
>  	};
> =20
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Is this patch series missing a prerequisite header file?=20

Using ADC5_GEN3_AMUX1_THM_100K_PU(1) as a parameterized macro here appears
to cause a DTC syntax error during compilation. It looks like this requires=
=20
qcom-adc5-gen3.h, which seems to be missing from both the patch series and=
=20
the current kernel tree. If the tree only contains object-like definitions=
=20
for these macros, the preprocessor will not expand them correctly.

[ ... ]

> +&pmk8550_vadc {
> +	/* PM8550 Channel nodes */
> +	channel@100 {
> +		reg =3D <ADC5_GEN3_REF_GND(1)>;
> +		label =3D "pm8550_offset_ref";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@101 {
> +		reg =3D <ADC5_GEN3_1P25VREF(1)>;
> +		label =3D "pm8550_vref_1p25";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@103 {
> +		reg =3D <ADC5_GEN3_DIE_TEMP(1)>;

[Severity: Low]
Does this location also suffer from the same missing macro definition issue?
Without a function-like macro defined for ADC5_GEN3_DIE_TEMP, this will
likely fail to expand correctly and result in a build break when running
make dtbs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-topic-sm8x=
50-adc5-gen3-v5-0-8169953634ad@linaro.org?part=3D3

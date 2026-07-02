Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C93D6690
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989839; cv=none; b=dLi43U9VOQ4fBaEwX0zRb5t9ncu7TLkgZs69lz00tIYKkOb1e9b6zIJpf/iWVGDdeUouOWpRKpzlX43hQmQbrUwGZTBOxkTYHyFQoiJa0wyizdX9h3q4bivq/zUr8WQAtQdJKn8PQk9LjOKsEqnTM+vp/0VEvgIbT858vL4EdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989839; c=relaxed/simple;
	bh=8e+xkM4mzbl8JJXxLUtsrGnvlugM8/fLv/yn8FcHDlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HlDEWYRv1trYiGcsaVGb3QcCD7yuMDTtMjVVt+/F+K6ZcL8PlKXazFoAzh+aSKvQ4Lr8T8NKInvdhGqJSH66LVtF5x52gBxT3tX6sOR3qkb6urzUp2HRGbnQSd026xvj5JiM1jKK5DMPAiVflo+KNJ/xOCQcXroKkxeeci2X8U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QL+tq57e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QL+tq57e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13ABF1F000E9;
	Thu,  2 Jul 2026 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782989838;
	bh=ft0DhkmcQVIV35+a5lirvyGun5Hv2PO0FjFVhsk4xQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QL+tq57e5a6qfr8r44mSYi3Vhkr3y0G1rxXSM/IPgqHI2O+I61jPm/wawR4/TZZUc
	 zHi/g2ZXapBIEU02fXQCICEQVc0VIJsoDAVt1HGxvb/IA0IZjUu7cWQqgy/vL90cnT
	 B8td6H2RZWycWriB0+Al/ZSqA+MO0XUUfDLdV7oeVMomjfW9RY78MppR4j3XXZRMEV
	 UsOeRHr1wArA2133yZXUv1nKVaI9kmbjGvL4PnS7wgsRG9EHzkivN376AIH9BeQ1H2
	 QC2XTWYUitp7g8sU6LAdEA+YIudMN/BsHGoXoD4OOefoJc1nSq5NhkxS0DW59z6VSO
	 f22aFknbaP76g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-4-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-4-8169953634ad@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:57:17 +0000
Message-Id: <20260702105718.13ABF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The devicetree node `channel@503` for the PM8550VE ADC channel has =
a unit address that does not match its `reg` property.
- [Low] The patch relies on a missing devicetree header `qcom-adc5-gen3.h` =
and undeclared function-like macros, causing a fatal dtc build error.
--

commit a2bc49ac04a87d9b25a3326a56b79fa449a81ea9
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system. The thermal nodes are sorted by the sensor=20
channel to be coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-qrd.dts
> index a3982ae229290..ba63bfc78e6ef 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts

[ ... ]

> @@ -1040,27 +1126,218 @@ led@3 {
>  	};
>  };
> =20
> +&pm8550_temp_alarm {
> +	io-channels =3D <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;

[Severity: Low]
Does this rely on a missing header for ADC5_GEN3_DIE_TEMP()?

It looks like the included header qcom-adc5-gen3.h is missing from this pat=
ch
series and the kernel tree.=20

Additionally, ADC5_GEN3_DIE_TEMP is defined as a constant without arguments=
 in
qcom-adc5-gen3-common.h, so passing it an argument like (1) results in a C
preprocessor syntax error and causes a fatal dtc compilation failure.

> +	io-channel-names =3D "thermal";
> +};
> +

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
Is there a mismatch between the unit address and the reg property here?

The PMK8550VE_SID macro evaluates to 8, which means the reg property
evaluates to 0x803. The node is named channel@503, but the specification
requires the unit address to strictly match the first address in the reg
property.

Should this be named channel@803 to prevent a unit_address_vs_reg compiler
warning?

> +		label =3D "pm8550ve_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-topic-sm8x=
50-adc5-gen3-v5-0-8169953634ad@linaro.org?part=3D4

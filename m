Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC85411667
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543509; cv=none; b=qWXF5H9kG1s2GJyMFG2NuxV2GhUwzRPYoq1p7qP7O9UZ3MkORvg/23exeIZoZpqSmmFg/y7uSkdFIi81nbF/r0jiATOxu7SoTlrwzruz9fXkJtDnfGw12ApCYtMQwdcPRHG7+IMsHqb3Jb8EzQHo1FiBHSpUPxtkr0xeCYIZFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543509; c=relaxed/simple;
	bh=wUrkBOMek69ckpLqnRhFYFs462Q87FhKHH/qRLPfkLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kl8HN1t1J4px3oRKc1yk9BTFaF98R+We6VS632RwvtYj70B7X0X3fL579+IN+tNU8qwywU0ZP7ooKk+plMC7kbLgCo1/qV401KoCxNAXjkaRv0KZiqLhcDs9wkZDClciiaEtGp5orx0L/86iJZbcUOXG0GUvmCDLQ2a0XA7m+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g56jrQHP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g56jrQHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8C21F000E9;
	Mon, 15 Jun 2026 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543507;
	bh=C9jEkPmJbdKutmby+4c+KgiA7hcPhhr1NcVd55vnbNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g56jrQHP3poaDI75ZhEfNmq/d5cavX1ygy/XPyybmDVAeeb4KmmolKsYt6Ni6OtE6
	 o0ieQX3p6SfrssU8K7PaUV6TjiMNXar2KFvO19rBfegtEoDHDS9gjvCs7CnR8AXVR3
	 wOO9oSS+rAwB968JwP4zMg4gxQlcVSffihYqq/EWCfyQGVtMjN2hmvakMmuT15zPyr
	 doLs2MD1/hY4nk8GSBC52hDlEnW6eDHarWDeT2mpZrtj80LI1bzJDQXZ6X7wryGcLg
	 ZiZUZ1T9tvIYPH6Gsq2zbU74K+oaMDmdq4z1jArSLf73Bsjgyfz4dfyys+mWugIroG
	 aK5aMhLrByBZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 5/6] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-5-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-5-216a2b5ccb85@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:11:47 +0000
Message-Id: <20260615171147.7C8C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree unit address mismatch for PM8550VE die temperature ADC =
channel.
--

commit 6952f92c17c33d46a9fedfb44cee4f92301811b9
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes

This commit adds the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system. It also adds thermal nodes, sorted by the
sensor channel to be coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-qrd.dts
> index a3982ae229290..0f5f9e55586ad 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts

[ ... ]

> @@ -1040,27 +1129,217 @@ led@3 {

[ ... ]

> +	/* PM8550VS_E Channel nodes */
> +	channel@403 {
> +		reg =3D <PM8550VS_ADC5_GEN3_DIE_TEMP(4)>;
> +		label =3D "pm8550vs_e_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	/* PM8550VE Channel nodes */
> +	channel@503 {
> +		reg =3D <PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;

[Severity: Low]
Does this unit address match the evaluated reg property?

Since PMK8550VE_SID is 8 in sm8650-qrd.dts, the macro
PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID) evaluates to 0x803.

Would naming the node channel@803 instead of channel@503 prevent a
unit_address_vs_reg warning from the device tree compiler?

> +		label =3D "pm8550ve_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	/* PM8550VS_G Channel nodes */

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm8x=
50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org?part=3D5

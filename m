Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACAF4078F9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087216; cv=none; b=m8kPpbE0jsCQAh6h0mjIyQdavtzADbAdydKfpW/NvTry7Fp36IGkxljGTGyZfX49p5d2OzLlZr4cvaXW6jBx20DxCQFhnv46+CjPmjojczI6pywYVs7/a0OqvRDYYu/UG94HRPpG18VOZyrVbnr0eOa9J0T+Rsysxp4xsxj8GYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087216; c=relaxed/simple;
	bh=qcCjYnXDM4ldiSfuT3kOhbdQ66U1V3IVuDNdxNV1npQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=U0ukf5ci5G7j0lFkqcG1tnsWeMXuBKZkcN+WUsLtI4QwLXTKMrifvnYHhOkn5Lw3xHqjlR7DG7k9toR1TjZ46ySXTk/43yTdQiKVBbjM2D4u5G1AwkBzDoqMLyNSIba3Z6CfV/Q9mzgq/ZeFtQSKpLVWm49Xls29ZbuvpJomhuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpEeGByP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpEeGByP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F4C1F000C4;
	Thu, 15 Oct 2026 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792087210;
	bh=7ryhJUAfiwEf2MvvxBLcg44tPrm4oL2OIT9TYlnZLc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QpEeGByPWz1MDTfx9+c/e1wS58eqyu5ZXVWMvuQaKIccWa6jEi2OZyaZaaiKSq7BE
	 dX+WJbVFqydZcGMWyea3Nm7RplCltL19IXbcY4kgIFOErOvdh8yTs1VbA/SKLWxAoH
	 7KgfZ6uASS+4VJMVFGgWMrJ119qNQrqOtRcOP5qf4HirPhvpG/FAhNMd+1j6Rbj/Wy
	 /YYBn4PaNGFWR8vcsMikhBIiqmI9WpJQleJ2uaEAPWokg5HVJc1MOGEMB91Gf21m1L
	 o/1QHVImx2I1o6CalBXwEInihH0prWtcWld34YHLBAtudKptKyllXcOBUFRAZL7IaL
	 LOikosWKfLrNw==
Message-ID: <sashiko-outbox-173272@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: amlogic: t7: Add thermal zones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261015-add-thermal-t7-vim4-v6-3-37d1c954390c@aliel.fr>
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
 <20261015-add-thermal-t7-vim4-v6-3-37d1c954390c@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 18:00:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: thermal trip points labeled as 'hot' are incorrectly typed =
as 'passive'
--

commit f22129efed7c6439714c1c2501834a6c01be9e9e
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

arm64: dts: amlogic: t7: Add thermal zones

This commit adds thermal zones for all six sensors (a53, a73, gpu, nna,
vpu, and hevc) to the amlogic t7 device tree configuration.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-t7.dtsi
> index c81632d3984e8..454a042865a5a 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi

[ ... ]

> +		gpu_thermal: gpu-thermal {
> +			polling-delay =3D <1000>;
> +			polling-delay-passive =3D <100>;
> +			thermal-sensors =3D <&gpu_tsensor>;
> +
> +			trips {
> +				gpu_passive: gpu-passive {
> +					temperature =3D <95000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";
> +				};
> +
> +				gpu_hot: gpu-hot {
> +					temperature =3D <105000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";

[Severity: Medium]
Does this incorrectly set the trip type for gpu-hot to "passive" instead
of "hot"? The thermal subsystem will treat this as a passive trip point,
meaning the standard hot thermal events won't trigger at the 105=C2=B0C
threshold.

> +				};

[ ... ]

> +		hevc_thermal: hevc-thermal {
> +			polling-delay =3D <1000>;
> +			polling-delay-passive =3D <100>;
> +			thermal-sensors =3D <&hevc_tsensor>;
> +
> +			trips {
> +				hevc_passive: hevc-passive {
> +					temperature =3D <95000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";
> +				};
> +
> +				hevc_hot: hevc-hot {
> +					temperature =3D <105000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";

[Severity: Medium]
Similarly, should the type for hevc-hot be "hot" rather than "passive"?

> +				};

[ ... ]

> +		nna_thermal: nna-thermal {
> +			polling-delay =3D <1000>;
> +			polling-delay-passive =3D <100>;
> +			thermal-sensors =3D <&nna_tsensor>;
> +
> +			trips {
> +				nna_passive: nna-passive {
> +					temperature =3D <95000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";
> +				};
> +
> +				nna_hot: nna-hot {
> +					temperature =3D <105000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";

[Severity: Medium]
Does this nna-hot trip point also need its type updated to "hot" so that
it behaves distinctly from the passive trip point?

> +				};

[ ... ]

> +		vpu_thermal: vpu-thermal {
> +			polling-delay =3D <1000>;
> +			polling-delay-passive =3D <100>;
> +			thermal-sensors =3D <&vpu_tsensor>;
> +
> +			trips {
> +				vpu_passive: vpu-passive {
> +					temperature =3D <95000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";
> +				};
> +
> +				vpu_hot: vpu-hot {
> +					temperature =3D <105000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";

[Severity: Medium]
Is this another instance where the vpu-hot type was intended to be
"hot" rather than "passive"?

> +				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-add-therma=
l-t7-vim4-v6-0-37d1c954390c@aliel.fr?part=3D3

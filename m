Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585915;
	b=MAO6WQCZUEJYohkj4nNf/YEji9r7BparVwrP5lNRW5q9MLxiDLEiqcMvCoS4J93Ha1hi
	 AxM+P/kXnuaxeqK1X6HzGCPUWgK8o9MrkNztnV66dv9G1EvcQfjZc2X8zINpird//eVgJ
	 H2oRJEiGeiazixm/oFYDMIo9glqcZ7Y2z7xN+0WtgY9t8DS5mjPasjmonza7Ex1EWMkbv
	 lGSH/stFi0Qawhm7zhJDix/iUSRshDVA4k79KemyrJ4dyPk7Fvua+uJCBtSCdo8Ko0dqd
	 Xp9TbUoiWYS42UoErfqgCRTjCgNBa1nZnTT5cMQKJQ3I0zhN8yvsSZ5C0w3ZsubIKZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585915;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zDDhxeiq4AimuU9FB2NEBaVGfhWia5vA4S5VTaY0WE0=;
	b=YNtO9fVHRtlpcUqbh6DKZ8/roS8aqtmgl4/2B/mI0Pn79dMs2G2mUk8S/SStngSkj8/A
	 Zsnp3GmQXrL0/CclrF0h9QNuAZ0Bnvdrnip9kCDfxAiowuoPgB61We0hJq0tTPoi2q8oj
	 NaF3rK6fFlNpca/ysWaKVGt9Pvm8T8/n2+SxpnqtESwKrHH2rQSuCyUGM2bPwZaHqrYTN
	 8kDIIwFI+gUcnZMJpgv5ETa64qUyGyxNfCTHCuJsARjaFC6GKouFnLJxLaM1yyUozQvPE
	 9oCl0eYjir+1tLd8+zBTzmWRqA4giL/2rc/owxcf0bmgxeJEcKSa8SLQofeITXMF18A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6em482u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044D6076214
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6em482u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33931F000C5;
	Fri, 13 Nov 2026 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794585915;
	bh=zDDhxeiq4AimuU9FB2NEBaVGfhWia5vA4S5VTaY0WE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6em482utP9GKUhzxT9JherybdfYjin3Vm0VzAfIeSQqtkQhwxNGw/cFZwD2i2WES
	 XQHxQlaiNBGOWe7VBVwf/AGPr4BCvmjW+arh9iV/9tYqRrVnvqGtL/MFiOFxW/LrHp
	 j5RrkE4G1SFrz17Sv3nOj8mj9t6xldMsNIYTGb1GlriJIEtwgbs9SzRmG9wsmvsp0M
	 Az9x+cTUA6W4gOS+USxveV8H9atuaJkszJl9ldQmkW8qEZCdP1SyRg4ocNde+0pZ7z
	 RGBdvByxsnXKnomZRK9OrxyA8tFUJDCSuqzWHaEKKlCG1Y2IP5O3w1SONf+y3dKjrz
	 AFtsUnQESDtiQ==
Message-ID: <sashiko-outbox-213154@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8750: describe the second MDSS
 block reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113155635.1677541-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155635.1677541-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261113155635.1677541-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:05:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: sm8750: unattached INT2 domain reset on
  mdss
--

commit b3b8b6c811f21fdd572edc7ec2e32709cdaa973b
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750: describe the second MDSS block reset

This commit adds DISP_CC_MDSS_CORE_INT2_BCR to the resets property of the
mdss display-subsystem node in the SM8750 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index cf947acc57602..0f3e649787315 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3359,7 +3359,8 @@ mdss: display-subsystem@ae00000 {
>  				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> =20
> -			resets =3D <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +			resets =3D <&dispcc DISP_CC_MDSS_CORE_BCR>,
> +				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>;

[Severity: Medium]
Should the mdss node assert DISP_CC_MDSS_CORE_INT2_BCR when it does not
attach the corresponding MDSS_INT2_GDSC power domain or clocks?

In drivers/clk/qcom/dispcc-sm8750.c, DISP_CC_MDSS_CORE_INT2_BCR (at 0xa000)
is the block reset for the secondary MDSS_CORE_INT2 domain governed by
mdss_int2_gdsc (at 0xb000) and the disp_cc_mdss_*1_clk branches.  Here,
mdss only attaches MDSS_GDSC and the primary MDSS_CORE clocks, so
mdss_probe() -> msm_mdss_init() -> msm_mdss_reset() will reset an
unattached power and clock domain.

In addition, commit "dt-bindings: display: msm: mdss-common: describe
additional block resets" in this series still documents this second reset
entry in Documentation/devicetree/bindings/display/msm/mdss-common.yaml as
"MDSS core INT2 interrupt controller reset", which contradicts the commit
message here describing it as a separate GDSC and clock domain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113155635.1677=
541-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3

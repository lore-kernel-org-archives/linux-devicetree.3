Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59252F84F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032526; cv=none; b=SjqdsSro+WnEZoUj034U5HVC1F7K88IXcf67Y/gjiODC6a4IxaBeUZ4mon8sgIE8k13+Fjk1pnFqg9mj7gv4xiq2erunHz2BreWM18M2MViivWQ0jCy8fa+UZegDiGuPBED6hmb3tviRZWfOyGvCgFd76bETH/T/+UCKKNBPK78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032526; c=relaxed/simple;
	bh=o2OFEn42Ju50QiPxSqCR9C2YduPgRgjmsuhK44U5IKY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UnTgJrPq4oaPUGo3+MECZ3kH8e7LGts5EqDG6QINtFJ2c4Ady5LltBRP7z7FAjTaM0R/0KV4Vkv04EXe7YqXAfD243cwIs7FXYPIFSFjoRuQ2wo3fxddoTpuLIcyR6ZDsAcDylWGYsg3cXRuR/kj9eD7u4KpEKPQOsUGNAu5+Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGST6ess; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGST6ess"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4039E1F000C4;
	Thu, 15 Oct 2026 02:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792032525;
	bh=wzYYb9miaPsw58sbppIbqd5qgSZdTwYX7PipZcw0754=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GGST6ess5hOyiMsZ9pMPYC104+WeliklR+sF88oZhzv55I0u/eny4GTZs9sapVw2a
	 zt/72NtVrkqnC9kqGx1pTe93Sa0K/4CtMSy04FYEqYlzWBNw7hZ/yMZ1m5WL0rNg3L
	 IrTid4daN4ievXD8BG89sEKWOWIxtd0fFRuLvjfzF2sCB9yalyWcNmtRTQKlAPGEfy
	 CmWuvRccFrQgDHshE5MAxz5FMJk0etIBisL2qn3NjFYyOJflq/Agb8dqpUlG0eJTR0
	 4qQogb7hLpzIu/OEdWj/C1ZvCbvdRA2n5Gwa1dRrnc8jdMfy7SDVEPqOh/i6aK+pBf
	 9xcGInZs+5zAA==
Message-ID: <sashiko-outbox-172177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: lemans: Move platform
 resources into lemans-embedded.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 02:48:44 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: Incorrect removal of 'compatible' from base DTSI nodes
--

commit f8600c852f6da5600fb82650c04f9b466cb80549
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: lemans: Move platform resources into lemans-embedded.dtsi

This commit moves platform resources like clocks, regulators, and interconn=
ects
from the base lemans.dtsi to the lemans-embedded.dtsi file. This isolates
these managed configurations so the base devicetree can be shared with the
GearVM variant.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 7547042d8e851..821c86409c5da 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
[ ... ]
> @@ -4662,49 +3089,9 @@ gpu: gpu@3d00000 {
[ ... ]
>  		gmu: gmu@3d6a000 {
> -			compatible =3D "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";

[Severity: Medium]
Does this leave the GMU node structurally incomplete for other variants?

A compatible string is typically a fundamental description of the hardware =
IP
rather than a dynamically managed platform resource. Removing it from the b=
ase
lemans.dtsi means that any environment (like the incoming GearVM variant)
including this file will inherit a node that has "reg" and "interrupts" but
lacks a compatible string.

Will this break devicetree schema validation and prevent proper driver bind=
ing
for variants that do not include lemans-embedded.dtsi?

>  			reg =3D <0x0 0x03d6a000 0x0 0x34000>,
>  			      <0x0 0x03de0000 0x0 0x10000>,
>  			      <0x0 0x0b290000 0x0 0x10000>;
[ ... ]
> -		pmu@9091000 {
> -			compatible =3D "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
> +		llcc_bwmon: pmu@9091000 {

[Severity: Medium]
Similarly, does removing the compatible string for the llcc_bwmon node here
leave it incomplete in the base devicetree?

>  			reg =3D <0x0 0x9091000 0x0 0x1000>;
>  			interrupts =3D <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]
> -		pmu@90b5400 {
> -			compatible =3D "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
> +		cpu_bwmon0: pmu@90b5400 {

[Severity: Medium]
Does this also incorrectly strip the hardware description from the cpu_bwmo=
n0
node for environments relying only on lemans.dtsi?

>  			reg =3D <0x0 0x90b5400 0x0 0x600>;
>  			interrupts =3D <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]
> -		pmu@90b6400 {
> -			compatible =3D "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
> +		cpu_bwmon1: pmu@90b6400 {

[Severity: Medium]
Does this also incorrectly strip the hardware description from the cpu_bwmo=
n1
node for environments relying only on lemans.dtsi?

>  			reg =3D <0x0 0x90b6400 0x0 0x600>;
>  			interrupts =3D <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015023711.7218=
37-1-shengchao.guo@oss.qualcomm.com?part=3D3

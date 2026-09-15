Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A14353A6E
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509216; cv=none; b=DLei0TT7i0LWAtfK8h5st1T9b+cBx325lzBO6Eld2Zv0bloKnzwR/umwjZ0FGhr9bfUwvSM1oGYa4V+Tymgtu8wf3KhMYquH2Rc4I22jDy7Styo/jORvUGByCim+obodezgsR+IN9XnLzd6jx4gFbUMAytCxeSG2ZtMYoJ0fcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509216; c=relaxed/simple;
	bh=7wqPtqr/gxItByFONPhyJp9TPjjog0ZBeu8dQGrQlAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fFNvKpYoVPMZ9vpR3t/HMLQMx4d18Guse+5VemUIDfggNlskMpY/W//sh4+ljRWFoWU39mAXpEeNDaziwU4HVmwonJyXlgACLW2ULnNAIpPsccFN0Tk32UzqsSTPhbpVI6ICl9dvNchiR8VL4N1rxzwhEAX8n8O8b52xoy2GRs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYz0Iz3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYz0Iz3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E842E1F000FF;
	Tue, 15 Sep 2026 21:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789509215;
	bh=sxL9HH3HMF17y4EO9z+SK18M9ztakitl3Aygzns/WoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EYz0Iz3fN5i8gBcktFnv77vmY4iJBomKhKnmdRywnyRDiDRs0H03Ye6/jp9aPX9VB
	 7pYC3GuYBQI3j/OPmrj0VVzkb+kiAip8viwPLCuCH54UMekF0Htlqx2qMiGFRlkVT8
	 yMDIR8E3b5V7u5TqVaB7WCII4GGIyf7ZLdKip524gSHOGTQ5MLVc9HQVWe7ay9aJRk
	 9tr0b12MfhvyYgcrQoAM51W7BbE8JZqe3P6jIdxDoYGHMJFqCSKKz8JMDxCGGLJHrS
	 wesbfkIYtmcNDo/d28/EMqDwDYdZEvVRbzjg3WV8fmw4cPNZmYYLJcQe5zH2MEfDqP
	 O/ipyRNSW6tkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: ux500: Drop AB8505 main charger
 interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915-ab8500-charger-dt-v1-2-10b7b387e6a6@kernel.org>
References: <20260915-ab8500-charger-dt-v1-0-10b7b387e6a6@kernel.org>
 <20260915-ab8500-charger-dt-v1-2-10b7b387e6a6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 21:53:34 +0000
Message-Id: <20260915215334.E842E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] power: ab8500: probe fails due to missing main charger interrupts
--

commit e7da031c5be9d239332af239a1c3e397eaa17b40
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Drop AB8505 main charger interrupts

The AB8505 interrupt table explicitly omits the five interrupt
sources belonging to the AB8500 main charger. Remove these nonexistent
interrupts from the AB8505 charger node, leaving its nine USB charger
interrupts.

> diff --git a/arch/arm/boot/dts/st/ste-ab8505.dtsi b/arch/arm/boot/dts/st/=
ste-ab8505.dtsi
> index 131c82508e820..f7208e689d093 100644
> --- a/arch/arm/boot/dts/st/ste-ab8505.dtsi
> +++ b/arch/arm/boot/dts/st/ste-ab8505.dtsi
> @@ -138,12 +138,7 @@ ab8500_btemp {
> =20
>  				ab8500_charger {
>  					compatible =3D "stericsson,ab8500-charger";
> -					interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>,
> -						     <11 IRQ_TYPE_LEVEL_HIGH>,
> -						     <0 IRQ_TYPE_LEVEL_HIGH>,
> -						     <107 IRQ_TYPE_LEVEL_HIGH>,
> -						     <106 IRQ_TYPE_LEVEL_HIGH>,
> -						     <14 IRQ_TYPE_LEVEL_HIGH>,
> +					interrupts =3D <14 IRQ_TYPE_LEVEL_HIGH>,

[Severity: High]
Does removing these interrupts cause a probe failure in the ab8500_charger
driver?

Looking at ab8500_charger_probe() in drivers/power/supply/ab8500_charger.c,=
 it
iterates over a hardcoded array of 14 interrupts:

	for (i =3D 0; i < ARRAY_SIZE(ab8500_charger_irq); i++) {
		irq =3D platform_get_irq_byname(pdev, ab8500_charger_irq[i].name);
		if (irq < 0)
			return irq;

Since this patch removes 5 main charger interrupts (including
"MAIN_CH_UNPLUG_DET") from the device tree, platform_get_irq_byname() will
return an error (like -ENXIO) for those missing interrupts.

Will this cause the probe function to immediately abort, completely breaking
charging functionality on the AB8505 platform?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-ab8500-cha=
rger-dt-v1-0-10b7b387e6a6@kernel.org?part=3D2

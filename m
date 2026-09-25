Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C22673AA
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327293; cv=none; b=iS7NzXUtKv4ANl/R2FXc+oJVRtMcO9rJjhuf3moXcTG/73NdUTS7SrbW5q3ls5gBARlb6WfLhXUSQDlm891LyPWR+XOYfkSs9QAYprD5w9Fa5fH6cyUBEDeRgEPAHKos3W8UyFpDwBMmdu9qDz2UFAdmfyL2XjcIYPNns5LpzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327293; c=relaxed/simple;
	bh=2+VIRgNKMS0KhbN57e8NkWL4uXsR1kDyF+YVMkALEfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lZHq2p5KIjuTeyDAtgiDdGkR4AZE2aIb+GjHMK6XVkmoUOkfgS0wHoZIR+1dpZ3HwbsLxWk40o7aUbQydM//LAPgJCbI6Uy1KEPd+V/p0yppeng3NJ2Jm5IW+RBfzVVIk+qdSYozZc7n6EIR7MtOhbXhiwbk4OYSIZLLLfHFF7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g18UYaIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g18UYaIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818CC1F000FF;
	Fri, 25 Sep 2026 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790327291;
	bh=wXotkwJRB93dzNLUiReNeyNbiG43kw3k7OFpu8KjVYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g18UYaIpUnsdjHCNT0V7T6bRZRpw1gbj5V4tFDimzRtzPZdPp5eFGmb60ZeaGXtsU
	 Cx3C78sONGsKob8fBGe2ltKZThBXZ578mKzRYB1yIXf9BbOzCIk5Wy79pxDizwuQTM
	 wFPXEeIVbPQ5IcvYNQjn/sKWf/AVH3V49wbHZ+b6BhXlrtPbhwoy/v3uq4ini8nUxx
	 IigN4e+40IaUpITgH5vo8y6dt4EDT2TvTvQ7zbaNoULdzSbg/gmbkq+SAtaCeJ0UbY
	 TRNQdUt2mM4d7qm+i6sD/OuaUXCprjMurNO1eHH+h0tl2hMh81B6/GLdI9XUhfzYlo
	 GucnH4UPwkuMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: ux500: Use AB8505 charger compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-ab8500-charger-dt-v3-2-f80b8d295e2d@kernel.org>
References: <20260925-ab8500-charger-dt-v3-0-f80b8d295e2d@kernel.org>
 <20260925-ab8500-charger-dt-v3-2-f80b8d295e2d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 09:08:11 +0000
Message-Id: <20260925090811.818CC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] power: supply: ab8500_charger probe fails on AB8505 due to missing=
 interrupts
--

commit 200a7cf6b0fcab2522c0b09962c1e5a2bbf1cd85
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Use AB8505 charger compatible

Identify the AB8505 charger using its variant-specific compatible and
retain the AB8500 compatible as a fallback. Remove the nonexistent AB8500
main charger interrupts from the AB8505 charger node.

> diff --git a/arch/arm/boot/dts/st/ste-ab8505.dtsi b/arch/arm/boot/dts/st/=
ste-ab8505.dtsi
> index 131c82508e820..4c9a8418f225a 100644
> --- a/arch/arm/boot/dts/st/ste-ab8505.dtsi
> +++ b/arch/arm/boot/dts/st/ste-ab8505.dtsi
> @@ -137,13 +137,9 @@ ab8500_btemp {
>  				};
> =20
>  				ab8500_charger {
> -					compatible =3D "stericsson,ab8500-charger";
> -					interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>,
> -						     <11 IRQ_TYPE_LEVEL_HIGH>,
> -						     <0 IRQ_TYPE_LEVEL_HIGH>,
> -						     <107 IRQ_TYPE_LEVEL_HIGH>,
> -						     <106 IRQ_TYPE_LEVEL_HIGH>,
> -						     <14 IRQ_TYPE_LEVEL_HIGH>,
> +					compatible =3D "stericsson,ab8505-charger",
> +						     "stericsson,ab8500-charger";
> +					interrupts =3D <14 IRQ_TYPE_LEVEL_HIGH>,

[Severity: High]
Will this cause the probe function to fail on the AB8505 platform?

Looking at ab8500_charger_probe() in drivers/power/supply/ab8500_charger.c,
it unconditionally iterates over the statically sized 14-element
ab8500_charger_irq array:

	for (i =3D 0; i < ARRAY_SIZE(ab8500_charger_irq); i++) {
		irq =3D platform_get_irq_byname(pdev, ab8500_charger_irq[i].name);
		if (irq < 0)
			return irq;

Since this patch removes five of these expected interrupts (such as
MAIN_CH_UNPLUG_DET) from the device tree node, platform_get_irq_byname()
will return a negative error code and abort the probe.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-ab8500-cha=
rger-dt-v3-0-f80b8d295e2d@kernel.org?part=3D2

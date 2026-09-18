Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A051AFDF
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751256; cv=none; b=cIODGReZSfs4aEObKkrBSLdo7v1WxccH+f7zHEzqhAHKRupNex/fsXEZWfdvEVl0MpFoXFtGOyHRNGIfA62GUpozS0LTy6Z1IKKnsKJDOC0TDIjXaVDQNjq3A43e6IhgY2ZXE+2AucQQKH62nzyYW3DKPFNBWPTaEMQwXHE8VwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751256; c=relaxed/simple;
	bh=DzDiNQ19enGmoyMxbmOtC37Ic2kULOFI3hNZAxUH2I8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CJoTNZ1FLfxxk3soSG0wITDuvtQeJ1PG7wqI0ksnenyO0McPIGZkEje6jGqYjKQIJHLiAlSFmOwaBk+kIlhFrpiERz9502JLIbA6tX0CgozmAgzCc8mXwrXLaU648dBW5EQmqTr6M2oD8fDP726ztCe1vMVdau7hV0npjmnjzfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eppCmmog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eppCmmog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5861F00898;
	Fri, 18 Sep 2026 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789751254;
	bh=FmRQSxyOKrKsyTrFuEQ024tqDetYl+yT+TXErnnwmYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eppCmmogKqKuPUmHp7TL5GUWw2O04ThnhV3+kSqvEsFy8ZFLSQRel2wJb5HeXn7CE
	 CSLbf79C+VO/WnAA50JSj01RdrEYSpiumlAmlKDar30+fU2CUj1U87Af0EJJEbGraW
	 fRt7XKV/VZiO7NGGaBIH1dHqUWwlb4H6zDHJn/0PEYNHXuruNGH507p7EKxx/fwi0m
	 UJqzP/7LMGRpIiNAS3kSjJ8Y1cPHrf9yiIwsSK5dV2d/vjJlWOMJ5jjBmfZ1/eAivw
	 Wxdj//6H5laHYvSPaltEfp60nEzRWd1TlGNybkMUFfgilDh4QbVdxarB+bnR6iUTx9
	 r4KdjNucSg1wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: ux500: Use AB8505 charger compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-ab8500-charger-dt-v2-2-5f17c332a2a7@kernel.org>
References: <20260918-ab8500-charger-dt-v2-0-5f17c332a2a7@kernel.org>
 <20260918-ab8500-charger-dt-v2-2-5f17c332a2a7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:07:33 +0000
Message-Id: <20260918170734.2D5861F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] driver: ab8500_charger probe fails due to missing interrupts
--

commit 2f9148d4b2214ca2ec295f5eefd937097f9378a9
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Use AB8505 charger compatible

This commit identifies the AB8505 charger using its variant-specific
compatible while retaining the AB8500 compatible as a fallback. It
removes five main charger interrupt sources that are non-existent on the
AB8505 from the device tree node.

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
>  						     <15 IRQ_TYPE_LEVEL_HIGH>,
>  						     <79 IRQ_TYPE_LEVEL_HIGH>,
>  						     <105 IRQ_TYPE_LEVEL_HIGH>,
> @@ -152,12 +148,7 @@ ab8500_charger {
>  						     <22 IRQ_TYPE_LEVEL_HIGH>,
>  						     <21 IRQ_TYPE_LEVEL_HIGH>,
>  						     <16 IRQ_TYPE_LEVEL_HIGH>;
> -					interrupt-names =3D "MAIN_CH_UNPLUG_DET",
> -							  "MAIN_CHARGE_PLUG_DET",
> -							  "MAIN_EXT_CH_NOT_OK",
> -							  "MAIN_CH_TH_PROT_R",
> -							  "MAIN_CH_TH_PROT_F",
> -							  "VBUS_DET_F",
> +					interrupt-names =3D "VBUS_DET_F",
>  							  "VBUS_DET_R",
>  							  "USB_LINK_STATUS",
>  							  "USB_CH_TH_PROT_R",

[Severity: High]
Will this cause the ab8500_charger driver probe to fail on AB8505 platforms?

The device tree node relies on the "stericsson,ab8500-charger" fallback
compatible, but removes several interrupts. When the driver probes, it
unconditionally searches for all 14 interrupts defined in ab8500_charger_ir=
q:

drivers/power/supply/ab8500_charger.c:ab8500_charger_probe() {
	...
	/* Request interrupts */
	for (i =3D 0; i < ARRAY_SIZE(ab8500_charger_irq); i++) {
		irq =3D platform_get_irq_byname(pdev, ab8500_charger_irq[i].name);
		if (irq < 0)
			return irq;
	...
}

Because interrupts like "MAIN_CH_UNPLUG_DET" are now missing from the device
tree, platform_get_irq_byname() will return a negative error code. This
triggers the if (irq < 0) check and immediately aborts the probe, leaving
the system without USB charger support.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ab8500-cha=
rger-dt-v2-0-5f17c332a2a7@kernel.org?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D1F2AD2C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495906; cv=none; b=YvkfSbV832HU6TtCA7NS2Q5qlD1LpXZBnmRab6zkmeihfaPgkUF19SuxkPmeygJtxE/IhnbuPPsdSmuOKJMU2hpA8ukkrPd4Q9oFmOfYycpyoVr6OxQ3m0T0aiK1IlwHLmTGTjpNI8uMLM2lmXRpmdFPd5xAo9mYlUYctqXCvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495906; c=relaxed/simple;
	bh=EUsuCGYFZnZJ4qCeJxUX3bMCDtpOnvfe9m/1PyvtHAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y3NgwO/ch349vieLm6xdR02/iYvGx8HD8T/apCmFxgLmdlKNdN+5kXzCfHwq1WhV1SgxLHMtjgW6MAwVhnpCAkpuyxPEEhWm3jfntmgQAwkc+hxy/0IBHrD3pNaIyKv6DRlezPtlZvIS3sQ3QgZhUTHmZEcGlwXxyAZ0puhMSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZ+t5xjL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZ+t5xjL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2344C1F000E9;
	Mon, 15 Jun 2026 03:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781495905;
	bh=EDrcdVJ0/bJfuJOVWn9BQIib318qCNEW3O16JsxzkTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gZ+t5xjLaPVDZ3YFKofsg7IQe5lzwWhQbUuC42TNUu9hdl+Itf4MmAZxelK1wqrQ2
	 NB1k12Haf/3krtJgoqnDyKk1HkKC7ozsqnIbE/1+4JldnptV6vP4SBD9/AN1w++OYb
	 iVcoqGcOoyyowCa0u8jk+oQ2xXSTgdlwhS8H6hQu/ZutWaxYlXgzzzGheomNsleOVG
	 DuO6B2IeUIA85qyyj5T/RZVNcKrxOqqJUiYHkHT0j6uBRfB2/z6Dbotdl5LG7sh5n6
	 7mDdezvtCIIDeNK8MRy1tvKVscbtPvP0dg0lXYm2bJ+fR8d+PWiE2xtdb6BYg/UEFI
	 VOJMiS83JgVug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] clk: clocking-wizard: Do not map the memory for
 static-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615034845.3320286-5-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-5-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 03:58:24 +0000
Message-Id: <20260615035825.2344C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Registering the same struct notifier_block to two different clock =
notifiers corrupts the intrusive linked lists.
--

commit 8b915ba31e389cdcf5a743f96eb5c3695bc448c3
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Do not map the memory for static-config

This patch prevents the memory mapping of the AXI register block if the
device is configured with xlnx,static-config. It achieves this by moving
devm_platform_ioremap_resource() under the non-static-config conditional
branch, since only the dynamic path requires the AXI register block.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 4a0136349f71a..e082051221bef 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c

[ ... ]

> @@ -1183,6 +1179,10 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  	}
> =20
>  	if (!of_property_present(np, "xlnx,static-config")) {
> +		clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(clk_wzrd->base))
> +			return PTR_ERR(clk_wzrd->base);
> +
>  		ret =3D of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_=
grade);
>  		if (!ret) {
>  			if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {

[ ... ]

> 		if (clk_wzrd->speed_grade) {
> 			clk_wzrd->nb.notifier_call =3D clk_wzrd_clk_notifier;
>=20
> 			ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
> 							 &clk_wzrd->nb);
> 			if (ret)
> 				dev_warn(&pdev->dev,
> 					 "unable to register clock notifier\n");
>=20
> 			ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
> 							 &clk_wzrd->nb);

[Severity: High]
This isn't a bug introduced by this patch, but it is a pre-existing issue.

Does registering the same struct notifier_block (&clk_wzrd->nb) to two
different clocks in clk_wzrd_probe() corrupt the SRCU notifier chains?

The clock notifier framework uses srcu_notifier_chain_register(), which
links the provided struct notifier_block into an intrusive linked list by
modifying its next pointer. Because clk_in1 and axi_clk are distinct clocks
with separate notifier chains, adding the exact same notifier_block instance
to the second chain overwrites its next pointer.

Could this merge the two chains, causing events from the first clock to
traverse into the second clock's chain? Furthermore, when the notifiers are
unregistered, would the unregistration logic leave the first clock's chain
pointing to elements from the second clock's chain, leading to a potential
use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615034845.3320=
286-1-shubhrajyoti.datta@amd.com?part=3D4

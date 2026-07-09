Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0B3161A3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596485; cv=none; b=D9F11erRB5TsyZw+8xMukRpn7Nw8wUw0hXaOYJSQbXhJmHWnE8yu40gp+fjRVZK6I7NOfJORAp/47itOUrz9sVZQtYg9W+o3+DGKP2GQvAWB9GqZ8DDoc0pmgnrspPnJ9o0/cIgnceKRGwcZb2YyTVY9gtSY98tL99H7r0NSeok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596485; c=relaxed/simple;
	bh=K2q4i1BUtOHLUNHbTs87Eqz3MoDSnPF9MSY6jPRAM/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uMybuLbE5/GQ47XIZPQQKT1srv6KrKOguHBzwgO9X/0PlpNNxRVzeW1BW+HVJ5M/SK9bBvkt2pZKVwUrvups+DMNDVxIrrd49mgJWYJsUHufVrEjg1ZUgKbLvtANijRGfkq59YCJHwzH/T5pi5CEGnXxTKWb7yf+TWHQncOeupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCCs1SKs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCCs1SKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424C81F000E9;
	Thu,  9 Jul 2026 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596483;
	bh=Goj6Bw+hnZGuEzusgtyaoE4c5NexPuMP50pZr+/RxsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eCCs1SKsXQ6plqD0gW2KwRu/pX3Q11dB8xbEYWF4YoPVOK6PBX4dkcUIf8FwUWYoL
	 dBjCreo2yNlDluPygpzHPPdeL6lg8ciArbgLZ/jVkbhRqbX1Pua5DEY3adYk8EWNAF
	 OFB9Qf5mihFrI7xXO17wMZsrmntCRu/Q118LzwQ54aOcnbrZwiYQv0okBQNNNlPo+G
	 saK8W8deyYmW4eXrtKPQxOk0/JvIIi59NovLSP2wlYI/EHaDxX9TcFwROtFCSCTjwu
	 Md+ym8kfl7QAaNSqd8Cs90aEil+YkQKcRWNakrzixtp2K6uy2eKBgC85St7IKxb3rs
	 QTbEdTtsqZdwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] clk: clocking-wizard: Do not map the memory for
 static-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709111403.1579159-3-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:28:02 +0000
Message-Id: <20260709112803.424C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional fetch of `s_axi_aclk` causes probe failure in static=
-config mode.
- [High] The driver completely skips clock and provider registration in sta=
tic-config mode.
- [High] Notifier chain linked list corruption due to registering the same =
`struct notifier_block` twice.
--

--- Patch [2]: [PATCH v2 2/8] clk: clocking-wizard: Do not map the memory f=
or static-config ---
commit 0264def41bcae176c3fa735b3a9b2da6412f451c
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Do not map the memory for static-config

With xlnx,static-config the MMCM/PLL topology is fixed at synthesis time
and no register programming is performed; only the dynamic path needs
the AXI register block. Move devm_platform_ioremap_resource() under the
non-static-config branch.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 4a0136349f71a..e082051221bef 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -1168,10 +1168,6 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, clk_wzrd);
> =20
> -	clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(clk_wzrd->base))
> -		return PTR_ERR(clk_wzrd->base);
> -
>  	clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
>  	if (IS_ERR(clk_wzrd->axi_clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),

[Severity: High]
This isn't a bug introduced by this patch, but since the static-config devi=
ce
tree bindings explicitly make the s_axi_aclk clock optional (because the bus
interface is unused), doesn't this unconditional call to devm_clk_get_enabl=
ed()
cause the probe to fail with -ENOENT if the clock is legitimately missing?

> @@ -1183,6 +1179,10 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  	}
> =20
>  	if (!of_property_present(np, "xlnx,static-config")) {
> +		clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(clk_wzrd->base))
> +			return PTR_ERR(clk_wzrd->base);
> +

[Severity: High]
This is a pre-existing issue, but by putting all the provider registration =
logic
inside this non-static-config block, doesn't the driver completely bypass
registering any output clocks when in static-config mode?

If clk_wzrd_register_output_clocks() and devm_of_clk_add_hw_provider() are
skipped entirely, won't consumer devices depending on this provider hang
indefinitely with -EPROBE_DEFER?

[ ... ]

>  		if (clk_wzrd->speed_grade) {
>  			clk_wzrd->nb.notifier_call =3D clk_wzrd_clk_notifier;
> =20
>  			ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
>  							 &clk_wzrd->nb);
>  			if (ret)
>  				dev_warn(&pdev->dev,
>  					 "unable to register clock notifier\n");
> =20
>  			ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
>  							 &clk_wzrd->nb);

[Severity: High]
This is a pre-existing issue, but does calling devm_clk_notifier_register()=
 for
both clk_in1 and axi_clk using the exact same struct notifier_block instance
(&clk_wzrd->nb) cause notifier chain corruption?

Since the notifier_block contains a next pointer that gets overwritten when
linked into a second chain, won't this splice the clk_in1 and axi_clk notif=
ier
chains together and cause list corruption or use-after-free during clock ra=
te
changes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709111403.1579=
159-1-shubhrajyoti.datta@amd.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8F403156
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767566; cv=none; b=XXFoN28VKLxNPTTQJkCFsyBJlbQeTk73oN+JXANqIZBUQp0e2YadLjQRxoFdlH4jyhM5t4oiUh54YwJwGI3pA6+xEm2YSABmslQH4CqqThT/f9NGKsYQQ3Qet4ZrHPgC6NoTPWK1Ko/fUkS760V1zrKtC/QvDwZ05mThKay0X88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767566; c=relaxed/simple;
	bh=0hTAe+XLNpaAgf9AIcgr4ORp4fHVfODe/QDtLNeXRCE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UaUGK4aHdgUg7YNQMG2noprDt0fekhxnnvtvMxDrK2818/DWMPBU2rbESd7p7Ygr/cUP8hu4xk1q9Zg4WB73pBS9nCrw5diK0NVBPnn838tV9EQfuvV0uBETQ6Rx3aHBJO9MTZoUjlOU7UGKWGoWm26OuyNh5nEZwcuCdXCZzfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iirWkkOk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iirWkkOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0651F000E9;
	Mon,  3 Aug 2026 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767565;
	bh=nzpfoDa7dEUHepoHncyEt2nNbNXbcNPdaqnmkstPvaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iirWkkOk732N+SkARB+hR2HoH1+jnEKedM8vIY5TW/pnT4Qo6qrxZzjESlWz2tZPn
	 /0T/E/2S37dKcPuKSTkfCDzjcPvXaDig9LrsGFqiQEZ/mVHqNuedVfZ/29SRwbqIWg
	 0ISiIpL8UXy2MwCXnMFaba+BgqKGK7SlMT07/dbukLZYmLbfeAV2tdnQ1dBlqaDIeH
	 hLa5ghBiv2ISGlKFQPBHf5WQzAW2o7C8W+Mirecz+94twVIBalbir8nkxdRQ9putIP
	 cEWhI4KhF6wwAT5ocGMHn2JFDaaUvmQQvGVqDBYW4Tmz/KNJvbhz8wTpgwB11HEGnN
	 SC44n2Ap1vu5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: dw: fix APB clock name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803140224.12648-1-jszhang@kernel.org>
References: <20260803140224.12648-1-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 14:32:41 +0000
Message-Id: <20260803143244.BA0651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the return value=
 of `dw_i3c_master_enable_clks()` is ignored in `dw_i3c_master_runtime_resu=
me()`.
--

--- Patch [1]: [PATCH] i3c: dw: fix APB clock name ---
commit 686892a7f9278958827b79c6f3b4b10f19a623b2
Author: Jisheng Zhang <jszhang@kernel.org>

i3c: dw: fix APB clock name

This commit fixes a mismatch between the APB clock name in the code and the
device tree bindings. It changes the clock name requested by the driver from
pclk to apb to match the ABI.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 2f8c0c4683e06..0625587f15274 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1579,7 +1579,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *maste=
r,
>  	if (IS_ERR(master->core_clk))
>  		return PTR_ERR(master->core_clk);
> =20
> -	master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +	master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "apb");

[Severity: High]
This isn't a bug introduced by this patch, but since we are modifying clock
handling here, does dw_i3c_master_runtime_resume() need to check the return
value of dw_i3c_master_enable_clks()?

In drivers/i3c/master/dw-i3c-master.c:dw_i3c_master_runtime_resume():

	pinctrl_pm_select_default_state(dev);
	dw_i3c_master_enable_clks(master);
	reset_control_deassert(master->core_rst);

If the clock framework fails to enable the clocks during runtime resume,
dw_i3c_master_enable_clks() will return a negative error code. This is
currently ignored, and the driver proceeds to deassert the reset and access
hardware registers.=20

Can this lead to an unrecoverable bus fault or system crash if the registers
are accessed without an active clock?

>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803140224.1264=
8-1-jszhang@kernel.org?part=3D1

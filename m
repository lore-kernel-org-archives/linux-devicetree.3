Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B55345EB9
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787529310; cv=none; b=lDKON/rFiX60pLoEv87wv/v3pLdfLwQ0xQYXN77gaKaTqX0HPzZzE+fqjSEa5Ty6neEFPtqf4cAtKp2v71phGIXHC/utimBka59jW3T+OTVn8N72/a0Rxfu/BBoSsC4/DEBW2328FyPbs3/UR7qbYuEC4oTLp2/FG3n9KcPZCFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787529310; c=relaxed/simple;
	bh=RoIspbrMGs1HzG6/GImoeffSXr48axzFV7S1li2E68U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AFlxlp165c0FweLNFOb0kw8n4v4k3JKPuA9qLaz9dMdiB8jn8rN5x6gcLWl/c3CleGX2Jkj260/Sb+zqgsjDxW5wDvW3uOVAkObnQ6Cr5UXrAhrMn567R7WqhZ9nhUzub7ucJznTUkUle/yYpnmqcdGSjp4AEkPOvmyabjRGNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYMgCgYC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYMgCgYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7421F000E9;
	Sun, 23 Aug 2026 23:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787529308;
	bh=R0lxUk5ugNyWPmeeH/2pf45+OuGIzhCziyLP4GsYBx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OYMgCgYC7XRk3OkEHkKUH36aL3VEaDlkrEUS4QLLka7qdjRD9e2oXVr7p9yD3roJy
	 IZq9IvYj5abkicYNuLg7mqEUZxgROXUVk7pLHvta2/KHluiTC6P7sgSlpF8a/7wfw2
	 jzpG/ADGzEERBRas37tP352N4RULQidJcXhPKz1IhEtEazHRC8ZHBaa4DTJ6W7dmDg
	 lBd2EZ6m/3j34DiAfn34DUGDl8EoAe4a0K30a4objz2CafLoG3AGfr+xiaI1kAQmkc
	 otZYn28wcly9inxfBk5pB6FedzVnAyWinp06J17zXlTy8Jekn0yjtH8AqRnep8eN0q
	 4SGqpewaVEWTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: marvell: add missing SDHCI clock-names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260823234721.72903-1-rosenp@gmail.com>
References: <20260823234721.72903-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 23:55:07 +0000
Message-Id: <20260823235508.2B7421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value of clk_prepare_enable() leading to potentia=
l unclocked hardware accesses.
- [High] Suppression of legitimate errors (e.g., -EPROBE_DEFER) when fetchi=
ng the optional 'core' clock.
--

--- Patch [1]: [PATCH] ARM: dts: marvell: add missing SDHCI clock-names ---
commit 4be703994612e3151cc7dd6a9b229ae270b6b4da
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: marvell: add missing SDHCI clock-names

The marvell,armada-380-sdhci binding requires "clock-names", and
the sdhci-pxav3 driver requests its io clock by name before falling
back to an unnamed lookup. Both Armada 38x and 39x nodes only carry
an unnamed clocks reference, so dtbs_check reports "'clock-names'
is a required property" on every board.

Add clock-names =3D "io" to both nodes. No functional change: the
driver already obtains the clock through its fallback.

> diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-38x.dtsi
> index 1d616edda322d..0618779090d04 100644
> --- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi

[ ... ]

> @@ -627,6 +627,7 @@ sdhci: sdhci@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the
sdhci-pxav3 driver mentioned in the commit message, I noticed a pre-existing
issue in how these clocks are handled.

Looking at sdhci_pxav3_probe() in drivers/mmc/host/sdhci-pxav3.c:

drivers/mmc/host/sdhci-pxav3.c:sdhci_pxav3_probe() {
    ...
	pltfm_host->clk =3D pxa->clk_io;
	clk_prepare_enable(pxa->clk_io);
    ...
	pxa->clk_core =3D devm_clk_get(dev, "core");
	if (!IS_ERR(pxa->clk_core))
		clk_prepare_enable(pxa->clk_core);
    ...
}

Are we ignoring the return values of clk_prepare_enable() here? If the clock
subsystem fails to enable the IO or core clocks during probe, the driver
might access hardware registers while the clock is disabled or failed to
enable, which could lead to a synchronous external abort.

[Severity: High]
This is also a pre-existing issue, but does this code suppress legitimate
errors like -EPROBE_DEFER when fetching the optional 'core' clock?

drivers/mmc/host/sdhci-pxav3.c:sdhci_pxav3_probe() {
    ...
	pxa->clk_core =3D devm_clk_get(dev, "core");
	if (!IS_ERR(pxa->clk_core))
		clk_prepare_enable(pxa->clk_core);
    ...
}

If devm_clk_get() returns -EPROBE_DEFER because the clock provider is not
yet ready, the if (!IS_ERR(pxa->clk_core)) condition treats this as if the
clock is absent and proceeds silently without it. Could this break device
initialization if the clock is actually required but deferred?

The unchecked clk_prepare_enable() issue also appears in the runtime
resume path:

drivers/mmc/host/sdhci-pxav3.c:sdhci_pxav3_runtime_resume() {
    ...
	clk_prepare_enable(pxa->clk_io);
	if (!IS_ERR(pxa->clk_core))
		clk_prepare_enable(pxa->clk_core);

	sdhci_runtime_resume_host(host, 0);
	return 0;
}

Can the clocks fail to enable during runtime resume, leading to the same
risk of unclocked hardware access when sdhci_runtime_resume_host() is
called?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823234721.7290=
3-1-rosenp@gmail.com?part=3D1

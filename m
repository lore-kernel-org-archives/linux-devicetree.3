Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EF1395AF6
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786672389; cv=none; b=Q6JuRjIG+DbCte30gRRLrwz5IJUoRhfN7utuQDe2BMBlXHsBvNr0Te1CLuzdtysF01WMrIfZF0R2mbjRRjOjvjczOiVE2ScRTymfqRMhVeC3C1xEhdXEnW39E8TTnvXh++xiTECO4h5ofgXzGbuDWsG3EUPxCH2p/29eEvy77YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786672389; c=relaxed/simple;
	bh=manbfwtyanqwz6hRC5SG6gqgnbJqBEbE6lXUoZ7wX5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sPA3+n9wGdcG3fY/XZN/pNKTOiHFpGoAEQBKbBdbkIo52o1b/Z96oLyLRiUsjJZRLBk1Sa9+qnaIxPA9Kv625geAXjE3+3fW3dNia/pWZmiObS8uGTEeKBTckEp3kz8SUYZQX0BagC55KwXToRfFHMvPPI0irsqOnLOsXXH8qcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QE+GzE70; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QE+GzE70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396081F000E9;
	Fri, 14 Aug 2026 01:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786672387;
	bh=sBcrndKlrqCKkS+aa8j8aNVC8PUU+1oo+sL76LiA/3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QE+GzE705/Xyz0xKUt8ks3A/6I0s6A+x2Hma3NtSHExK8lynWjwWtR+EHfomfDsrA
	 mab/LHVPeCYX4N1i4I37rU+FhPBu24Ett36GnW06vLHK33sx7KXNpe31EGBgSj8jZy
	 yluGePLocxSH2YJpC5jyE7NNn0dfVLYj8b2gun35hUz6MfAkrdLDq+Tbrm2n6lqiDG
	 H6bE+vT5yaKKhcMTDQLqSVZPSGJNr48v+rNQOf9HI0PyK5jFiiXugboCFvLWg1QdgR
	 j7EoqSAdvqU/1vjsFR9IjgpvkLY8rOOPiKES2FMIAGuYpo7lVcqBgusLDR6abD4lBE
	 Xuo+4m3YcWh6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 05/38] phy: rockchip: usbdp: Handle missing
 clock-names DT property gracefully
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-5-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-5-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:53:02 +0000
Message-Id: <20260814015307.396081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The exact NULL pointer dereference vulnerability fixed in `phy-roc=
kchip-usbdp.c` exists in multiple other drivers which were overlooked in th=
is patch.
- [High] Clock prepare/enable and reset assertion imbalance if probe fails =
when PHY is already in DP mode.
--

--- Patch [5]: [PATCH v14 05/38] phy: rockchip: usbdp: Handle missing clock=
-names DT property gracefully ---
commit 6c56ea962e4b5726f304742232f476db1aa9e0f2
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Handle missing clock-names DT property gracefully

This commit fixes a null pointer dereference in the phy clock initialization
when a non-compliant device tree specifies clocks but no clock-names.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.ke=
rnel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 2845a012eafcc..3fc8222fcaec2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, =
struct device *dev)
> =20
>  	/* used for configure phy reference clock frequency */
>  	for (i =3D 0; i < udphy->num_clks; i++) {
> +		if (!udphy->clks[i].id)
> +			continue;
> +

[Severity: High]
This isn't a bug introduced by this patch, but since you are fixing the
missing clock-names property gracefully here, should similar fixes be
applied to other drivers that use devm_clk_bulk_get_all() and check the id?

The same null pointer dereference can occur in these locations if
clock-names is missing from the device tree:

drivers/phy/rockchip/phy-rockchip-inno-usb2.c:rockchip_usb2phy_clk480m_regi=
ster()
    if (!strncmp(rphy->clks[i].id, "phyclk", 6)) {

drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:rockchip_combphy_parse_d=
t()
    if (!strncmp(priv->clks[i].id, "ref", 3)) {

drivers/pci/controller/dwc/pci-imx6.c:imx_setup_phy_mpll()
    if (strncmp(clks[i].id, "pcie_phy", 8) =3D=3D 0)

drivers/pci/controller/dwc/pci-imx6.c:imx_pcie_probe()
    if (strncmp(imx_pcie->clks[i].id, "extref", 6) =3D=3D 0)

drivers/spi/spi-rzv2h-rspi.c:rspi_probe()
    if (!strcmp(clks[i].id, rspi->info->tclk_name)) {

Could these drivers also crash on boot with a malformed device tree?

>  		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
>  			udphy->refclk =3D udphy->clks[i].clk;
>  			break;

[ ... ]

[Severity: High]
This is a pre-existing issue, but does probe failure lead to a resource
leak if the phy is already in dp mode?

If the phy is already active, rk_udphy_get_initial_status() prepares and
enables the clocks but intentionally skips rk_udphy_disable() to keep them
active:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_get_initial_status() {
    ...
    rk_udphy_disable(udphy);
}

If a subsequent step in probe fails, the function returns without cleaning
up those resources:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_probe() {
    ret =3D rk_udphy_get_initial_status(udphy);
    if (ret)
        return ret;
    ...
    if (ret)
        return ret;
}

Since devm_clk_bulk_get_all() only registers a devres action to call
clk_put(), wouldn't this permanently leak the enable counts and unasserted
resets on probe deferral?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D5

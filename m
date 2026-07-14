Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46B44330B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059214; cv=none; b=R3852hNEZiaPg1Kk+T04vJqPyPAyXjLqzIR5ROmW3r1soXJxD0yn3waY7Wd6rSjwipJFvuSYAsqTrP9HO+LQavZl1797y3eCDjooz597ITxB4GjsG5+hjEjvgb/r+QrqJaSwWKeAFPnvyyNj4B0vDeNuxgXuzqmzB0NPzefIow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059214; c=relaxed/simple;
	bh=xVQ/7h2eiowlmYvpMZunDLZ1F9ROsNwwNG1OjZKeR/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pTgFo7xGMUxlPU7umZj4L4VTGq5rES/yTMKNzH3rQPXjBIv2z+2Tq0ONUKFKi+i23tRfJr7SnfMqA42d9yAauJmZCUmnImJeoLXqOUfExuwFKFPvU8U/TMKasrrjLg5/2SHaHxFgkNni5QOt94uYMKZwGAABE+9+TKdDqLlLCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngSbY1/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngSbY1/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577BA1F000E9;
	Tue, 14 Jul 2026 20:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059209;
	bh=o5xU0pMTO/MxS+6hNzLwtvewHPhm9jPPmO/D1RepThs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngSbY1/SwnmidRX7pEkd1QLbkKA9tO/XoZPrtZdjbk2qpxr88rC6yoOExxry3CctX
	 OmMecKFv/UE6ji6IFR+7gwG2EocKW+thUo6wQ+aC9xYcajNLR3TkIoTt8Wr4v+0Vvr
	 1n7eChodCnQ1bddV0Jt9bl6CNu+7qr/90XzwFQoi866UIgN+uzpH3A7QqBqh0A1L69
	 ZlrpRaXMaaL0Dgw6THZUUDiBSTn5L/HCzHM0UGFNhcO6P4Y57WRzim/zpg6iIvsyr2
	 1OVtXBZfgMq7Fd4axQikWE1sWQD2XIEpT5JMyQlzHZDU5kT5zf7Wh/lYytcIjyOPAb
	 ymVvzpEP2fG3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 05/35] phy: rockchip: usbdp: Handle missing
 clock-names DT property gracefully
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-5-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-5-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:00:08 +0000
Message-Id: <20260714200009.577BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing NULL pointer checks for clock ID strings cause kernel pani=
cs on non-compliant device trees.
--

--- Patch [5]: [PATCH v13 05/35] phy: rockchip: usbdp: Handle missing clock=
-names DT property gracefully ---
commit 01abe2c3417df3024104ac116d14a930891d0500
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Handle missing clock-names DT property gracefully

The commit fixes a NULL pointer dereference in rk_udphy_clk_init() that
occurs if a device tree has a clocks property but no clock-names
property. It does this by skipping clocks with a NULL id string.

Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.ke=
rnel.org

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
>  		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {

[Severity: High]
This is a pre-existing issue, but does this same vulnerability exist in oth=
er
drivers that parse devm_clk_bulk_get_all() results?

A malformed device tree without clock-names will result in NULL id pointers,
which cause kernel panics when passed directly to strncmp(). This pattern
appears to still be present in several other places:

drivers/phy/rockchip/phy-rockchip-inno-usb2.c:
rockchip_usb2phy_clk480m_register() {
    ...
    if (!strncmp(rphy->clks[i].id, "phyclk", 6)) {
    ...
}

drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:
rockchip_combphy_parse_dt() {
    ...
    if (!strncmp(priv->clks[i].id, "ref", 3)) {
    ...
}

drivers/pci/controller/dwc/pci-imx6.c:imx_pcie_probe() {
    ...
    if (strncmp(imx_pcie->clks[i].id, "extref", 6) =3D=3D 0)
    ...
}

drivers/pci/controller/dwc/pci-imx6.c:imx_setup_phy_mpll() {
    ...
    if (strncmp(clks[i].id, "pcie_phy", 8) =3D=3D 0)
    ...
}

Should these drivers be updated with similar NULL checks to prevent
graceful probe failures from becoming unhandled kernel panics?

>  			udphy->refclk =3D udphy->clks[i].clk;
>  			break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D5

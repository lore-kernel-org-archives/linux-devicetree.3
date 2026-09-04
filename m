Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2EB51D53B
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548119; cv=none; b=c0WzQ3hSGk36wY8RoIdre6nxNQ1nhv5RNjZ8PM/W6eTvmGQA2FBYFexIBMUQCJDqxqv/s/KsaRH7pBI1YLqTbLszkgyCHS3by+Vq8RRYDk7rJ8SZ7fm4XlK+CHQK/bUSIUBbKblsFEsSxT22Dqc8QeT3KfFz/CsgVl62fV9Z1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548119; c=relaxed/simple;
	bh=mnR5D9KgQUGe8H1y0h5VkuIGcWMmvFijEkpm2frhA4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ny35ptct6oCigFyWiBqyv5tyGfNc933rS77knfFn2ybhk6lWMM87eT3Qgnxjl+NCK6/UMHpBCHF55ZI58OeF2EXShiCPnrgmVvCuAG3wMM1V7HdOboo7yA8xncPjklZrfeVuPWCnUJVAIfvJ3+kmOGZiLtDXyB1vDkuEYu/2S5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlbUz0TD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlbUz0TD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C181F00A3F;
	Fri,  4 Sep 2026 18:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548117;
	bh=NDe6/mvOXWaAbus3ys0B3NopuvfssdG3wSsVva4R5EE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FlbUz0TDFOJQDz8bDQrlI2WuCPkChs8UISDwWipB/pie7VYs1WGMMI/77eA8b4AdX
	 NVPJxE+z9VIYrEDk4emgj4xZ+TGUJxXWHkNqUj+bYeLEMxncUWFyR9QH9BXvcndmd9
	 ET5hcapFXMnjIuA//CoqSH809y1vxXYqVKtpnNSGoGxK3qMIMRfbrOArGEyJcyoJTu
	 FZ4XnPCpmRRWQpq+2LMsXzfdDZNHd8iBFVem8SwKNE9YIiefU/bvJxQBAp7kZCQuIn
	 QVj8f/Sb8evSPH3Xc0b9hgtAmsFO165o5nsPSXXI7XwTIPSjKeARhRBlQKssz9HGSW
	 8JkcLmhG9KX2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 7/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:55:17 +0000
Message-Id: <20260904185517.85C181F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware initialization ordering mismatch causes 1-second busy loo=
p and RGMII DLL lock failure on first Gigabit link-up.
--

commit a0ec14dab79ed801bb626d58b6ec17e6c1024077
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed

This patch changes the initial RGMII link clock to 10 Mbps (2.5 MHz) during
probe to save power before a PHY link is established.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2ca2f03de3017..4f9bef662c579 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *=
pdev)
>  				     "Failed to get serdes phy\n");
> =20
>  	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
> -			       SPEED_1000);
> +			       SPEED_10);

[Severity: High]
The commit message states that fix_mac_speed updates the rate once a link is
established, but does fix_mac_speed actually update the rate?

Looking at stmmac_mac_link_up() in stmmac_main.c, it calls fix_mac_speed
before set_clk_tx_rate:

	if (priv->plat->fix_mac_speed)
		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
					  speed, mode);
    ...
	if (priv->plat->set_clk_tx_rate) {
		ret =3D priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
						priv->plat->clk_tx_i,
						interface, speed);

Because the initial clock is now SPEED_10, when a Gigabit link comes up,
ethqos_fix_mac_speed_rgmii() will wait for DLL lock while the clock is still
running at the slower rate:

		/* wait for DLL LOCK */
		if (read_poll_timeout_atomic(rgmii_readl, val,
					     val & SDC4_STATUS_DLL_LOCK,
					     1000, 1000000, true,
					     ethqos, SDC4_STATUS))
			dev_err(dev, "Timeout while waiting for DLL lock\n");

Will this cause a 1-second timeout and fail to lock the DLL on the first
Gigabit link-up?

> =20
>  	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-shikra_eth=
ernet-v1-0-a50765996035@oss.qualcomm.com?part=3D7

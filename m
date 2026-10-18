Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F563BBFCB
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792316829; cv=none; b=OokHyiIeYtp395VJfknDsKvo2HOWvVzWwFCQS3PFsvGFk4EAVRbYqAiKHTAXrWkxVk3W0g9PlJqXo1QoG0xxf0KJlAje7WR6tzsvT7/1jNSbPSc6PFx2BG8PF3CiIIHYUDEC1Ha9PyAJclS9yqjiVSg8iasKnYRkNZ/0XiaXUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792316829; c=relaxed/simple;
	bh=bMv9oEOLzC6TkcrEIsvSp/Vl8xKT++BOu3DccG0Eqpc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HE3KIUVpkXQEa/IDZV6mWRuLOzx0CCgvw7lEUShM9/CGFjjxFTQ4xutQP4Gni/NTHR9/fab2eDnWbnLcyvtg4KJbcNsEffXj6ohiy+mQ5oGZ8hdymUN2LyNbwEB2dgeBpPFmyCKF88+e1yCLiy/z1H5aNxy3y4lKjTLRzsdqTgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O32mBT6l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O32mBT6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617A61F000C5;
	Sun, 18 Oct 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792316827;
	bh=lmYgX5CI+ROdbrToUC0DRA7H/Sh5R1UzbJ5MQSHfRGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O32mBT6lKKiMGTxILTnDlWYMd2nrSWOGW4GAmxJ3qC3AgzHNfV7I1j8YBCLXgnSPb
	 ZnZgBpZVKUfhNC7L+zg0P0pLKXzhWUKhPHKBsWBNYNgzpmkPaeKTOyffaYblvkGY4y
	 nCCG8frI/KsY4RPdfk46MZzyiHUjKpP4rgpxUZp4XnQSiYvSK2k4rZ11riiwQdAgBo
	 XDn4MhOchPE1aRqRq9Oi4d8Bn5/4gd8W0eF6tG8pynzOne9ajVkz9UyX6Gc0NV4ZLq
	 ACtSgeaypBsTxTfNMU6WyEEwr0pTQdZdAs0E+UJiitvcFPz1fn+oU16IaYnb+8Y2pE
	 CENsK6IRn2/pw==
Message-ID: <sashiko-outbox-176027@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 6/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-shikra_ethernet-v3-6-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
 <20261017-shikra_ethernet-v3-6-26a8beb44b8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 09:47:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] qcom-ethqos: 1G DLL configured at SPEED_10 in ethqos_fix_mac_speed=
_rgmii()
--

commit d682d4a3cd0ce180df92d414cfd6684dfbcfe09f
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed

This commit changes the initial RGMII link clock rate in qcom_ethqos_probe()
from SPEED_1000 to SPEED_10 to reduce power consumption before a link is
established.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a92bf4a6a2dbd..2471871562ed9 100644
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
Does initializing ethqos->link_clk to SPEED_10 cause the SDCC DLL to be
configured and calibrated at 5 MHz instead of 250 MHz on the initial
1000 Mbps link-up in non-RGMII_ID modes (PHY_INTERFACE_MODE_RGMII,
PHY_INTERFACE_MODE_RGMII_RXID, and PHY_INTERFACE_MODE_RGMII_TXID)?

When a link comes up, stmmac_mac_link_up() in
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c calls fix_mac_speed()
before set_clk_tx_rate():

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_mac_link_up() {
	...
	if (priv->plat->fix_mac_speed)
		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
					  speed, mode);
	...
	if (priv->plat->set_clk_tx_rate) {
		ret =3D priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
						priv->plat->clk_tx_i,
						interface, speed);
	...
}

In ethqos_fix_mac_speed_rgmii(), for non-RGMII_ID modes at SPEED_1000, the
driver enables the SDCC DLL, polls SDC4_STATUS for SDC4_STATUS_DLL_LOCK, and
calls ethqos_dll_configure() (which programs MCLK_FREQ_CALC for 250 MHz and
waits for DDR calibration):

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:ethqos_fix_mac_spee=
d_rgmii() {
	...
	if (speed !=3D SPEED_100 && speed !=3D SPEED_10) {
		/* Set DLL_EN */
		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,
			      SDCC_HC_REG_DLL_CONFIG);

		/* Set CK_OUT_EN */
		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
			      SDCC_HC_REG_DLL_CONFIG);

		/* Set USR_CTL bit 26 with mask of 3 bits */
		if (!ethqos->has_emac_ge_3)
			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
				      SDCC_USR_CTL);

		/* wait for DLL LOCK */
		if (read_poll_timeout_atomic(rgmii_readl, val,
					     val & SDC4_STATUS_DLL_LOCK,
					     1000, 1000000, true,
					     ethqos, SDC4_STATUS))
			dev_err(dev, "Timeout while waiting for DLL lock\n");
	}

	if (speed =3D=3D SPEED_1000)
		ethqos_dll_configure(ethqos);
	...
}

Prior to commit 9192320a65b7 ("net: stmmac: qcom-ethqos: convert to
set_clk_tx_rate() method"), ethqos_fix_mac_speed() updated ethqos->link_clk
before configuring the DLL and RGMII macro. After that commit moved the clo=
ck
rate update to set_clk_tx_rate(), the initial 1000 Mbps link-up after probe
only had a 250 MHz clock during ethqos_fix_mac_speed_rgmii() because
qcom_ethqos_probe() initialized ethqos->link_clk to SPEED_1000.

With qcom_ethqos_probe() now setting ethqos->link_clk to SPEED_10, won't the
first 1000 Mbps link-up run ethqos_fix_mac_speed_rgmii() and
ethqos_dll_configure() while ethqos->link_clk is still at 5 MHz, and only
switch ethqos->link_clk to 250 MHz afterwards in ethqos_set_clk_tx_rate()
without re-locking or recalibrating the DLL?

> =20
>  	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-shikra_eth=
ernet-v3-0-26a8beb44b8f@oss.qualcomm.com?part=3D6

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D433AE189
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 20:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899116; cv=none; b=NKoNJ82VGTWaDKuhPMgQ/mP/KZ114Tc46Eu1XRBbHv75mcdz+Ri8hpRshBcFT/hrSwATRc7MSUA4RjWj7HdBsO9ZE3sy7ixKByQi/cieGwzDxQ++jhcQCFNPjn2UDWrne88oHifTXCcZ5mYKRFqeZrVzd9/OyR/Q7cyoxxJSeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899116; c=relaxed/simple;
	bh=LUP/qaA2VL+TgFAWsnCUuR722HDUdQ2cj0FKhuh8vyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dc6ceUllShtYUkNsXsMG6ZBAn/aQdMVOYMTkV29DbKO8DI0CXUndc+oVXBDT9CGyGZ0lZZfYKMlS07VttQmrFzefTJ+fLAv0FKcYCEQrwTCEuLBSZhmu/bX3l6Tq2Fm4nawpjaX9h8gdeaIfMvOyMTBt4IjXXrkVm0fFz5yagn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mw/uLbv/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mw/uLbv/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E9F1F00A3A;
	Tue,  8 Sep 2026 20:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899114;
	bh=MfWLHcVJVRdIoYLBDhYmzOev318Rcix6bubcPEzFGKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mw/uLbv/WTqxMbTm5bXvOH2XvSp7KWi6Q7J7GKoPb25LTjmU0JpOieBSMvKFHRWCI
	 c50lCN30eKTbvTrNzrHWWMhPTLYsxEtz0ZgVK1g5hb90NlfrekmfVjAPoNwosvwKZP
	 LbZshYJl8rme9eYwKEs8Iw6Q1aCE/ddg+0h67Rw7sE+5E4hhEQysaWy/SmMi5yf7vn
	 Eo4DhBGyJfL7KifMd3b8nLsThMsnOauV8KeFZXi+WcJd+l+b6TFpStdy6cIuqNv7LK
	 etMyFNjgCcHDCWJ1i/p4imOz63cYV348mZ2mA5owu+dI2f62Rv0LxFEVrJTb5LB1lJ
	 sR4da6XeYsJ1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 7/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908-shikra_ethernet-v2-7-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-7-bbe3389d0652@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 20:25:13 +0000
Message-Id: <20260908202513.E9E9F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Changing the initial RGMII TX clock to SPEED_10 (2.5 MHz) breaks t=
he hardware DLL lock sequence during 1 Gbps link up, causing a 1-second ato=
mic busy-wait timeout and failing the DLL configuration.
--

commit 36a5f61a268a7a30466d5832cfdaa8bd8c6ffce7
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed

This commit changes the initial RGMII link clock rate on probe from SPEED_1=
000
(250 MHz) to SPEED_10 (2.5 MHz) to save power when no PHY link is present.

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
Does this change break the hardware DLL lock sequence during a 1 Gbps link =
up?

The commit message states that fix_mac_speed updates the rate once a link is
established, but looking at stmmac_mac_link_up(), the STMMAC core invokes t=
he
fix_mac_speed callback before it updates the TX clock rate:

stmmac_mac_link_up() {
    ...
	if (priv->plat->fix_mac_speed)
		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
					  speed, mode);
    [ ... ]
	if (priv->plat->set_clk_tx_rate) {
		ret =3D priv->plat->set_clk_tx_rate(priv->plat->bsp_priv, ...);
    ...
}

Because the clock is still physically running at 2.5 MHz when
ethqos_fix_mac_speed_rgmii() is called, it attempts to lock the hardware DLL
for 1 Gbps with the incorrect clock speed.

Will this cause ethqos_fix_mac_speed_rgmii() to busy-wait for 1 second in
read_poll_timeout_atomic() and ultimately fail the DLL configuration, break=
ing
1 Gbps TX connectivity?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet-v2-0-bbe3389d0652@oss.qualcomm.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C751D532
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548122; cv=none; b=lipqVSmptmh65WTbVqSyX0uv2DluFRqRl+aCvjAMELRON8sTTzuOsvI30SCmXTNOS7rNJ2yR71OA/Z1L2tBsiylxk9GgNJC4PnV/04MxRJ58tdqvQ8T0yfbdMJ4gntN56qhNRuKIvY5Gj7QR8bRXgQBvoYX/kmkg03THEIw3n7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548122; c=relaxed/simple;
	bh=pZn9CcrceKZ5Pm7wVprds0iWMh6aFgtSERFT4cwq460=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tryzIFcwRtz7rcNTiTKrXmEpJkVS9hAa1o8+Wg4jmCIk1nrlkzAUaJJhDQ7q3PKYvObp/fIuFM/7eTPrh116J0R72qWT1IdRMABgyzoU2pMPNvCK5/kcOMnzYTbibbVH63pS0HSMw1M8/LAeOucxsRP5n/fiRgOksTe/YgVqNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TC7kt+rX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TC7kt+rX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C68A1F00A3D;
	Fri,  4 Sep 2026 18:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548120;
	bh=EZYplP/kSK8kn6yBNu+B8d4CYCdZLAqauMtQ14BSwvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TC7kt+rXO1mwsPzsqi3Phr4Sy4Dld5cJV3gt85ysDTopvYO/LVuU9jnsokVqxuJq9
	 0sOKuSqM8tU+nniGxmYNlcYEHY1npxBIbk1TqKnUgMs3wXZQEohyEsDFZDwKp8YO2+
	 Tn8sGqB8QetjX72KqLQm8sBbNtMBGcFQJoEAyr+zn9Gry3h7qbJsFZncrtGTDigHfe
	 N6r6xigny+5/ehc9nOLhNSvKiVb6GtnpPxrAnP1gp9wwr1Rpy9FwOjWlG/HGq0MOQH
	 oMxRr9clfR9I27tmp+DY6s/vNZ38Gk9SONIGQha+nMLxIbDfJDIBs1aXXk6W7/IecA
	 gxH3PGKtn549A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-shikra_ethernet-v1-9-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-9-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:55:20 +0000
Message-Id: <20260904185520.6C68A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The PTP clock rate (`clk_ptp_rate`) is captured from the `stmmac=
eth` clock before its rate is updated to 120MHz, leading to incorrect PTP t=
imestamp calculations if `ptp_ref` is omitted from the device tree.
--

commit 6df66dc49bfcbb8fca628cf4fea13cac0f605200
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add Shikra EMAC support
   =20
Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
all at 120 MHz, and the 36-bit DMA address width.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a31541506a4c9..f96680456472d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_=
0_0_data =3D {
>  	},
>  };
> =20
> +static const struct ethqos_noc_clk_cfg shikra_noc_clks[] =3D {
> +	{ "axi-noc", 120000000 },
> +	{ "pcie-tile-axi-noc", 120000000 },
> +	{ "stmmaceth", 120000000 },
> +};

[Severity: Medium]
Since the stmmaceth clock frequency is being set to 120MHz here, could this
lead to an incorrect PTP clock rate if the ptp_ref clock is omitted from
the device tree?

In qcom_ethqos_probe(), devm_stmmac_probe_config_dt() is called before the
noc_clks are initialized. If ptp_ref is missing, the driver falls back to
caching the main clock's initial rate:

stmmac_platform.c:stmmac_probe_config_dt() {
	...
	plat->clk_ptp_ref =3D devm_clk_get(&pdev->dev, "ptp_ref");
	if (IS_ERR(plat->clk_ptp_ref)) {
		plat->clk_ptp_rate =3D clk_get_rate(plat->stmmac_clk);
		plat->clk_ptp_ref =3D NULL;
	...
}

Later in qcom_ethqos_probe(), the noc_clks configuration updates the stmmac=
eth
clock to 120MHz. However, ethqos_ptp_clk_freq_config() returns early when
clk_ptp_ref is NULL, leaving the cached clk_ptp_rate at its original
boot-time value rather than 120MHz.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-shikra_eth=
ernet-v1-0-a50765996035@oss.qualcomm.com?part=3D9

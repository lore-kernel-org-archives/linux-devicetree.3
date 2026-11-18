Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991636;
	b=f3NgLAwZ/xjFfMaXfuDVmPiXZae4JX5FL/1fdjA4AK8jdv5S8Kx6wQE4zgpQrHBQoKst
	 nC3lKEh3eiyj+974V6xOsXR1mG1eRX0xSGi3wnB/yVamzlO1Z/ZrQU46y4vha1xR/UuFu
	 ldsOT6xgcKtIm6fo1a5N3CGzff+B861UioYRVM0AwV1h4gEXOYxaRiSN/YjNnIHKzGApj
	 y4AH/v9xegIQo/oJgO4tBXkYaMpxeP40XKL54oE0xa8kdX9IjLoV9cewzwXaHLPFSJ7T1
	 JvaXgKM3Yre2RDtGDqGsTLbLKEGlx/ZxCytuBozzEbUDCJ8rCtKXHCIgyTEubILOJAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PqXnRl6D2EmP+yuu1aqseAlmBHUq5E5+AWqO6186dvg=;
	b=xgYG+Nd1qjdP3DE2Rg36ySu8oEp9NPvDrKLqishk0csIBCNV+yJl8kYjxzveRYMvzyjV
	 zZqpz2bIlJGajPNf8gPTWgTi92aUv92sN8St6cEsbORQL6BIp8YIpfmQuLRjojoJCM1mG
	 g07wgutTg65U0jDH121R5FAc6ywDGCldzjUsIrOWauhmaE20XeRHxKlEqm4wtpWhv3kqS
	 gMr9obl3Ljv5o+Neyl/5MGNygarJ3U2j8i3WUBw6BKZy4AZExMr4G5G/nCpyq2AKCR3Er
	 TbitJnlRTSjoIwfis9IAoJc6ABbD0L3BDhliuWQePO/Luk9QePiodAkgev8kF2G2z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kE67CvA6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CB606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kE67CvA6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2E81F000C9;
	Wed, 18 Nov 2026 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991636;
	bh=PqXnRl6D2EmP+yuu1aqseAlmBHUq5E5+AWqO6186dvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kE67CvA6MMFjryD/9b4aCqPkEQhLXJuIhES/KqC5lMw3jxWtLQ+WbwYRu1UrDKkp/
	 Y/9PHvyv4VBYNoCnG7PIcCco5wB5tPhQWQgSmw3fQgL5sASHSziEAiwE0R4KIdA99L
	 op1LrbavXgP+6GpC/O6rkBr8C3xw4Kz/zYJAxwcT6s+HQA3cFcJMRaoPdZR82gCvEz
	 +sXnbSITjWl5V97QNJ+5cKt//dFEKlNBLkB3bD4OIAE4s5u5NAtCH+OTPuMSBBVM3r
	 rX3tobziXhbw40TUbstJZ8XH+G8eie/DoSXrDlqmY06o7yVCLGpTbp74gr+2ikM6Y6
	 iF6GcOHIldmQg==
Message-ID: <sashiko-outbox-220503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:47:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: stmmac: qcom-ethqos: missing rgmii_por in qcs615_data
  breaks non-rgmii-id
- [Medium] net: stmmac: qcom-ethqos: missing delay check in
  ethqos_set_clk_tx_rate()
--

commit ff8ea751ebe2e9565a1a5cafb4eabe2a1f08cfa9
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add QCS615 EMAC support

This commit adds a dedicated qcom,qcs615-ethqos match entry and driver
data descriptor with phy_managed_delays enabled for QCS615.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a7fdba73da2ba..790159ae1be7a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_=
3_0_data =3D {
>  	.setup =3D ethqos_hlos_setup,
>  };
> =20
> +static const struct ethqos_emac_driver_data qcs615_data =3D {
> +	.rgmii_config_loopback_en =3D true,
> +	.phy_managed_delays =3D true,

[Severity: Medium]
Should ethqos_set_clk_tx_rate() also check ethqos->data->phy_managed_delays
before skipping the clock rate doubling for PHY_INTERFACE_MODE_RGMII_ID?

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:ethqos_set_clk_tx_r=
ate() {
    ...
	if (ethqos->phy_mode !=3D PHY_INTERFACE_MODE_RGMII_ID ||
	    speed =3D=3D SPEED_1000)
		rate *=3D 2;

	return clk_set_rate(ethqos->link_clk, rate);
}

ethqos_fix_mac_speed_rgmii() only uses the DLL-bypass path when both
ethqos->data->phy_managed_delays and PHY_INTERFACE_MODE_RGMII_ID are set.
On platforms where phy_managed_delays is false (such as QCS404), using
rgmii-id still configures the MAC for non-bypass mode (expecting 50 MHz and
5 MHz at 100M and 10M), but ethqos_set_clk_tx_rate() requests the
DLL-bypass rates of 25 MHz and 2.5 MHz, causing clk_set_rate() to fail on
clock controllers that do not support those rates.

> +	.has_emac_ge_3 =3D false,
> +	.setup =3D ethqos_hlos_setup,
> +};

[Severity: Medium]
Does omitting .rgmii_por and .num_rgmii_por from qcs615_data break RGMII
modes other than rgmii-id on QCS615?

Previously, QCS615 matched the qcom,qcs404-ethqos fallback
(emac_v2_3_0_data), which sets .rgmii_por =3D emac_v2_3_0_por and
.num_rgmii_por =3D ARRAY_SIZE(emac_v2_3_0_por).  When ethqos->phy_mode is
PHY_INTERFACE_MODE_RGMII, PHY_INTERFACE_MODE_RGMII_RXID, or
PHY_INTERFACE_MODE_RGMII_TXID, ethqos_fix_mac_speed_rgmii() does not take
the ethqos_configure_rgmii_id() path and instead relies on the rgmii_por
loop to reset RGMII_IO_MACRO_CONFIG, SDCC_HC_REG_DLL_CONFIG, and
SDCC_HC_REG_DDR_CONFIG before applying speed-specific bits via
read-modify-write helpers.  With num_rgmii_por left as 0, those registers
are never initialized or cleared across link speed changes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-shikra_eth=
ernet-v4-0-c41902e5f2fa@oss.qualcomm.com?part=3D10

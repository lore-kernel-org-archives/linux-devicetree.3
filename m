Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787174;
	b=z7BwxiWNSJoI7W+I66H4KTQXuCKdVrXUOUQQPasW9vnpTe/nyjqbGbM8uj4w0WkAwSxh
	 42lyE/OFFHju3PjLw53Y4kkypx2uXvNmE2yT6cItYokke2S+WZx5q8hU76ckMpUTV9ZKP
	 vPwpWAvlSxQfyRsDAtJR3ezwipn75TcZRkcJbv0eypI2EzlGGmIVHN86WFtxy+TCQ+EEU
	 MhbpmlAKX/R5kn7i6RWTbMN246NNjHZg6K1sbbGtajzuxbyEyS2gZmqgYGd4U2Ws6onJ8
	 EWdBjSxIIIpl0o1luGTlyM6w0fX4EKi8TfLFVPbiR/XZ6coJCM5P476Yx5hx0myJ1+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787174;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SSGxQxXwVsIxshnvaDALgD0nwH/cLF0sGqXTAZ4gOMc=;
	b=AgV/cP481mCEo4cSMMW/f1MKA24ACV/vYkfva6dqkKBmtkclHwvj+Jw8OMkgnWMbexr8
	 wcFrXjujCbRJumf9kzJj/Ba13gzg/GjXHEC7/fhe9sq+kAFN5eNWF8vOBGrfzqL56RO0f
	 HCqOd8yA5hL6YZf3U4Trql089XOBPqA8muATyWtFQEYog0Fl++lONPnGErWbE6nS8SnVm
	 yj18UKJxxfNXxStzlNUxNdd97mKCE3Vr6jJMTMgswV16tpJkr5kFM6NVMir/NaKweB9Fm
	 b+GHe2aEki3Os3kqwndk0S3bBYFmPMxnWxP0Qiz/JDMEtyYhdQAuXNPOZBQvYA0StBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cj2S11S5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65F0606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cj2S11S5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DAA1F00919;
	Wed,  4 Nov 2026 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793787174;
	bh=SSGxQxXwVsIxshnvaDALgD0nwH/cLF0sGqXTAZ4gOMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cj2S11S52st0KdRdj8f2ezA4IXv2y6K7zW1S4i2BLSKaam9EY5mIieiCR4qq+B47y
	 68Vxr6aytC2O+Q/qW+Aw/XfedMH/c9fUXmEFdonsIo6z5Ls+t4tp7kgV3gQ3hOKLzU
	 wF1ye2kdfX71zg7by/h5Ptv0rN0ipQSEXsdkL5wfQ5CRXIx5si9s9sU8NzkPAugVlW
	 elB/XveeQT3and1SAXoBUTiNi8i8pFRW0IKVpswi1UTv/uC/wxz8Pu1JNebToO6Hor
	 +yZtesd4VlRj7xgSVFBL5IWqzzls3xA1J9ioeFCRp30Uus/6XLJ0yfjinSAxl1gN57
	 QKnnVYsUZJRrg==
Message-ID: <sashiko-outbox-197065@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 08/10] net: stmmac: mediatek: add
 PERI_ETH_CTRLx register offset in platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-8-c86c14fc50f4@collabora.com>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
 <20261103-dwmac-mediatek-mt8189-v4-8-c86c14fc50f4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 10:12:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: stmmac: mediatek: mediatek_dwmac_config_dt() rejects valid MI=
I delays
- [Low] net: stmmac: mediatek: wrong variable logged in mediatek_dwmac_conf=
ig_dt()
--

commit 05d42c75b36c4f80f5abd461a78c55c1f2aba21e
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: add PERI_ETH_CTRLx register offset in platform data

This commit adds a peri_eth_ctrl_offset field to struct
mediatek_dwmac_variant and updates mt8195_set_interface() and
mt8195_set_delay() to access the PERI_ETH_CTRLx syscon registers relative
to that base offset.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 61bc1ff08cc44..0426a08769569 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -432,6 +443,7 @@ static const struct mediatek_dwmac_variant mt8195_gma=
c_variant =3D {
>  	.mii_delay_stage_div =3D MT8195_MII_DLY_STAGE_DIV,
>  	.rgmii_delay_stage_div =3D MT8195_RGMII_DLY_STAGE_DIV,
>  	.dma_bit_mask =3D 35,
> +	.peri_eth_ctrl_offset =3D MT8195_PERI_ETH_CTRL_OFFSET,
>  };
> =20
>  static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *pla=
t)

[Severity: High]
In mediatek_dwmac_probe() -> mediatek_dwmac_config_dt(), can valid MII or
RMII clock delays on MT2712 be rejected with -EINVAL?

In drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c, mt2712_gmac_variant
defines a larger maximum delay for MII/RMII (17600 ps) than for RGMII
(5440 ps):

static const struct mediatek_dwmac_variant mt2712_gmac_variant =3D {
	...
	.mii_delay_max =3D MT2712_MII_DELAY_MAX,
	.rgmii_delay_max =3D MT2712_RGMII_DELAY_MAX,
	...
};

However, when the RGMII-specific tx-internal-delay-ps or rx-internal-delay-=
ps
properties are absent in devicetree (as is normal for MII or RMII modes),
mediatek_dwmac_config_dt() falls back rgmii_tx_delay_ps to tx_delay_ps and
rgmii_rx_delay_ps to rx_delay_ps, and then unconditionally checks both
against plat->variant->rgmii_delay_max regardless of plat->phy_mode:

	if (of_property_read_u32(plat->np, "tx-internal-delay-ps",
				 &rgmii_tx_delay_ps)) {
		rgmii_tx_delay_ps =3D tx_delay_ps;
	}

	if (rgmii_tx_delay_ps >=3D plat->variant->rgmii_delay_max) {
		dev_err(plat->dev, "Invalid RGMII TX clock delay: %dps\n",
			rgmii_tx_delay_ps);
		return -EINVAL;
	}

Wouldn't any MT2712 board in MII or RMII mode with mediatek,tx-delay-ps or
mediatek,rx-delay-ps in the valid range [5440, 17600) ps fail the
rgmii_delay_max check and abort probe?

[Severity: Low]
Also in mediatek_dwmac_config_dt() in
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c, when the RGMII RX
clock delay check fails:

	if (rgmii_rx_delay_ps >=3D plat->variant->rgmii_delay_max) {
		dev_err(plat->dev, "Invalid RGMII RX clock delay: %dps\n",
			rgmii_tx_delay_ps);
		return -EINVAL;
	}

Should dev_err() log rgmii_rx_delay_ps instead of rgmii_tx_delay_ps here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-dwmac-medi=
atek-mt8189-v4-0-c86c14fc50f4@collabora.com?part=3D8

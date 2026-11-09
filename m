Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252151;
	b=LPSqBEwXO6c7qgwL0UvHKfIQ8JJ9CtAU4X8CPXSoq8E5q1vieAzC7RTi8Vs9FFUHwFtz
	 Y0Zx/ny/5Yi5iIVS5BzLOzJ6DEL4Pt6K8HR36EjWkJJl+IlgeBafbGjL7lrsaV5oEdV5t
	 1S3Pr2LJHFGkaC/YI6aZd2E0Sbn3u8GEe1noASd2EgaTBAGgYTC5hb/Ei0mc2bqn+zA/Y
	 liMGwGA8hJDyPSCd34qxvKE3ysIlsd2pgrZcFDPoWdzSki9/1EClYgzjlsG+Wxqz08/6+
	 La71YUbm1gvtOB8op3d+PAiEfJgNn7mUkE/k4K4OZbgZHNIFkcqINm1ShetIiUIQyFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252151;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JhXrpZ9xl5Vp35Tet+ccKCW492MK8Jljq3r8XLeR0XA=;
	b=nKpTww+aLP3i2GxW27AEpvzk2y+rZupLn8kX1F1jOW/FLrq4iUKujXDJ0pbdHtC5hFHl
	 Sc+22TC2z81gecKb2I3MCplc5/BltcqdxURLhy/8Pl00we7UNmBQ0FWlgr7qoud8I2U8s
	 JYft8pDDJsAXGA2tnuf48YTQN6Xs5rqLhRnLag4x45Ls1oQdqhKwFPViyh8jAvJJSXOOP
	 NblqWtFzCEygXJDKGGaOwZwHq/yoLIdApaFoWhAxSjanO+sHBNURC9kKAyheZIrt1u1pK
	 fTVXi+2JPBw5yYe5GMcyCE2HuCVRkJcDmlCptwrGx++bicitZoldDegwPrT5TPcUjIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyNHE2Qb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C063606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyNHE2Qb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42F51F0089F;
	Mon,  9 Nov 2026 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794252150;
	bh=JhXrpZ9xl5Vp35Tet+ccKCW492MK8Jljq3r8XLeR0XA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XyNHE2QbreJnJGJw4m6e7vNKbElWxtIAhl9vMkBlpANl9O8v3mRmYK5F2c7FGg4rD
	 04Id/FE67SZDioukCdoQpEpKDzJT9z0QMC9ZsnYGaNRrr+UdfLlgrCq/zQD4vq5n1g
	 +iOhFWAvUMoMynnNJXLyN7OxozDCJis94Ih17HivfKN45J2Agb+hObuFMOfeAiEW2t
	 mw8ixEeW2MeT3ldFbGGl7MGJUncwaVcjfkiFwByJILwqeT/ozAIrhZw9wQDlUwkP8U
	 wVzq9ZxEybZ2wwSOiWm+5NVODHTUpHulefN0/I8mVwFyZlRxdhkP8R+8K/Y00IowZt
	 uCJabmm1Bc2Bg==
Message-ID: <sashiko-outbox-205485@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <cyan2254650260@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109191515.252449-1-cyan2254650260@gmail.com>
References: <20261109191515.252449-1-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:22:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: rockchip: inaccurate MAC delay comment for rgmii-id
  in gmac1
--

commit 36ad97aa6620e705c8d483b7d079ee580a180c77
Author: Pufan Jin <cyan2254650260@gmail.com>

arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1

This commit changes phy-mode for gmac1 on the LubanCat 4 board from
"rgmii" to "rgmii-id" to resolve packet loss on the RGMII link.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
> index 0d28c616524fe..a042aa7021ffd 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
> @@ -168,12 +168,13 @@ &gmac1 {
>  	clock_in_out =3D "output";
>  	phy-handle =3D <&rgmii_phy1>;
>  	/*
> -	 * The PCB adds ~2ns of trace delay on both TXC and RXC, so the
> -	 * required RGMII clock skew is provided by the board itself.
> -	 * Neither the MAC nor the PHY should add any internal delay,
> -	 * hence "rgmii" (not "rgmii-id") is correct here.
> +	 * The PCB adds ~2ns of trace delay on both TXC and RXC, but that
> +	 * alone is not sufficient for reliable RGMII operation: with
> +	 * "rgmii" and zero MAC delays the link shows ~90% packet loss.
> +	 * The PHY's internal TX/RX delay is required, so use "rgmii-id"
> +	 * and keep the MAC's default delays.
>  	 */
> -	phy-mode =3D "rgmii";
> +	phy-mode =3D "rgmii-id";

[Severity: Low]
Is this comment (and the commit message) accurate about how dwmac-rk
configures MAC delays in "rgmii" versus "rgmii-id" mode?

When tx_delay and rx_delay are omitted from the DT node, rk_gmac_setup()
initializes bsp_priv->tx_delay =3D 0x30 and bsp_priv->rx_delay =3D 0x10.
In rk_gmac_powerup(), "rgmii" programs those 0x30/0x10 fallback delays
into the MAC, whereas "rgmii-id" ignores them and forces the MAC delays to
(0, 0):

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_powerup() {
    ...
	case PHY_INTERFACE_MODE_RGMII:
		dev_info(dev, "init for RGMII\n");
		if (bsp_priv->ops->set_to_rgmii)
			bsp_priv->ops->set_to_rgmii(bsp_priv,
						    bsp_priv->tx_delay,
						    bsp_priv->rx_delay);
		break;
	case PHY_INTERFACE_MODE_RGMII_ID:
		dev_info(dev, "init for RGMII_ID\n");
		if (bsp_priv->ops->set_to_rgmii)
			bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
		break;
    ...
}

Switching to "rgmii-id" zeroes the MAC delays while enabling the PHY's
internal TX/RX delays, rather than keeping the MAC's default delays.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109191515.2524=
49-1-cyan2254650260@gmail.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453739;
	b=Wo9rRZ7Nms5+hHwOiiuF1s1si3fwpJp+8MlslpmYfbT+1smqyGjGRAABt5+1oyGmJ4hQ
	 f4sVX42z2BeEkAjUa/5CdfAxUWMR1t9RCDz1XICkuO0MmMdn6UdnVF3FKCsgM3lWIF6xt
	 HGWefylCAqzt+s9EpSk3l3okw1pskwF3897qqNARwJ6ilcDWqo9TeLemGjEbC8PgGRX8D
	 e6l/3NEhgbF82W9tZKo7UoW+UqoCdZP8OQwxx8Gbi4RHC9UVX+zci4UQUwjHNRB4tQ9fv
	 Wz5ClLX+aq3BFJk+MKrtq+NAKFt5zE3bbaaKIRpr55UWVkGtNqDSFontDmtSiHZvDyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453739;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8zVNvSWaZtmK/qyn+5vvSO75ij5A9eblqUujvV++/s4=;
	b=x0dAbXdgY1GuhCj3jKFdgFYSi/SN8mFipmKSrIfhBmU4wRUkb/erxcqmmA883j9y3jk9
	 RHYQ3LcfmU7z5QgQ/nCENiTZ6H6OvhLKl43n9B/U6UX9lpiP4A05QukfsVw2akFJTIlom
	 XViBsPM/K9GFP/YcWQmDeFF5NaRCD69D3TYfl3lQrPVVxBDgzOD10PtQSL60O8wq8b5Lx
	 BOts5MabRsn7rddwvHyzaFa1MmNnmVNaEe9yGNk/TQ2yg72ptbpOHYchtQcvXRBYCJ4wG
	 en9bpRjgZeksv/XfP8qcrqzMex2y7orIBvZPgDuvxFg3Cso5/HXoMSYlDRSHp6slN9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Uh7g/8T7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A76E606A699
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uh7g/8T7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BF01F000E1;
	Mon, 23 Nov 2026 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795453738;
	bh=8zVNvSWaZtmK/qyn+5vvSO75ij5A9eblqUujvV++/s4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uh7g/8T7WLq4p+K0qtdpr1TEXL+y1ZVIcIyj7yJXNzltEaDCOaM0XRl2uCscPB5p+
	 WBwWmoh+9SToZBkoTWXUiUMxG3ieesFUC4poIV0pxz8Bn6UAFrHuv1bgj53NeEffiI
	 ZcD6+GBvXJCumnLPcYSdLugldAV/qn64bxE7//38PUgk1FrgR3iEc7F2yFka1wIkOi
	 zffjfBMT7DaGPg0Iu7uxqmZJruUhOmaqGT8gi+Oo7GfgN/Ft4w3eThbvQnV20VL2Lx
	 HYUaHLpombdXIMpWMRMYUnsFrWp5GZIo5jVP5Pwgvrr2NOWvocU5IkfRc9wfDHMTJ7
	 85lmKLTt/qfvA==
Message-ID: <sashiko-outbox-229706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123165703.667564-4-coiaprant@gmail.com>
References: <20261123165703.667564-1-coiaprant@gmail.com>
 <20261123165703.667564-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:08:57 +0000
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
- [Medium] arm64: dts: rockchip: undocumented rockchip,sgmii-mac-sel in
  combphy2
--

commit 770288b759f8f8b66f29b229b4d9964668ae4042
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

This commit enables the SGMII LAN port on the Ariaboard Photonicat by
configuring GMAC0, XPCS, combphy2, and the Motorcomm YT8521SC PHY on
MDIO0.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-photonicat.dts
> index 12ae9159bea87..f3cac046565bc 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts

[ ... ]

> @@ -242,6 +249,7 @@ &combphy1 {
>  };
> =20
>  &combphy2 {
> +	rockchip,sgmii-mac-sel =3D <0>;
>  	status =3D "okay";
>  };

[Severity: Medium]
Is rockchip,sgmii-mac-sel a valid property for combphy2?

Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
does not define rockchip,sgmii-mac-sel and specifies additionalProperties:
false, so this fails dtbs_check.  No mainline driver parses this property
either (rk_pcs_init() in drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
selects the XPCS MII port from the GMAC controller ID), so the property
and the commit message note about routing combphy2 through it should be
dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123165703.6675=
64-1-coiaprant@gmail.com?part=3D3

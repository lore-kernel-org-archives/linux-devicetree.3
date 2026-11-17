Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940507;
	b=t7gLOUse0enhgAuaFU6ai3nQbuiiakmbQzkkiG4qvYVsAykHZktgr4E8HgT+jvTVAij9
	 AeWapqovBl+3Me29R566WMMhnLrE9dSeA1aiGodNIVA2XHq18GTelEYgaGkEffEZyuONy
	 mMT1vvEnEnKe/Phkyv+KPCCgDvTQk+gdCldHgXClqyl8lws41scxSQZVVvPaLYb9xqvYK
	 c3XXAdvaUdXLyMNq0VDy5H37XjM+h/JN5eDfl5AvyqjBcCRFyRS2pNJjQe/0R3FbOVnpS
	 OVaJBeoQSGchHpic4vjeIrf9+aLkwTofNR+Xo341P0LDEjj5t8l8PefgjD2hI0q2VSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2mZpgPyBR75HIN3PW2XPcBrn0RQ/RDg0h4ZsuxPLeqc=;
	b=ShFlvsuQiojo4CzoWSig1SSJU+tfpN1Ufu+pw5ySqJRKQvou2vK0R+P90q4eXHOv8OCN
	 Icmp5P0rB55saYV6/Se4a1uAhgSnjbxRHtLuMIj6F6IuLq69WEDiYPGO8TafvNDkXGFQi
	 KEQfsd15LnWESNeimA9+v9XAP2KDsjZS3H+6NUGKgL3DIknTg7cqNRlTQK0oQpv59S03n
	 JjFpYdZKspBmU3lPKogGjOLxlW2OuOMwKJyhNEENLsuMobQKcSH87RNAZBrD1Qy2USEMf
	 U+Oh1tViQa86Z977olfL3Z+/jv+rm/Lm6kj7kcewOmFAFBibrRYpth3u4bN4ho6ga8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HGjwc2gO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5A606A886
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HGjwc2gO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6D71F000C7;
	Tue, 17 Nov 2026 18:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940507;
	bh=2mZpgPyBR75HIN3PW2XPcBrn0RQ/RDg0h4ZsuxPLeqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HGjwc2gOJR9Yt7TqlWbxMCUK41UEa9Gd18um1KPMKDaHt28bJR8QswG3uGsBJJb6Z
	 DU/+JakjJcHRBAG3vFp56TUoTFSKpGccgCu6NOTJxtphvw64JWKfh7thQ39/+F2ziC
	 33glA3nmrIBtttGlRdsetQA4N43NyXAQzhyhA7R9wfd4sm2OGeUuHJ6kFI4hNub/ej
	 KAGAv3yqkOw1cCYR0auHFXObCZklI9FjWXqSEofwqZrA7Wpr7XQISdSSdtNNGPSAcB
	 8fR/GTOC999NleGnMwTtYfuRHbpFncPdG15RrtWWM2XYRioaonTFeCuPISJuctzRaw
	 erjTzPKZYmE6w==
Message-ID: <sashiko-outbox-219353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [net-next v5 4/7] net: dsa: mediatek: support PLL setup on MMIO
 MT7530
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116183332.168858-5-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
 <20261116183332.168858-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:35:06 +0000
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
- [Medium] net: dsa: mt7530: missing child_bus mdio_lock in core_write()
  and core_rmw()
--

commit 6d735d3a6c864581e5a423bea72209587b069abd
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support PLL setup on MMIO MT7530

This commit saves the switch's child MDIO bus in priv->child_bus and falls
back to it in core_write() and core_rmw() when priv->bus is NULL so MMIO
MT7530 switches can configure core PLL registers via MDIO.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 09b7e9d2d0253..53ac692d5ba93 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -77,6 +77,12 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  	struct mii_bus *bus =3D priv->bus;
>  	int ret;
> =20
> +	if (!bus)
> +		bus =3D priv->child_bus;
> +
> +	if (WARN_ON_ONCE(!bus))
> +		return;
> +
>  	mt7530_mutex_lock(priv);
> =20
>  	/* Write the desired MMD Devad */
> @@ -112,6 +118,12 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask=
, u32 set)
>  	u32 val;
>  	int ret;
> =20
> +	if (!bus)
> +		bus =3D priv->child_bus;
> +
> +	if (WARN_ON_ONCE(!bus))
> +		return;
> +
>  	mt7530_mutex_lock(priv);
> =20
>  	/* Write the desired MMD Devad */

[Severity: Medium]
Does falling back to priv->child_bus in core_write() and core_rmw() leave
the multi-step Clause 22 MMD sequence unlocked when priv->bus is NULL?

mt7530_mutex_lock() and mt7530_mutex_unlock() only lock priv->bus->mdio_loc=
k:

drivers/net/dsa/mt7530.c:mt7530_mutex_lock() {
	if (priv->bus)
		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
}

When priv->bus is NULL on an MMIO MT7530 switch, mt7530_mutex_lock() is a
no-op, and core_write() and core_rmw() invoke raw bus->write() and
bus->read() callbacks across four or five MII_MMD_CTRL and MII_MMD_DATA
transfers without holding priv->child_bus->mdio_lock.  Although each
individual Clause 22 transfer takes priv->reg_mutex inside
mt7531_ind_c22_phy_read() and mt7531_ind_c22_phy_write(), priv->reg_mutex is
dropped between transfers, so phylib polling or other activity on
priv->child_bus can interleave between MII_MMD_CTRL and MII_MMD_DATA and
corrupt the MMD register access (for example during mt7530_mac_config() ->
mt7530_setup_port6()).

Locking bus->mdio_lock when falling back to priv->child_bus will not
deadlock because core_write() and core_rmw() call bus->write() and
bus->read() directly rather than mdiobus_write() or mdiobus_read(), and the
underlying MMIO callbacks only acquire priv->reg_mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116183332.1688=
58-1-cjd@cjdns.fr?part=3D4

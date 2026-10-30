Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388142;
	b=dt9z4KupsmgxhdtF6/1Og0cdGdWaNOis3w9UQvmVusYdbaMkaCcre+fFePKNkL4ubamf
	 ZBmpX8+fyeOTL5+7TR+DwkMdZ2cboC2D8BUrwtbbEY0YPGXNY0cKxJ58atxC24fxaLjkk
	 +q+nwp7qUUm4Bl1HSp4jYGkKtSbfXFaBzcvEnolswemXfuDX2xKIp65gnWN2gIIySn6PX
	 ZfGB0HMXUgR/le8eJlvn+Lm8KxUSE6xOiLyhsRAIQaDDrxVS0RoroDjQu8q4Fm15VpIJY
	 AewgQztC3HYZ29T5IH2CZwf8b1Snk1THhhNw1X8jcR9j0wuQPRoQwp6e30wa61h0FCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388142;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BLwwUBufJ5P0guQXL1KZ3BHfSpWr688+Kq+8Z1rSvVk=;
	b=T5Z9Z9blyvM4uZZSFHBfLV+BluZ+NEDeScdNIsRG8BVSMrV0CyHlh3TOIbFqHj1SOGTf
	 DScSxEtterFJCC9lCYt4y6W+LL4zdX2dmVgDhgdzrIitULKPYJr0I61KU/ctrEQE19EOq
	 M8U3c3oC7AELz6ryUhkWX03RRz6JpvD3xEd7QO72+RHh9Zk1Voa3nJCj3Em39ulgqAJgT
	 l4v52SwbQLJP36nMTMI+8dYlhgv372UHip0973sRHL6EhK+WDCBWPOo/nUr3keJDHNKS0
	 F8xIHe7Wnq9+XRtu318XinTRakV6aTE491uTRtAsLJr5MkhsEfdTeFU47bGZNUGTHLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJhq36R5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD2606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJhq36R5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450E11F00A15;
	Fri, 30 Oct 2026 19:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793388141;
	bh=BLwwUBufJ5P0guQXL1KZ3BHfSpWr688+Kq+8Z1rSvVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aJhq36R5sir9pryi5iQuZEXvR7pmC2NdsmJbsrIWxg+o3kEQM0ROWwLii0crHD4M/
	 akgzUY343LImu9v77xRADHE41DJWiUfUu0nXepfBI95guKFu0c768qeLNLUgjDdK8r
	 qf9KGs7KzN9tRXYjfE9iaU4/Dnfn/CsGHM7mRebhU1gevabFXkudgSp9O5Zb8CoLZQ
	 tASr+6KIGkQjF8Nxj9F3Umh+R77czdf1bFGJK6Yj5Kbp2ELbuiWchCZlAVE6YG/1eS
	 yisEht3HwJcbakC8rPQbNdyvzETqOSuEYtSd/ky+/8tRYqL9mn5FtdatAMn3aRVANi
	 VcVDyAN9VBKog==
Message-ID: <sashiko-outbox-191439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] net: dsa: mediatek: support PLL setup on MMIO
 MT7530
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029184202.1859843-5-cjd@cjdns.fr>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 19:22:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: dsa: mt7530: missing child_bus mdio_lock in core_write() an=
d core_rmw()
--

commit 3f6621fc167b9cbb00feef9399db3022a584cb8e
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support PLL setup on MMIO MT7530

This commit records the switch's internal MDIO bus in priv->child_bus during
mt7530_setup_mdio() and updates core_write() and core_rmw() to fall back to
priv->child_bus when priv->bus is NULL so MMIO MT7530 instances can perform
PLL and core register configuration via the internal PHY MDIO bus.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index c5b3b00acb956..d45388e2efc83 100644
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
When priv->bus is NULL and core_write() or core_rmw() falls back to
priv->child_bus, does mt7530_mutex_lock() leave bus->mdio_lock unlocked?

Looking at mt7530_mutex_lock() and mt7530_mutex_unlock() in
drivers/net/dsa/mt7530.c:

static void
mt7530_mutex_lock(struct mt7530_priv *priv)
{
	if (priv->bus)
		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
}

static void
mt7530_mutex_unlock(struct mt7530_priv *priv)
{
	if (priv->bus)
		mutex_unlock(&priv->bus->mdio_lock);
}

On MMIO switches where priv->bus is NULL, mt7530_mutex_lock() becomes a
no-op. However, core_write() and core_rmw() perform multi-step Clause 22
MMD indirect sequences across MII_MMD_CTRL and MII_MMD_DATA using raw
bus->write() and bus->read() calls.

Even though the underlying indirect PHY accessors acquire priv->reg_mutex f=
or
each individual Clause 22 register transfer, priv->reg_mutex is released
between each step of the MII_MMD_CTRL and MII_MMD_DATA sequence. Once
mt7530_setup_mdio() registers priv->child_bus, runtime callers such as
mt753x_phylink_mac_config() -> mt7530_mac_config() -> mt7530_setup_port6()
call core_clear(), core_write(), and core_set() (which use core_rmw() and
core_write()). Could concurrent phylib or MDIO accesses on priv->child_bus
(which serialize on priv->child_bus->mdio_lock) interleave between those
steps and corrupt the MMD register accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029184202.1859=
843-1-cjd@cjdns.fr?part=3D4

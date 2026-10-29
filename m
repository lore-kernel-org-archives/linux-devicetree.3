Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236459;
	b=pevKbS0AVJdQDaaKa2EW4QTOxuGV6gXz10inqFB8tfhXANVOytt/Cv+KQA/LT0ekCjBK
	 I8zgDG7Z4mSYjNMnWlR0dey2hxP+EEajudO8xCUIF14MNEA+fjPjzCzow8BDGI69Wndnx
	 f/AjkTPOmcdDz4RIfssCNeQH/l98thmYKEksQnBN279Qlv2Ub+PI1OWhithvAcAjPr595
	 bPf8NMPcLxMBOlk4/RPmgUmsLTYKvaIs/EByRE2W7t2sY7LVF8G2F61GQxCFC/SW7c8gW
	 IBxJA9x8SHnu2va7iIItScgRGVlbjjyciALtd/6qJIn9FXb4H/FYYqE6ZUqLKL/Qemw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236459;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x9H3CMlHQkJybGS0RfYl+CDrMXMs4xDoDiS2cD3GHNs=;
	b=XAWNIajEnyM1qZXyhwpjJ63K+R0a8zIMT0yyj6Ebwld5aVTfhHdTopTCEqC8nt3m5vpS
	 kKqcY9oWFDhYxcbYdYyaNyfIVDjJ+ND57RWFvHHx9oEeQIDGj+J+QryuYlI+X4+Cg3oAA
	 Xj3W+zKQiOEViymDXVRBxMabW8hgnHja0+QXHRSRLJMxbKVj7OWdxRllRImvnhvyB3GLe
	 +dVXPt/xvkCCK2bICZmhtV9UGQqszQaAsP6bn4eLa8p0UZQl2j/Xeq8CgwR2dbedyaNjy
	 ytutP7BpLYtj4MYnmx3eQEC2wu6xGQGcDXVGAW2T77mg+8lv/MUVkeiML5vhu5CgDlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B45gL7RC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85272606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B45gL7RC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7EF1F01828;
	Thu, 29 Oct 2026 01:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793236459;
	bh=x9H3CMlHQkJybGS0RfYl+CDrMXMs4xDoDiS2cD3GHNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B45gL7RC8YgnLtxRKG/KfZvh5VR7EOS7Nng2J9ro/xBg8/25NSURnsg98HRflzBoZ
	 flIVfWfiBB/9VybXbatWZbNqb+SUv8Rs2l9z0yG3ezVPU/qqyXZCcqrzSN8N766dq3
	 sVFFFT3n5u4XGNbchamQ3G0s93QLxSDI1WFoUMRPAtFQtXdd9NRs8uNCTz7BU7JMXh
	 ZTn/DgkeaZcM7miI7nHeUz1FRQ4PT8d4JQDJFVIrqQV9STTyZ+xuH0/G7edZWUOkPj
	 RoJmlXHoJvDv6R3vRz93KyorTrVHHW28Eu3HnNBXzG2cltt9x8HDDm/PsZK93ASPZ4
	 8LLlYFsoHHzaQ==
Message-ID: <sashiko-outbox-188586@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] net: dsa: mediatek: support PLL setup on MMIO
 MT7530
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028011317.1557238-5-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 01:14:18 +0000
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

commit 282f0d4460f738148996f33bfc68b0cd30432c06
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support PLL setup on MMIO MT7530

This commit stores the switch's internal MDIO bus in priv->child_bus during
mt7530_setup_mdio() and updates core_write() and core_rmw() to fall back to
priv->child_bus when priv->bus is NULL so that MMIO MT7530 switches can
configure core PLL registers via PHY MMD accesses.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3eb2e11d69856..d09ff207e2dfc 100644
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
When priv->bus is NULL on an MMIO MT7530 switch and core_write() or
core_rmw() falls back to priv->child_bus, does mt7530_mutex_lock() leave
bus->mdio_lock unlocked across the multi-step MMD sequence?

In drivers/net/dsa/mt7530.c, mt7530_mutex_lock() and mt7530_mutex_unlock()
only check priv->bus:

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

Both core_write() and core_rmw() perform a multi-transfer Clause 22 MMD
sequence (writing MII_MMD_CTRL, MII_MMD_DATA, MII_MMD_CTRL with
MII_MMD_CTRL_NOINCR, and reading or writing MII_MMD_DATA) by invoking
bus->write() and bus->read() directly.

Although each individual C22 transfer on priv->child_bus acquires and
releases priv->reg_mutex inside mt7531_ind_c22_phy_read() and
mt7531_ind_c22_phy_write(), priv->child_bus->mdio_lock is never held across
the whole MMD sequence when priv->bus is NULL. When core_write() or
core_rmw() is called at runtime (for example via
mt753x_phylink_mac_config() -> mt7530_mac_config() -> mt7530_setup_port6()
after mt7530_setup_mdio() has registered priv->child_bus), can concurrent
PHY polling or MDIO operations on priv->child_bus interleave between the
MII_MMD_CTRL and MII_MMD_DATA transfers or race with the read-modify-write
in core_rmw()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028011317.1557=
238-1-cjd@cjdns.fr?part=3D4

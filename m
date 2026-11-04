Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808642;
	b=eonx4p2Ow/nir8L/Trb9S5VJbrdj7M32QCOsAkEHHo8lWGHjpi3mBR0drHGHQICIn4jr
	 Z5q1IE64fGKdKX0hc0j6pJ1kqWU2+KE62h7hQRRpH5941uX1qda0AbS8ZLL201jf6qwJb
	 a2xYviszVCvPbnXA4WhWSR5jMYwQc/OM1yXm82ohG5oqt/Q5CqSWDaxBkaYoS884ufxaC
	 KNkM3A/l/zviCyfkua53lWrnweXaaspUJikoNgwyu/HRwwIQhZ1CKRq+4J8UA+f+piXRL
	 H2m7FRVJcN690cCT4JLfbwkWs2bu/pKXKt34nLj30my03jEFEOJO9JooMp1qyeEPIpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808642;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Yy6wGnSydKjKPjrOgz5BaJYWTwgr4+9MeU7pUAvTs7M=;
	b=ye2UyM5N/0YPBmxcbcRuXrrSKOaWnZkAaAm/M/Qdd9eEGW6oiGToreB7s0jsXmObf0KT
	 Z2CyAOR7uWezADaK+GDuLUMiKBrKdDJbhSBZ8IUs6AQ581Jn/J7yMKduApv+KH8Z1JEFq
	 0EyFBw1uwGvJyyhfeHfBBIf/p9Mmb5PGBr70VI6j8AtyctAW4zy3pta4Krw6GP7fumiyR
	 BIWqZH4HSqC08ijnFFrFBIGJoOQ0B1yglD23DWMrgF+lnpC71iKsCTqJuXpD1biLvriXi
	 bN+6LDqqX8VFk80zirdVyCWRJcCE6bpYMebwkiLmOUVoIe6qoW1/jiGsjRJ/UsRs0Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naNrgEj7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC0606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naNrgEj7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9ABF1F000C1;
	Wed,  4 Nov 2026 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808642;
	bh=Yy6wGnSydKjKPjrOgz5BaJYWTwgr4+9MeU7pUAvTs7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=naNrgEj7akxnjtDZ1mXMv4TXg68nCA4oioPERPl7A0h0wYaiDbS0EgTKTJFPqXxKZ
	 smLCImaQT5B1MI1gAzAAnFDQIZxnaYo4dZP/8YFheHXmd+OVPDDoOvws0gqQXp9ar+
	 gGVKAHlNup3YH9I6n3dLRwInu7kTtrEPD8kxdF41xJgGClFEz5ip0gkPtRl/VIItl8
	 jQMVMmSYJLDXD+F1hLsZiEbHijolu5pzr8+ARKXy6M9XW7LZ3fm9kaEJIXbbm27Grb
	 O0Uudj2LByeUUPcdfEZ+M5R7Jh7epr6u39CV8xGdWg1yAEPrutxwoqkXWWcB4jWQJY
	 UgVjT7ohEqKIA==
Message-ID: <sashiko-outbox-197578@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/5] net: ethernet: adi: adin1110: Add OA TC6
 protocol support for ADIN1110
Reply-To: sashiko-reviews@lists.linux.dev
To: "Iustin Stolniceanu" <iustin.stolniceanu@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103160918.409701-5-iustin.stolniceanu@analog.com>
References: <20261103160918.409701-1-iustin.stolniceanu@analog.com>
 <20261103160918.409701-5-iustin.stolniceanu@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:10:41 +0000
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
- [Medium] net: adin1110: broken uc and mc filtering in adin1110_set_rx_mod=
e_tc6()
--

commit fee140bec5b369ab45ae064be0620e5878578e1e
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: adi: adin1110: Add OA TC6 protocol support for ADIN1110

This commit adds OPEN Alliance TC6 SPI protocol support for the ADIN1110
MAC-PHY using the oa_tc6 framework when the adi,spi-oa-tc6 property is
present. It introduces OA TC6 register accessors, net_device_ops callbacks,
and probe handling while sharing the existing MAC configuration logic.

> diff --git a/drivers/net/ethernet/adi/adin1110.c b/drivers/net/ethernet/a=
di/adin1110.c
> index 53fac3dc8be62..d08b165bf7c48 100644
> --- a/drivers/net/ethernet/adi/adin1110.c
> +++ b/drivers/net/ethernet/adi/adin1110.c

[ ... ]

> @@ -881,6 +920,22 @@ static void adin1110_set_rx_mode(struct net_device *=
dev)
>  	spin_unlock(&priv->state_lock);
>  }
> =20
> +static int adin1110_set_rx_mode_tc6(struct net_device *dev,
> +				    struct netdev_hw_addr_list *uc,
> +				    struct netdev_hw_addr_list *mc)
> +{
> +	struct adin1110_port_priv *port_priv =3D netdev_priv(dev);
> +	struct adin1110_priv *priv =3D port_priv->priv;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +	port_priv->flags =3D dev->flags;
> +	ret =3D adin1110_setup_rx_mode(port_priv);
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}

[ ... ]

> @@ -1123,6 +1233,69 @@ static int adin1110_check_spi(struct adin1110_priv=
 *priv)
>  	return 0;
>  }
> =20
> +static void adin1110_oa_tc6_remove(void *data)
> +{
> +	oa_tc6_exit(data);
> +}
> +
> +static int adin1110_oa_tc6_probe(struct adin1110_priv *priv)
> +{

[ ... ]

> +	netdev->if_port =3D IF_PORT_10BASET;
> +	netdev->netdev_ops =3D &adin1110_tc6_netdev_ops;
> +	netdev->ethtool_ops =3D &adin1110_ethtool_ops;
> +	netdev->priv_flags |=3D IFF_UNICAST_FLT;
> +	netdev->netns_immutable =3D true;
> +
> +	return devm_register_netdev(dev, netdev);
> +}

[Severity: Medium]
In adin1110_oa_tc6_probe(), netdev->priv_flags sets IFF_UNICAST_FLT, which
tells netif_rx_mode_run() -> netif_uc_promisc_update() not to fall back to
IFF_PROMISC when secondary unicast addresses are added to dev->uc.

However, adin1110_set_rx_mode_tc6() ignores both the uc and mc address list
snapshots and only calls adin1110_setup_rx_mode():

drivers/net/ethernet/adi/adin1110.c:adin1110_setup_rx_mode() {
	ret =3D adin1110_set_promisc_mode(port_priv,
					!!(port_priv->flags & IFF_PROMISC));
	if (ret < 0)
		return ret;

	ret =3D adin1110_multicast_filter(port_priv, ADIN_MAC_MULTICAST_ADDR_SLOT,
					!!(port_priv->flags & IFF_ALLMULTI));
    ...
}

Because neither dev->uc nor dev->mc is programmed into the hardware MAC
filter slots, and ADIN_MAC_MULTICAST_ADDR_SLOT is only enabled when
IFF_ALLMULTI is set, won't frames destined to secondary unicast addresses
or joined multicast groups (such as IPv6 Neighbor Discovery solicited-node
multicast when IFF_ALLMULTI is not set) be silently dropped in OA TC6 mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103160918.4097=
01-1-iustin.stolniceanu@analog.com?part=3D4

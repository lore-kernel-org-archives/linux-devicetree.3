Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336035;
	b=fg06wFlrfwfg2oAVevwn0iT8HMAe2igf0VGkTVA/9GUauGHOMV8CllYGwqfZV/ikToDD
	 hlqM66uJIPNQWkgxu7ds9XaOwndkEFikh7wGu+QJMxE6w11dfLJ0Zd6RcTWhlYSt0IXnZ
	 CgdBZWwm7nmqtF9TDCH4AnTJ40PZafZlYZTgMbuVc8lTNhoMgQOKjgmhJxATtlqTMZZna
	 5jXCbv9q82yaERkMazUYJV/yKxgMXddTiYmlWwOA53g0uxGh8H5jZZWHEDK6J0U7bIHrm
	 GU5zgofSvUnCi9NFcFJAgCr1KsDTGgcrSxM8ooOsvclg0/2YBBh0ARwlOLe1hb+8bAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336035;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sqTs9V0LF5HQ57Q/fSahI3JluYzdjSbMyb34SwOo6AE=;
	b=CAjOQvuYVSuGBLjW6hLBaBofHi0/+vEBynVzIrfFRHVpDjCPTWzAFgF3jnKVO0TOaMqW
	 yWzMtXDPtjY6WCQGjEj3uZar+1E20GlHtD7CqIJDCIpZEDcKvkeW/9T8qIH6t9ZedOL1v
	 /oEo4HbuYCCsWr+Cj5zNrtCkNsip7E1hcNlllLVg6g2DfAz+irC/n1763LfAuc+xik3zW
	 k2wDc263x2aeNq61GljSJBNePUq3qfRvj3/bjQz4Uju1OgFb5X+7qYYupe1XQ4PrGPa9I
	 R+fCO6M5Bcc017ZoOqS2TQmIQRLzbAq7/DGzUAHGJ58XLDgWMouB5oNge8Mzl+dR9Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUES04oV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22116606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUES04oV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D951F000C1;
	Fri, 30 Oct 2026 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336035;
	bh=sqTs9V0LF5HQ57Q/fSahI3JluYzdjSbMyb34SwOo6AE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JUES04oV2UzvHh4mQOPKZhlAev/oDbeT/snX0EuJ+XHWu1RHlwIM7ESdpC6xwFBDx
	 kYapwlNlXhE7aETrbE9l60omHWZCM+nU9H3pyqonP8OVMnK5/qvtVw5/VR9CTh7bDH
	 v/EPvYj/585Vx9oMWmbkNFH9Ov6AE/e0+m2B+otDb/3YSxKcEja7b+TGpycowYxSLt
	 ANHuH4aBSvDjPeiIl9GEs/Nih2+b/LE0r/CPuS6Fs/O2UKJLjxxGD+478tUYbV4aPK
	 /c1FzGSaoTd0pMwTM9tIPGtaM0M8MjznEFaa/MGZ5vOS3pKYKv3XT13KFJ0p0v4IBI
	 77tTP8KOEPuKg==
Message-ID: <sashiko-outbox-190368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 08/10] net: airoha: Do not stop GDM port if
 it is shared
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-8-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-8-af613b61ae02@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:53:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] `airoha_dev_change_mtu()` improperly prevents valid software MTU=
 configuration on shared ports.
- [Low] Redundant and conceptually misleading hardware teardown call in `ai=
roha_dev_stop()`.
- [Low] Unnecessary use of `atomic_t` for `port->users`.
--

commit bc4eeb17ed63b1b4cd86821788c9da9f77deb20a
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Do not stop GDM port if it is shared

This commit adds reference counting for GDM ports to prevent stopping a
shared port if it is still used by another active net_device. It also
prevents MTU reductions if the port is shared with an active interface.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 0253919714e0c..1c4927c1aeb07 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -1762,8 +1766,12 @@ static int airoha_dev_stop(struct net_device *netd=
ev)
>  	for (i =3D 0; i < netdev->num_tx_queues; i++)
>  		netdev_tx_reset_subqueue(netdev, i);
> =20
> -	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> -				    FE_PSE_PORT_DROP);
> +	if (atomic_dec_and_test(&port->users)) {
> +		airoha_set_vip_for_gdm_port(dev, false);

Is this call to airoha_set_vip_for_gdm_port() redundant?

Looking at airoha_dev_stop(), airoha_set_vip_for_gdm_port(dev, false) is
already called unconditionally earlier in the function. Since get_vip_port()
returns a device-specific bitmask based on dev->nbq, does the unconditional
call correctly clear the hardware bits for the specific device being stopped
without affecting other devices on the same shared port?

> +		airoha_set_gdm_port_fwd_cfg(qdma->eth,
> +					    REG_GDM_FWD_CFG(port->id),
> +					    FE_PSE_PORT_DROP);
> +	}
> =20
>  	if (atomic_dec_and_test(&qdma->users)) {

[ ... ]

> @@ -1915,10 +1923,22 @@ static void airoha_dev_get_stats64(struct net_dev=
ice *netdev,
>  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	u32 cur_len, len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_port *port =3D dev->port;
> -	u32 len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_eth *eth =3D dev->eth;
> =20
> +	cur_len =3D airoha_fe_get(eth, REG_GDM_LEN_CFG(port->id),
> +				GDM_LONG_LEN_MASK);
> +	if (len < cur_len) {
> +		u8 port_refcnt =3D atomic_read(&port->users);
> +
> +		/* We can decrease the device MTU just if the GDM port is
> +		 * not shared or if the other device is not running.
> +		 */
> +		if (port_refcnt > 1 || (port_refcnt && !netif_running(netdev)))
> +			return -EBUSY;

Does returning -EBUSY here improperly prevent valid software MTU
configurations?

Instead of failing the ndo_change_mtu callback and preventing the software
netdev->mtu from updating, should this code unconditionally allow the softw=
are
update (netdev->mtu =3D mtu) and simply skip the hardware register
(REG_GDM_LEN_CFG) downgrade to safely preserve the larger hardware limit
required by active shared siblings?

> +	}
> +
>  	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),

[ ... ]

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 207c75152fde0..3a313ac439e79 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h

[ ... ]

> @@ -553,6 +553,8 @@ struct airoha_gdm_port {
>  	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
>  	int id;
> =20
> +	atomic_t users;
> +

Is the use of an atomic_t necessary for tracking users here?

The port->users reference count appears to only be modified in ndo_open and
ndo_stop, and read in ndo_change_mtu. Since all of these callback paths are
inherently strictly serialized by the kernel's rtnl_lock(), could a simple
integer be used instead to avoid unnecessary atomic overhead?

>  	struct airoha_hw_stats stats;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507-airoha-eth=
-multi-serdes-v4-0-af613b61ae02@kernel.org?part=3D8

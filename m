Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F439C00D
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267575; cv=none; b=kCjl0rWPvDUPvKi1nuFIsUNDBQYv+3F0Ih2Aj0vV3FfWQBiEX2yKW/WJcvAHXfRZIjMWsSGzwCDN7eQlInL/W5U+FNDv/l3ac6mf+Yg3A8O3V7Ek21vXS8kuAwDEuxRimIIPvw8QiN7/yEM2CmBprJBsS66ySu5/nDqk6edK1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267575; c=relaxed/simple;
	bh=ALVPyjs2Yxz8nNxYKSL+tPFeEC9NZ92kfG1INWfibxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qpu8vohwmk3gnr/tlABFV16YTX/iYcw0tUU8SADqfmMP5tBVlzXuyGBF3Q7JE1vWzEQHGR4jK3se+suSSawNM8lwBYuVqFVQs6LlVpiiYap/pyuEoPSw/06t+s785+axWcAH4TmR8BNrSKNzLQf0I6f5tGypHfBGoXmjQ2RtgWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg4j4NDi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg4j4NDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9473C1F000E9;
	Wed, 20 May 2026 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779267572;
	bh=eMa8RVgH1cIOC4Z2AmJZWsVxO5KdtkjuQCWAMuNISkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pg4j4NDil6K9IxQ2POB8GgpSP7LH1txwKqKGaseA5nKo5Rf0zJxpgyHlL9z3ZF4OO
	 o+io71ENwaJFBc529dkCyZ59gM3qACu2ptmkD3lacf7rprbyQTvDc0KdoWnETEsFf/
	 td6+9jqP4+Bl3/LGHCtTbNDST1qS0qERMzEbQ0IOMi7x8rzIfig+rMySmG5ZMmUANw
	 4QYon3Sf++agYh+53Mbr3ZcEE7JkRYNLYHP5hQ/8R4fb/y/cGWnCAeJrTVUQ5y5HKI
	 r/lgg3YD/nEaLJurOUpg6zqtS/lk1nDGGqvuNSmfb2yb1/ezSErb+1gNGAXVRZPosz
	 spG/Xui+GYnhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 02/10] net: airoha: Introduce airoha_gdm_dev
 struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519-airoha-eth-multi-serdes-v8-2-6bd70e329df6@kernel.org>
References: <20260519-airoha-eth-multi-serdes-v8-2-6bd70e329df6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 08:59:32 +0000
Message-Id: <20260520085932.9473C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Potential deadlock in `airoha_update_hw_stats()` due to using `spi=
n_lock()` instead of `spin_lock_bh()`.
--

commit 6823c137925a562390270eb1ce7967caaa011b7b
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Introduce airoha_gdm_dev struct

This commit introduces the airoha_gdm_dev struct to collect net_device rela=
ted
info, accommodating future support for connecting multiple external SerDes =
to
GDM3 or GDM4 ports via a hardware arbiter.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 5a027cc7ffcb1..5335271ea8654 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -1877,10 +1888,11 @@ static int airoha_dev_init(struct net_device *dev)
>  	return 0;
>  }
> =20
> -static void airoha_dev_get_stats64(struct net_device *dev,
> +static void airoha_dev_get_stats64(struct net_device *netdev,
>  				   struct rtnl_link_stats64 *storage)
>  {
> -	struct airoha_gdm_port *port =3D netdev_priv(dev);
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct airoha_gdm_port *port =3D dev->port;
>  	unsigned int start;
> =20
>  	airoha_update_hw_stats(port);

This isn't a bug introduced by this patch, but could this lead to a deadloc=
k?

Because airoha_dev_get_stats64() is registered as the ndo_get_stats64 callb=
ack,
it can be called from both process context (e.g., via user-space netlink du=
mps)
and software interrupt context (BH) (e.g., via bonding or teaming drivers).

Looking at airoha_update_hw_stats(), it uses spin_lock() to protect the
hardware statistics update:

drivers/net/ethernet/airoha/airoha_eth.c:airoha_update_hw_stats() {
	...
	spin_lock(&port->stats.lock);
	u64_stats_update_begin(&port->stats.syncp);
	...
}

Because spin_lock() disables preemption but not softirqs, if a process cont=
ext
call is interrupted by a BH call on the same CPU, the BH handler will attem=
pt
to acquire the already-held lock.

Should this be upgraded to spin_lock_bh() to prevent a potential deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-airoha-eth=
-multi-serdes-v8-0-6bd70e329df6@kernel.org?part=3D2

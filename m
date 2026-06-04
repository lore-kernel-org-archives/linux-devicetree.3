Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3173D47B1
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552887; cv=none; b=gGCi0sJUMkQ7pEJhgvxf4XtU/wLqRmuKVHkkJnH8By8ET46KFJyt71Cu8JuSqLsuEC4DggGHpQ0DJrGJPuZvxVlalXVAoG+TTOtF+IFd88LZnXRYL6JOlRX4+pv+R0C5k1izXLbLCYGekC4gzN/iGF/tQo6qzHiP5e1vpXIRBcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552887; c=relaxed/simple;
	bh=NoN9zKwyYNW+0LrpAbiU31JZqrMspX2em6rmHNEeBYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Weq+fWlQ1RKWoBauCjkNLja6XCYnanbQ7QxFAuBpjXxiIMBYv0I5YOJB9dM+l+jjKdP6CBn3ypIghUiFH85SLqqKovTmb4Z90DoIpkogoOFHe6uvZthSc/ezhJvQGXMAa9uHqFGrW0FIssfsIXhEEFRAFMiPoUNL/wlohYj6CV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6eafnCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6eafnCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF2B1F00899;
	Thu,  4 Jun 2026 06:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780552886;
	bh=d8Y03SjKEoAfKd3vj8Xbe6RKzagARZFcuDJ1EMLbzfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h6eafnCEe2iNaiXdS/NhWIlCqir8tTC3IHlocPVR28KSWp5QN+r9x8pl1Ex5sLwAB
	 Y6BqrG0bWms8DN7UT3+8AH8Loy2x+D4veMzGAVXxA1j0gppB/UmlK4PjLmyf4dRSDV
	 EUI7OhGBL5wJUC6/vXjxwi7Uk6HBwfPymb+0p7HPHCL1I7WoXZ8TtTqPIibxHMCm9O
	 yYq0aAV8aROo3RSqYgqFky6YtlXyK2pyslm/KDZHLIY07s7zx+Lr9oFNqYwN3UxAtP
	 apUCMtNFHyHWdRQZJrCm+cxFv/LwRwUEBlbIXWws/1jnsndIriFPGVYo/R6T+OIrVy
	 d3MI5byQLMMbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 6/6] net: airoha: Support multiple LAN/WAN
 interfaces for hw MAC address configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603-airoha-eth-multi-serdes-v9-6-5d476bc2f426@kernel.org>
References: <20260603-airoha-eth-multi-serdes-v9-6-5d476bc2f426@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:01:25 +0000
Message-Id: <20260604060126.0DF2B1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The MAC address MSB validation introduces a configuration deadlock=
, permanently preventing MAC address MSB updates when multiple interfaces a=
re registered.
- [High] Unconditional overwrite of `ref_addr` in the interface evaluation =
loop breaks MSB validation and corrupts hardware L2 bounds.
--

commit ca5c4a90447cc1f9bdc3a2831da1cfe304652070
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configu=
ration

The EN7581 and AN7583 SoCs provide registers to configure hardware LAN/WAN
MAC addresses. This commit extends the logic to derive the correct minimum
and maximum values for MAC LSB bounds when multiple interfaces are configur=
ed.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 64ee526da2414..8f2608293bb72 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -71,20 +71,76 @@ static void airoha_qdma_irq_disable(struct airoha_irq=
_bank *irq_bank,
[ ... ]
> -static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *add=
r)
> +static int airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
>  {
> +	u8 ref_addr[ETH_ALEN] __aligned(2);
>  	struct airoha_eth *eth =3D dev->eth;
> -	u32 val, reg;
> +	u32 reg, val, lmin, lmax;
> +	int i;
> +
> +	eth_zero_addr(ref_addr);
> +	lmin =3D (addr[3] << 16) | (addr[4] << 8) | addr[5];
> +	lmax =3D lmin;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> +		struct airoha_gdm_port *port =3D eth->ports[i];
> +		int j;
> +
> +		if (!port)
> +			continue;
> +
> +		for (j =3D 0; j < ARRAY_SIZE(port->devs); j++) {
> +			struct airoha_gdm_dev *iter_dev;
> +			struct net_device *netdev;
[ ... ]
> +			if (netdev->reg_state !=3D NETREG_REGISTERED)
> +				continue;
> +
> +			ether_addr_copy(ref_addr, netdev->dev_addr);
> +			val =3D (netdev->dev_addr[3] << 16) |
> +			      (netdev->dev_addr[4] << 8) | netdev->dev_addr[5];
> +			if (val < lmin)
> +				lmin =3D val;
> +			if (val > lmax)
> +				lmax =3D val;
> +		}
> +	}

[Severity: High]
Does this loop unconditionally overwrite ref_addr with the last evaluated
interface? If there are multiple interfaces with mismatched MSBs (e.g., from
random boot MACs), it seems ref_addr will only retain the MSB of the final
interface.

Could this cause the validation check below to incorrectly pass if the new
MAC matches the last interface's MSB but not the earlier ones, while
erroneously accumulating LSBs from mismatched interfaces into lmin and
lmax?

> +
> +	if (!is_zero_ether_addr(ref_addr) && memcmp(ref_addr, addr, 3)) {

[Severity: High]
Can this validation check create a configuration deadlock?

Since the driver requires all LAN or WAN interfaces to share the same
MAC address 3-byte MSB, and userspace APIs configure interfaces sequentially
via ndo_set_mac_address, changing the first interface's MSB will always fail
this check against the remaining interfaces.

How can a user successfully configure a unified custom MAC MSB across all
devices if the interfaces are assigned random MAC addresses at boot with
different MSBs?

> +		/* According to the HW design, hw mac address MSBs must be
> +		 * the same for each net_device with the same LAN/WAN
> +		 * configuration.
> +		 */
> +		struct net_device *netdev =3D netdev_from_priv(dev);
> +
> +		dev_warn(eth->dev,
> +			 "%s: wrong mac addr, MSBs must be %02x:%02x:%02x\n",
> +			 netdev->name, ref_addr[0], ref_addr[1],
> +			 ref_addr[2]);
> +		dev_warn(eth->dev, "FE hw forwarding won't work properly\n");
> +
> +		return -EINVAL;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-airoha-eth=
-multi-serdes-v9-0-5d476bc2f426@kernel.org?part=3D6

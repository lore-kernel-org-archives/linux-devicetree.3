Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2A39936D
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267578; cv=none; b=V69rbULcakLcbdzmnJ8X4Rav/Aj/zUgHi8QIuE9md89pMlXbTw+EDNXmURAcWxAXPejcrANZKE1bgCRhM+gwGWIRrL5rGcvS3ApQq14f9k3OU7lHwFMQYn2gExLI8eqnULaRv6Vcu7PRgznqtFhWjN6bT+dzAWwC35baJaCYiFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267578; c=relaxed/simple;
	bh=+nPcXjlBlTNZ1cMJn5lBBjO4r+YR2WFPLhtiqj/mdCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ptEOJQNrYzxFOC3DT4gORNHPSrxpnsdDHTkwT2EP3pKq3Itmevn9scemA1p5F2xj3PFfX2FRGvV4xi6OJ1NmM26TDSKTkBZJ9lpEwpAUn4bWylYwfdQnJOQoaB4FEQ1X9Jvnr0gqSwn1+l4PIzdE8qb2EdLeAeB9tULQ+XuBeps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4yLl4Nz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4yLl4Nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AD01F00894;
	Wed, 20 May 2026 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779267574;
	bh=c9mUz6Wzc4TmVTbWUCoHf/46Afj22BnVcMNvi7HIHz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4yLl4NzrsZynng+Z2GvrY1BUgr+t+Th372XTwYEqFPQwy+f7TCPw7PGfsJHwhRxs
	 sk3GkgXW2qhr9VWH3CNgK2fRZ5QbqKrb6CcEZEjJDQMnhgis7HQMYVUirt5iMP2LK0
	 s4NIo9YigJzDlSviDIaQczN3GyBc0i4nw497KSNIImBY9PBOg5V9I7udTnAGdHTWhM
	 S2d3PFyvwZGhaDBreN9fO8iNXhy8jM6nNqJNJNtfCd+5UdLxHJCeJK0+XUA1ChE7SB
	 ccRC1q5SubzbxzloAZZsxF67iIcy9eVT5BWpRjIIrhskwJnxoYUVewQpCmoc2M/qF+
	 Ki/DEP5ltnzAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 10/10] net: airoha: Support multiple LAN/WAN
 interfaces for hw MAC address configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-airoha-eth-multi-serdes-v8-10-6bd70e329df6@kernel.org>
References: <20260519-airoha-eth-multi-serdes-v8-10-6bd70e329df6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 08:59:34 +0000
Message-Id: <20260520085934.54AD01F00894@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Driver probe fails on systems where MAC addresses are randomly gen=
erated.
- [High] Configuration deadlock prevents users from changing the MAC addres=
s OUI.
--

commit dbc4f298ffd475d67c32eeea98f201059b73194a
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configu=
ration

The EN7581 and AN7583 SoCs provide registers to configure hardware LAN/WAN
MAC addresses. The hardware design assumes all interfaces configured as LAN
(or WAN) share a common upper MAC address. This patch extends the logic to
derive the correct minimum and maximum values when two or more interfaces
are configured.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 328f94fef2e28..9ae1ba4333097 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -71,20 +71,69 @@ static void airoha_qdma_irq_disable(struct airoha_irq=
_bank *irq_bank,
>  	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
>  }
> =20
> -static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *add=
r)
> +static int airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
>  {

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
> +
> +	if (!is_zero_ether_addr(ref_addr) && memcmp(ref_addr, addr, 3)) {

Does this strict OUI validation cause the driver probe to fail when MAC add=
resses
are randomly generated?

If a MAC address is not provided in the device tree, the driver generates a=
 random
one via eth_hw_addr_random(). For multi-port configurations, each port rece=
ives an
independently generated random MAC address.

Since the upper 3 bytes of these random addresses will almost certainly dif=
fer,
when register_netdev() is called for the second port, its ndo_init callback
(airoha_dev_init) will invoke airoha_set_macaddr() and hit this check. Retu=
rning
-EINVAL will fail register_netdev() and abort the entire driver probe, leav=
ing
the system without networking.

Does this also prevent users from changing the MAC address OUI?

When an administrator attempts to change the MAC address via standard users=
pace
tools, only one interface can be modified at a time. The driver will compar=
e the
new MAC against the existing MAC of the other port.

If the MSBs differ, the change is rejected. This makes it impossible to ato=
mically
change the OUI of both interfaces simultaneously, locking the MAC address O=
UI
to its initial probe-time value.

> +		/* According to the HW design, hw mac address MS bits
> +		 * must be the same for each net_device with the same
> +		 * LAN/WAN configuration.
> +		 */
> +		netdev_err(dev->dev, "wrong mac addr for shared GDM port\n");
> +		return -EINVAL;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-airoha-eth=
-multi-serdes-v8-0-6bd70e329df6@kernel.org?part=3D10

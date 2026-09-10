Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7541D652
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059692; cv=none; b=fNvVlM6n0dH8KfAdkebik7BVWnrzbOvQm17B9nho1FGy911cd7968dc2ME2gowU1LEQNwIP+PNY4OP0LgjCrEqwbr1Yl9Ev0UnKP35zrpZxuBpJm5OTMzVQZERaITnN0F46L3SaGx1BbpoPClmORRm+v/P0u/Jx1PH+Ow36usJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059692; c=relaxed/simple;
	bh=y9zc6uVYFe4A6is1zWq0y1EA1cz1SlBddzdQSr11cA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GS+srAsMuP8J9lXOKiklN1VMRJW6a8eGHnwJgEJJ9SOuO7a3K8Dk5wgX0gwczTy03qjabAsjZqcOxptI5xI8+xGt85qvxjvf/VdsJ2g5VSzVWMui+noMUDEU4zeTiT/qYIAWjxkvmjqAZds1JeJIo3EqGSVx/m95fUa1wGoj37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFWJBgST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFWJBgST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DCD1F00899;
	Thu, 10 Sep 2026 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059678;
	bh=mOEZotBT5p1zRt9wahxzcp2KrOa8gRJ2ZLr+DJpQfJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jFWJBgSTydFQTeLhvY1rAirSNLXNnJ8GNsq0M/Yl4qHzG6UNsLr6+tkH+SC51gxZY
	 353zcOahxy12fnxxAzTHb0YdXMP6sXpHJ3FKhwkZ5w0Ttzo90JAgDghinFUo7Sy3Nt
	 CJTJJRS3ynDvyBPORoScWT34iQJMN4QKrEOImDrTbwR6fXjkdw5x9QcrUcRTsjfruA
	 QQJRBmPM/H71tlr1FvwMvqsKYDdqdLZOin4jZl/aeIpv2mVLb/TBeSjVPSK1NQqcoC
	 LKB9AhI97yKGAJmWn+gmClbTveRjSau+NPrlqQGRhAeh5iJT1d63ZYpQzWOXVtDSIs
	 HqbUd7EZctjKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 2/4] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-ks8995-to-ksz8-v11-2-0e04411a559d@kernel.org>
References: <20260909-ks8995-to-ksz8-v11-0-0e04411a559d@kernel.org>
 <20260909-ks8995-to-ksz8-v11-2-0e04411a559d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:01:17 +0000
Message-Id: <20260910170118.03DCD1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Insufficient `.needed_headroom` causes expensive SKB reallocatio=
n on the transmission fast-path for VLAN-tagged packets.
--

commit f2aa1666092956329d185ea98c072903551a8a85
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

This commit adds a new DSA tag driver for the Micrel KS8995 switch. It=20
pushes a modified 802.1Q tag on transmission and untags it on reception,=20
incorporating any hardware-accelerated VLAN tags into the packet payload.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> index 0000000000000..f6ef1ef1891fd
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c
[ ... ]
> +static struct sk_buff *ks8995_xmit(struct sk_buff *skb, struct net_devic=
e *dev)
> +{
[ ... ]
> +	/* The switch expects the special tag at offset 12. Move any hardware
> +	 * accelerated VLAN tag into the payload so the conduit cannot insert
> +	 * it outside the special tag.
> +	 */
> +	if (unlikely(skb_vlan_tag_present(skb))) {
> +		skb =3D __vlan_hwaccel_push_inside(skb);
> +		if (!skb)
> +			return NULL;
> +	}
> +
> +	/* Always add a distinct outer tag. The user port removes this field on
> +	 * egress, so reusing an existing 802.1Q tag would consume that VLAN ta=
g.
> +	 */
> +	skb =3D vlan_insert_tag(skb, KS8995M_STPID(portmask), 0);
[ ... ]
> +static const struct dsa_device_ops ks8995_netdev_ops =3D {
> +	.name =3D KS8995_NAME,
> +	.proto	=3D DSA_TAG_PROTO_KS8995,
> +	.xmit =3D ks8995_xmit,
> +	.rcv =3D ks8995_rcv,
> +	.needed_headroom =3D VLAN_HLEN,

[Severity: Medium]
Does this code reserve enough headroom for the worst-case transmission path?

When an SKB is transmitted via ks8995_xmit() with a hardware-accelerated
VLAN tag, the driver first pushes the hardware tag into the payload via
__vlan_hwaccel_push_inside() which consumes 4 bytes of headroom. It then
inserts the custom KS8995 switch tag via vlan_insert_tag(), consuming
another 4 bytes. This requires a total of 8 bytes of headroom.

Because needed_headroom only requests 4 bytes (VLAN_HLEN), if an SKB arrives
with exactly the requested headroom (such as when forwarded from another
interface), will the second tag insertion exhaust the headroom and trigger
an expensive SKB reallocation on the fast-path?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-ks8995-to-=
ksz8-v11-0-0e04411a559d@kernel.org?part=3D2

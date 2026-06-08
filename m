Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BA138D3FD
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958535; cv=none; b=f9FwSJ+jMDHxobIs3QyMhEmyT7WQY0gW7Gdpu8v/hSQEytrJcZH64DVFBU2NAaX+z/B0vtauADYvgEFX+UKUA8t1TAA3hwDJJA6fiLYnvyveVCAycjJEVZaI7yZORuxRjXAN3SrA6lfgX10tvexvat9SeZ+XcUALUrw/NceO0z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958535; c=relaxed/simple;
	bh=ndRed4DbSqznl8J+o6xGjpEwrvqf3oNi7SlRCDXLixs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8cg3RzpL986w4xDx4htkhtnN7IU4sS3H40GSLPx77PgACcmHhl168IC9yoTw8ubsgLbC8iMwrxYJwix6V+niu6ZwJFBPX2CMg96dM1ZeuKIl2rIbsjHYphZ7upMiRmjtlNGGNoFG1DDPHej8F6wnx9Xou0ZMb7HIfBdCvnIe+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAT+G0tk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAT+G0tk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C221F00893;
	Mon,  8 Jun 2026 22:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958534;
	bh=pb4MTe7iM/DR6+BtqkKp6CNuZVCL04g8xjWFTS5ciW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAT+G0tkbwCjCOlwhW5+sb1UQz16inWdm2kc2bxzhRwl/Y3DzwHKusIyoW+LkoiV3
	 CWpUAWzY3y/nPiLtKaAaIY+DwmKDWam2kyMOR1om8mimCUnvfaNJ907YAkRKsIL7W6
	 NoMg/P0htS+WqFin0HuxtMvwnR2c5/YIytI+Mrpt+uZxhwPlEMmIeWxgYuQIspAbCi
	 +vKSAyWy4u3Ub7Y7MqJJXJwH516hF0zUzP1WEilhY02zIDTwRW8jaV4+/S8Rqr1nHE
	 a3/8SU/p5VAEGlS5yxQmyz5WD+UjNVDSsplo+mLjNzhDueFJUDRdbBttO9sEho2/fj
	 n2bce5VLZ23bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 3/5] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608-ks8995-to-ksz8-v6-3-d91eb43edcc5@kernel.org>
References: <20260608-ks8995-to-ksz8-v6-3-d91eb43edcc5@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 22:42:13 +0000
Message-Id: <20260608224213.C6C221F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Double free of the socket buffer on the error path in `ks8995_=
rcv()` when `skb_vlan_untag()` fails.
- [High] Unhandled hardware-accelerated VLAN tags bypass clearing and break=
 the required DSA tagging order on transmission.
--

commit e089d604a4cbc6ed8eab92ba9931985670f7afbe
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

The KS8995 100Mbit switch can do proper DSA per-port tagging with the proper
set-up. This adds the code to handle ingress and egress KS8995 tags.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0

[ ... ]

> +static struct sk_buff *ks8995_xmit(struct sk_buff *skb, struct net_devic=
e *dev)
> +{
> +	struct vlan_ethhdr *hdr =3D vlan_eth_hdr(skb);
> +	bool have_hwaccel_tag =3D false;
> +	u16 tci =3D 0, portmask;
> +
> +	/* Prepare the special KS8995 tags */
> +	portmask =3D dsa_xmit_port_mask(skb, dev);
> +
> +	if (skb_vlan_tag_present(skb) && skb->vlan_proto =3D=3D htons(ETH_P_802=
1Q)) {
> +		tci =3D skb_vlan_tag_get(skb);
> +		__vlan_hwaccel_clear_tag(skb);
> +		have_hwaccel_tag =3D true;
> +	}

[Severity: High]
If a packet has a different hardware-accelerated tag (e.g., 802.1ad Provider
Bridge), does it bypass this clearing logic?

The KS8995 switch architecture requires the special DSA tag (STPID) to be t=
he
first tag in the Ethernet frame immediately following the MAC addresses.

If the non-802.1Q hwaccel tag is left intact, the conduit network driver wi=
ll
insert the pending hwaccel tag immediately after the MAC addresses, placing=
 it
before the KS8995 DSA tag.

Could this cause the switch to fail to parse the DSA tag, leading to misrou=
ted
or dropped packets?

[ ... ]

> +static struct sk_buff *ks8995_rcv(struct sk_buff *skb, struct net_device=
 *dev)
> +{
> +	int portmask;
> +	u16 etype;
> +
> +	/* We are expecting all received packets to have a mangled VLAN
> +	 * TPID, so drop anything else. Because of the non-standard TPID,
> +	 * don't even bother looking for a tag in the hwaccel area.
> +	 *
> +	 * We have to inspect the ethertype directly because skb->protocol
> +	 * will contain garbage.
> +	 */
> +	etype =3D ntohs(*(__be16 *)dsa_etype_header_pos_rx(skb));
> +	if ((etype & KS8995M_STPID_STD) !=3D ETH_P_8021Q) {
> +		netdev_dbg(dev, "%s: dropped ethertype 0x%04x\n",
> +			   __func__, etype);
> +		return NULL;
> +	}
> +	netdev_dbg(dev, "%s: received ethertype %04x\n",
> +		   __func__, etype);
> +
> +	/* Move the custom DSA+VLAN tag into the hwaccel area and strip
> +	 * it from the skb head
> +	 */
> +	skb =3D skb_vlan_untag(skb);
> +	if (!skb) {
> +		netdev_err(dev, "%s: unable to untag skb\n", __func__);
> +		return NULL;
> +	}

[Severity: Critical]
Does this result in a double-free?

If skb_vlan_untag() fails, it frees the skb internally and returns NULL.
ks8995_rcv() then returns NULL to the DSA core function dsa_switch_rcv().

The API contract for the DSA .rcv callback dictates that it must not free t=
he
original skb if it returns an error (NULL), because dsa_switch_rcv() will c=
all
kfree_skb() on the original skb pointer when receiving a NULL return.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-ks8995-to-=
ksz8-v6-0-d91eb43edcc5@kernel.org?part=3D3

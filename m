Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336064;
	b=INtqa9GNhfX/DnX6PO/ZvHWphZWMnkPuI5kMS2mK9EA5R5KXSTaWTZXk6MWhXmvTbKb2
	 Pk7vo9X0ZvEPzTo5TF6Y09L4d5+LXp3DCy/4/jXTVXzdPXpEzEJ+FEWCDkvm8CEbyotnd
	 ZnITMhs/HzdI68YG1JjpnfkG7hZ7UeuKBXRqWYGTT0c3xfSmOd4+TsoJrOXAqNVt+v1Yp
	 g2vTU5IZk1fHEWHLOWdm37MzU7F8Sw7DTkOURy+f7n40Q+qvrHpXDyEz0eHam359iBLy2
	 s2gEAROP28OhuNEJeBFVjBiygdp5cTXes2hQGAO2c56JIchGJKn0jwyMIRCq5va8QkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336064;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tuMbUClXxks5QLWFVGbpFWePC7RwqSb/erdCagF3xmM=;
	b=JuJs9JySLKy6sTOHTiJq1DnTsJsHU2RwIWEVNH+6zKzrO916P8I7IAJWN3w8S7ZATk7o
	 SgOdHwLviDOU1LHA4fTgLzcoBkBt7g027kEE3CWzwARA9z007lT124H/vWmODCC8ZssxN
	 UFrnpwTPFHARFcOhjYS8rCqnlRIU2UtgKo5GtXOW5L9c0U8eWOmAUfanz/arufjf4wANH
	 cP2pPmCR+m86t6xZS4E75cFj40d531GV5GvUX5EwlQakCu6s48DfNc0H1n+ghSBA0g3LB
	 +NAEGZ4HfMJu0oQyBaBr5lSvoLZfuN35c+NNSONBhNT4L2XPprIbwsLiEae20jO8Y5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZG9Xe6G2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDDE606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZG9Xe6G2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2439A1F00A02;
	Fri, 30 Oct 2026 04:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336064;
	bh=tuMbUClXxks5QLWFVGbpFWePC7RwqSb/erdCagF3xmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZG9Xe6G2a6fJepSeSOcgPB5l5K/CRCWFDM1J2uYoBbvLl4HghHHYg0KzGbWbz607F
	 bevCZaOpjWcY+I7ESN+5scPZ/NY7C1Ueexi5eSemBTHCr3m8LAEmiB7cvPdrriNYAg
	 nP4rTXLuacCXGlYpbZqMQQd6KeXR0OWaKUZbTZNrvo5CelmvrN4uoRygj95XWYjaUD
	 jqRECGAkxYe+DuPf9qTtAM/hSk1OmKizjpXxcyUiprW3LbiV/P8ldFz3Uu4HXf4ofn
	 +ErMTC/1qfFtGs6MpCHNoQBGD9JHTL06YTJxVsLiqJSnEkKVWWNswVy3HeEYENxX1S
	 yJb0pfh+/TP1g==
Message-ID: <sashiko-outbox-190442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] net: dsa: tag_ks8995: Add the KS8995 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-ks8995-to-ksz8-v1-3-70d0ef4aa5f4@kernel.org>
References: <20260516-ks8995-to-ksz8-v1-3-70d0ef4aa5f4@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] NULL pointer dereference in ks8995_rcv() error handling.
- [High] Double-free of SKB when tag insertion or untagging fails.
- [High] Overwriting existing payload VLAN TCI with zeros for inline tagged=
 packets.
- [High] Applying ilog2() to a portmask of 0 causes undefined behavior.
- [High] Modifying a potentially shared or cloned SKB without unsharing in =
ks8995_xmit().
- [High] Modifying the VLAN header without ensuring header linearization.
--

commit 541608f5cb95c612cb3392581b43467321c30a37
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling
   =20
The KS8995 100Mbit switch can do proper DSA per-port tagging
with the proper set-up. This adds the code to handle ingress
and egress KS8995 tags.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> index 0000000000000..6ae6789751d9e
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c
> @@ -0,0 +1,134 @@
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
> +
> +	if (have_hwaccel_tag || hdr->h_vlan_proto !=3D htons(ETH_P_8021Q)) {
> +		skb =3D vlan_insert_tag(skb, KS8995M_STPID(portmask), tci);
> +		if (!skb)
> +			return NULL;

If vlan_insert_tag() fails, it consumes the original SKB and returns NULL.
If we return NULL here, will the DSA core in dsa_user_xmit() attempt to
call kfree_skb() on the original SKB pointer, leading to a double-free?

> +		hdr =3D vlan_eth_hdr(skb);
> +		netdev_dbg(dev, "%s: inserted VLAN TAG %04x TCI %04x\n",
> +			   __func__, hdr->h_vlan_proto, hdr->h_vlan_TCI);
> +	} else {
> +		/* VLAN tag already exists in skb head, modify it in place */
> +		hdr =3D vlan_eth_hdr(skb);
> +		hdr->h_vlan_proto =3D KS8995M_STPID(portmask);
> +		hdr->h_vlan_TCI =3D htons(tci);

Since tci is initialized to 0 and not updated with the existing packet's TCI
when there is no hwaccel tag, does this blindly overwrite the packet's valid
VLAN ID and priority (PCP) with 0?

Also, the code directly modifies the VLAN header here without checking
skb_shared() or skb_cloned(), or calling skb_cow_head(). Can this corrupt
data for other users of the same SKB, such as packet sniffers?

Furthermore, is it safe to modify the VLAN header here without verifying th=
at
the header is in the linear part of the SKB? If the VLAN tag resides in pag=
ed
fragments, will writing to these fields corrupt memory out-of-bounds of the
linear buffer? Should there be a call to pskb_may_pull() or
skb_ensure_writable()?

> +		netdev_dbg(dev, "%s: modified VLAN TAG %04x TCI %04x\n",
> +			   __func__, hdr->h_vlan_proto, hdr->h_vlan_TCI);
> +	}
> +
> +	return skb;
> +}
> +
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
> +	etype =3D ntohs(*(u16 *)dsa_etype_header_pos_rx(skb));
> +	if ((etype & KS8995M_STPID_STD) !=3D ETH_P_8021Q) {
> +		netdev_info(dev, "%s: dropped ethertype 0x%04x\n",
> +			    __func__, etype);
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
> +		netdev_err(dev, "%s: unable to untag protocol %04x vlan protocol  %04x=
\n",
> +			   __func__, ntohs(skb->protocol), ntohs(skb->vlan_proto));

If skb_vlan_untag() fails, it internally frees the SKB and returns NULL, wh=
ich
is assigned to skb. Does dereferencing skb->protocol and skb->vlan_proto
in the netdev_err() call here cause a NULL pointer dereference?

Additionally, if we return NULL here after skb_vlan_untag() has already
freed the SKB, will the DSA core in dsa_switch_rcv() attempt to free it
again, leading to a double-free?

> +		return NULL;
> +	}
> +
> +	portmask =3D FIELD_GET(KS8995M_STPID_PORTMASK, etype);
> +	netdev_dbg(dev, "%s: etype %04x portmask %04x (%d)\n",
> +		   __func__, etype, portmask, ilog2(portmask));

The ethertype validation allows a standard 802.1Q tag (0x8100) to pass, sin=
ce
0x8100 & 0xFFF0 =3D=3D 0x8100. If this happens, portmask will be 0.
Will unconditionally calling ilog2(portmask) with a value of 0 cause
undefined behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-ks8995-to-=
ksz8-v1-0-70d0ef4aa5f4@kernel.org?part=3D3

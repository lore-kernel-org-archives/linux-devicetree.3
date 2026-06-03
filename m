Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625035E948
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528284; cv=none; b=HJjOOgnGEpHxG3VLYtMgH9WSCWuRZUQuxkPQ8fhAPo3sAHzygL5hitUXrnLI4RX/nIgb1Li2N05zHuVGCI5QzR/ckAlz6FRcz9obc77m0LDm9IkZKlvjmBYTRpf6OwfcOIojLybfZeVTdopux7ys52GqXyy8wXaJ9a5/HM+nLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528284; c=relaxed/simple;
	bh=dyWaiOaiP+fBkM4tQ/wUNQhOz5llIYrH01IbBTRSX/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jrpisUIc78cfYXyELk4DsmHVcp1ykd8ruC/d6IXoYlIwFI6Pi0zPoMl3JcTdwRow3aUenSFFOwvwaEBsuqqDBS0leWGIP3Yfr2nw9H6BRNwnpAICKrSwAt9f2ADiOPj6wz462KkEVJop2dm0GDpdrb9IT++IfrHjLlA8XjcDU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIwzaMEs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIwzaMEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AACF1F00898;
	Wed,  3 Jun 2026 23:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780528283;
	bh=vHxvcihsNpAdd3mbaIDhXBaLBeiXK2P/1aQfBEDwi8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIwzaMEst8knRucVwtbIq8QPgBtFydeoSSnGnE1d/ROplyLiZnyFWLAA3sJsBVc46
	 JAhl4Yo2MoEQZauLKrlQQ9cOoqZWWR7TD8IlDE8Y3wNFlxA4YTy0VXi0hB43XZv75i
	 sfCav/y6v4bop13ZrKbcRGPTMJWeBRuUVOVJhUy1krzonHDsefuLC4uDre5+lnByJZ
	 6BZmtJOGJUa62W1g8BfKY9+/JeZmejAuys3sYyV0z5c4y7eDRhkGiww615tjBaZ+Ia
	 gibBt7imP3UlaP2Zgvgdj8Y+IY43z9bPvM2fwOK/REkRec9ACmL12rE72kh5ILZXZX
	 30gAjuyen8Nfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/5] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-ks8995-to-ksz8-v4-3-e15149ef21e7@kernel.org>
References: <20260603-ks8995-to-ksz8-v4-3-e15149ef21e7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 23:11:22 +0000
Message-Id: <20260603231123.5AACF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Returning NULL from `ks8995_xmit()` after `vlan_insert_tag()` fail=
s causes a double free in the DSA core.
- [High] Returning NULL from `ks8995_rcv()` after `skb_vlan_untag()` fails =
causes a double free in the DSA core.
- [Medium] `ks8995_xmit()` fails to clear 802.1ad hardware-accelerated VLAN=
 tags, causing corrupted tag order on the wire.
- [Low] Unvalidated portmask can cause undefined behavior via `ilog2(0)` fo=
r untagged `0x8100` management packets.
--

commit 8a732a10d6f1205df5b3687abb422f16fbcd2942
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

The KS8995 100Mbit switch can do proper DSA per-port tagging
with the proper set-up. This adds the code to handle ingress
and egress KS8995 tags.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c

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

[Severity: Medium]
Does this code intentionally ignore 802.1ad hardware-accelerated VLAN tags?

If the packet contains a valid 802.1ad tag, it appears the hwaccel tag is n=
ot
cleared here. Later, the MAC driver might prepend the uncleared 802.1ad tag
before the STPID tag, which could break the switch's expectation that the
STPID tag is the first tag after the MAC addresses.

> +		tci =3D skb_vlan_tag_get(skb);
> +		__vlan_hwaccel_clear_tag(skb);
> +		have_hwaccel_tag =3D true;
> +	}
> +
> +	if (have_hwaccel_tag || hdr->h_vlan_proto !=3D htons(ETH_P_8021Q)) {
> +		skb =3D vlan_insert_tag(skb, KS8995M_STPID(portmask), tci);
> +		if (!skb)
> +			return NULL;

[Severity: High]
Can returning NULL here lead to a double free in the DSA core?

The vlan_insert_tag() function consumes and frees the skb on allocation
failure before returning NULL. If ks8995_xmit() propagates this NULL back
to the caller:

dsa_user_xmit()
    nskb =3D p->xmit(skb, dev);
    if (!nskb) {
        kfree_skb(skb);
        return NETDEV_TX_OK;
    }
   =20
Won't dsa_user_xmit() unconditionally execute kfree_skb() on the original s=
kb
pointer, freeing it a second time?

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

[Severity: High]
Could returning NULL after skb_vlan_untag() fails cause a double free?

The skb_vlan_untag() function frees the skb internally if it encounters
an error, such as a failure in pskb_may_pull(). If this function returns
NULL to the DSA core:

dsa_switch_rcv()
    nskb =3D cpu_dp->rcv(skb, dev);
    if (!nskb) {
        kfree_skb(skb);
        return 0;
    }

Will the caller unconditionally execute kfree_skb() on the original skb
pointer that was already freed by skb_vlan_untag()?

> +	}
> +
> +	portmask =3D FIELD_GET(KS8995M_STPID_PORTMASK, etype);
> +	netdev_dbg(dev, "%s: etype %04x portmask %04x (%d)\n",
> +		   __func__, etype, portmask, ilog2(portmask));
> +	skb->dev =3D dsa_conduit_find_user(dev, 0, ilog2(portmask));

[Severity: Low]
Is it possible for portmask to be 0 here?

If an unmodified 802.1Q frame arrives at the management port with standard
TPID 0x8100 and no STPID port bits set, the earlier validation passes, and
the portmask extracted from the lower nibble evaluates to 0.

While the kernel's ilog2 macro safely evaluates ilog2(0) to -1, passing 0
to ilog2() is technically undefined behavior in C. Would it be better to
validate portmask before passing it to ilog2() and dsa_conduit_find_user()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-ks8995-to-=
ksz8-v4-0-e15149ef21e7@kernel.org?part=3D3

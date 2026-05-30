Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B73257851
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102142; cv=none; b=AlfF53Jg3aSOdfiuAPB4IDzimKELNIaUD0Up7y5Xh9y0/wT15fim4+8AG+3C0ce8hyh7CW3jXrHBjdKWwD8wCBzrx1bRDbjySyUs5HstFCW7lkMkRVZoeOWNwhZ8/v7rm53xSrdYgQBq7Z6YnfJVQx+22bS/YlEuXw06cYXvyko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102142; c=relaxed/simple;
	bh=npaPZ389PkiMZoeZpfu/OLc6msU4Z/1OHfhqX4tTguQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=li7NVtJ0Z2wn2kwarA1yBoDs63K6Pd2tjgYQ4TiZt84mwHie192NsUCsL63sZYorsXdHaHT3V+idr8auU4+kT++JIS/LfbZ9pitnZq98lsyUPva2KJ7dVpGau6wKBenE4jECD33pO+jEwRFwEFZTDD1CBK4DTyM1MbYeQw4gxTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2rAGPPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2rAGPPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E6C1F00898;
	Sat, 30 May 2026 00:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102141;
	bh=2ZhEfWizOIQJkKmHke9PPmbKlIwtTCtqh2YO50NaI2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F2rAGPPdfikp/l+S58dRm6hOxF/u63OnNAgj+VdnNuqKlTHbBzj3t1nNxtn967ITk
	 n+OOumQiCcIOtx+523mm0N08yZDEQRnhflKezB6k+vcptZm2kEdYALaPxZXE5yebj9
	 VhTdgJU2YbJti3E1/4Dw9a0hTHH5qJmhrbOVrnZ9nW9PrwgJM18FI39BTyqd23Qyij
	 UAomICWTIwqRHQ5HNzNBnj8KUH1WtzgJM7/xgZYpQMjoR913mK9D9bytqB23uP6Pkz
	 6n1gDR7bRkz+Erl6FKXTzr5DsDgmUq8YC8/Wagxdm5KGDloJNiLx3B1fk/DqQAWp6o
	 uKp1z7P9OGrbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/5] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-ks8995-to-ksz8-v3-3-c530f651989f@kernel.org>
References: <20260526-ks8995-to-ksz8-v3-3-c530f651989f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:00 +0000
Message-Id: <20260530004901.49E6C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Double free in ks8995_xmit() error path when vlan_insert_tag() fai=
ls.
- [High] Double free in ks8995_rcv() error path when skb_vlan_untag() fails.
- [High] Undefined behavior from ilog2(0) when receiving standard 802.1Q fr=
ames.
- [High] Failure to push non-802.1Q hardware-accelerated VLAN tags into the=
 payload.
--

commit 0b9e2806259ede96c62f73af014408284f18d9b2
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling
   =20
The KS8995 100Mbit switch can do proper DSA per-port tagging with the proper
set-up. This adds the code to handle ingress and egress KS8995 tags.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> index 0000000000000..5bdb182715827
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
> +		tci =3D skb_vlan_tag_get(skb);
> +		__vlan_hwaccel_clear_tag(skb);
> +		have_hwaccel_tag =3D true;
> +	}

[Severity: High]
Does this properly handle non-802.1Q hardware-accelerated VLAN tags like
802.1AD?

If an 802.1AD tag is present, it appears the tag is left in the hwaccel area
and the KS8995 special tag is pushed into the payload. The host NIC might
then push the 802.1AD tag onto the wire outside the KS8995 tag, which would
prevent the switch from seeing its special tag as the outermost ethertype.

> +
> +	if (have_hwaccel_tag || hdr->h_vlan_proto !=3D htons(ETH_P_8021Q)) {
> +		skb =3D vlan_insert_tag(skb, KS8995M_STPID(portmask), tci);
> +		if (!skb)
> +			return NULL;

[Severity: High]
Will returning NULL here cause a double-free?

When vlan_insert_tag() fails to allocate memory, it frees the original skb
internally and returns NULL. ks8995_xmit() then propagates this NULL back to
dsa_user_xmit(). Since dsa_user_xmit() explicitly calls kfree_skb(skb) when
the tagger returns NULL, won't this result in freeing the same skb twice?

[ ... ]
> +static struct sk_buff *ks8995_rcv(struct sk_buff *skb, struct net_device=
 *dev)
> +{
> +	int portmask;
> +	u16 etype;
[ ... ]
> +	/* Move the custom DSA+VLAN tag into the hwaccel area and strip
> +	 * it from the skb head
> +	 */
> +	skb =3D skb_vlan_untag(skb);
> +	if (!skb) {
> +		netdev_err(dev, "%s: unable to untag skb\n", __func__);
> +		return NULL;
> +	}

[Severity: High]
Could this also lead to a double-free if skb_vlan_untag() fails?

If skb_vlan_untag() fails, it internally frees the SKB and returns NULL.
ks8995_rcv() propagates this NULL back to dsa_switch_rcv(). The DSA receive
core interprets a NULL return from a tagger as an unhandled packet and
explicitly calls kfree_skb(skb) on the original pointer.

> +
> +	portmask =3D FIELD_GET(KS8995M_STPID_PORTMASK, etype);
> +	netdev_dbg(dev, "%s: etype %04x portmask %04x (%d)\n",
> +		   __func__, etype, portmask, ilog2(portmask));
> +	skb->dev =3D dsa_conduit_find_user(dev, 0, ilog2(portmask));

[Severity: High]
Does this trigger undefined behavior when receiving standard 802.1Q frames?

Standard 802.1Q frames with ethertype 0x8100 pass the earlier=20
(etype & KS8995M_STPID_STD) !=3D ETH_P_8021Q check because the standard VLAN
ethertype matches the mask 0xFFF0. This yields a portmask of 0. Calling
ilog2(0) is mathematically undefined behavior and invokes __builtin_clzll(0=
),
which can cause hardware exceptions or return unpredictable values depending
on the architecture.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-ks8995-to-=
ksz8-v3-0-c530f651989f@kernel.org?part=3D3
